import { computed, ref, defineComponent, mergeProps, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrInterpolate, ssrRenderSlot } from 'vue/server-renderer';
import { defineStore } from 'pinia';
import { a as useSupabaseClient, P as ParticipantStatus, h as ParticipantRole, R as RoomStatus } from './server.mjs';

const _sfc_main$1 = /* @__PURE__ */ defineComponent({
  __name: "ErrorMessage",
  __ssrInlineRender: true,
  props: {
    title: { default: "Something went wrong" },
    message: {},
    retryable: { type: Boolean, default: true }
  },
  emits: ["retry"],
  setup(__props, { emit: __emit }) {
    return (_ctx, _push, _parent, _attrs) => {
      _push(`<div${ssrRenderAttrs(mergeProps({
        class: "flex flex-col items-center justify-center gap-4 rounded-2xl border border-red-900/50 bg-red-950/20 px-4 py-8 text-center",
        role: "alert"
      }, _attrs))}><div class="flex h-12 w-12 items-center justify-center rounded-full bg-red-900/30"><span class="text-xl text-red-400">!</span></div><div class="space-y-1"><h3 class="text-base font-semibold text-red-300">${ssrInterpolate(__props.title)}</h3><p class="text-sm text-red-400/80">${ssrInterpolate(__props.message)}</p></div>`);
      if (__props.retryable) {
        _push(`<button class="rounded-lg bg-red-900/30 px-4 py-2 text-sm font-medium text-red-300 transition-colors hover:bg-red-900/50"> Try again </button>`);
      } else {
        _push(`<!---->`);
      }
      _push(`</div>`);
    };
  }
});
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("shared/components/ErrorMessage.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_2 = Object.assign(_sfc_main$1, { __name: "ErrorMessage" });
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "EmptyState",
  __ssrInlineRender: true,
  props: {
    icon: {},
    title: {},
    description: {}
  },
  setup(__props) {
    return (_ctx, _push, _parent, _attrs) => {
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col items-center justify-center gap-4 px-4 py-12 text-center" }, _attrs))}><div class="flex h-16 w-16 items-center justify-center rounded-2xl bg-slate-800">`);
      ssrRenderSlot(_ctx.$slots, "icon", {}, () => {
        _push(`<span class="text-2xl text-slate-400">${ssrInterpolate(__props.icon)}</span>`);
      }, _push, _parent);
      _push(`</div><div class="space-y-1"><h3 class="text-lg font-semibold text-slate-100">${ssrInterpolate(__props.title)}</h3>`);
      if (__props.description) {
        _push(`<p class="text-sm text-slate-400">${ssrInterpolate(__props.description)}</p>`);
      } else {
        _push(`<!---->`);
      }
      _push(`</div>`);
      ssrRenderSlot(_ctx.$slots, "default", {}, null, _push, _parent);
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("shared/components/EmptyState.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const __nuxt_component_4 = Object.assign(_sfc_main, { __name: "EmptyState" });
const useRoomsStore = defineStore("rooms", () => {
  const rooms = ref([]);
  const currentRoom = ref(null);
  const participants = ref([]);
  const loading = ref(false);
  const error = ref(null);
  function setRooms(newRooms) {
    rooms.value = newRooms;
  }
  function setCurrentRoom(room) {
    currentRoom.value = room;
  }
  function setParticipants(newParticipants) {
    participants.value = newParticipants;
  }
  function addParticipant(participant) {
    const exists = participants.value.find((p) => p.id === participant.id);
    if (!exists) {
      participants.value.push(participant);
    }
  }
  function removeParticipant(profileId) {
    const participant = participants.value.find((p) => p.profileId === profileId);
    if (participant) {
      participant.status = ParticipantStatus.LEFT;
    }
  }
  function setLoading(value) {
    loading.value = value;
  }
  function setError(value) {
    error.value = value;
  }
  function clearRoom() {
    currentRoom.value = null;
    participants.value = [];
  }
  return {
    rooms,
    currentRoom,
    participants,
    loading,
    error,
    setRooms,
    setCurrentRoom,
    setParticipants,
    addParticipant,
    removeParticipant,
    setLoading,
    setError,
    clearRoom
  };
});
const roomsRepository = {
  async createRoom(client, data) {
    const { data: room, error } = await client.from("rooms").insert(data).select().single();
    if (error) {
      throw new Error(`Failed to create room: ${error.message}`);
    }
    return room;
  },
  async getRoomById(client, id) {
    const { data } = await client.from("rooms").select().eq("id", id).maybeSingle();
    return data;
  },
  async getRoomByCode(client, code) {
    const { data } = await client.from("rooms").select().eq("code", code).maybeSingle();
    return data;
  },
  async getActiveRooms(client) {
    const { data } = await client.from("rooms").select().in("status", [RoomStatus.WAITING, RoomStatus.ACTIVE]).order("created_at", { ascending: false });
    return data ?? [];
  },
  async updateRoom(client, id, data) {
    const { error } = await client.from("rooms").update(data).eq("id", id);
    if (error) {
      throw new Error(`Failed to update room: ${error.message}`);
    }
  },
  async deleteRoom(client, id) {
    const { error } = await client.from("rooms").delete().eq("id", id);
    if (error) {
      throw new Error(`Failed to delete room: ${error.message}`);
    }
  },
  async addParticipant(client, data) {
    const { data: participant, error } = await client.from("participants").insert(data).select().single();
    if (error) {
      throw new Error(`Failed to join room: ${error.message}`);
    }
    return participant;
  },
  async getParticipantsByRoomId(client, roomId) {
    const { data } = await client.from("participants").select("*, profiles(name, avatar_url)").eq("room_id", roomId).order("joined_at", { ascending: true });
    return data ?? [];
  },
  async getParticipantByProfileAndRoom(client, profileId, roomId) {
    const { data } = await client.from("participants").select().eq("profile_id", profileId).eq("room_id", roomId).maybeSingle();
    return data;
  },
  async updateParticipantStatus(client, id, status) {
    const { error } = await client.from("participants").update({ status }).eq("id", id);
    if (error) {
      throw new Error(`Failed to update participant status: ${error.message}`);
    }
  },
  async removeParticipant(client, id) {
    const { error } = await client.from("participants").update({
      status: ParticipantStatus.LEFT,
      left_at: (/* @__PURE__ */ new Date()).toISOString()
    }).eq("id", id);
    if (error) {
      throw new Error(`Failed to leave room: ${error.message}`);
    }
  },
  async getParticipantCount(client, roomId) {
    const { count, error } = await client.from("participants").select("*", { count: "exact", head: true }).eq("room_id", roomId).in("status", [ParticipantStatus.ONLINE, ParticipantStatus.AWAY]);
    if (error) {
      throw new Error(`Failed to get participant count: ${error.message}`);
    }
    return count ?? 0;
  },
  async subscribeToRoomParticipants(client, roomId, callback) {
    return client.channel(`room:${roomId}`).on(
      "postgres_changes",
      {
        event: "*",
        schema: "public",
        table: "participants",
        filter: `room_id=eq.${roomId}`
      },
      callback
    ).subscribe();
  },
  async subscribeToRoomChanges(client, roomId, callback) {
    return client.channel(`room:${roomId}`).on(
      "postgres_changes",
      {
        event: "*",
        schema: "public",
        table: "rooms",
        filter: `id=eq.${roomId}`
      },
      callback
    ).subscribe();
  },
  generateRoomCode() {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    let code = "";
    for (let i = 0; i < 6; i++) {
      code += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return code;
  }
};
const roomsService = {
  async createRoom(client, input, profileId) {
    let code = roomsRepository.generateRoomCode();
    let existing = await roomsRepository.getRoomByCode(client, code);
    while (existing) {
      code = roomsRepository.generateRoomCode();
      existing = await roomsRepository.getRoomByCode(client, code);
    }
    const room = await roomsRepository.createRoom(client, {
      host_id: profileId,
      name: input.name,
      code,
      language_id: input.languageId,
      topic_id: input.topicId,
      level_id: input.levelId,
      turn_duration: input.turnDuration ?? 60,
      max_participants: input.maxParticipants ?? 8,
      status: RoomStatus.WAITING
    });
    await roomsRepository.addParticipant(client, {
      room_id: room.id,
      profile_id: profileId,
      role: ParticipantRole.HOST,
      status: ParticipantStatus.ONLINE
    });
    return this.mapRoom(room);
  },
  async joinRoom(client, code, profileId) {
    const room = await roomsRepository.getRoomByCode(client, code.toUpperCase());
    if (!room) {
      throw new Error("Room not found");
    }
    if (room.status !== RoomStatus.WAITING) {
      throw new Error("Room is no longer accepting participants");
    }
    const existingParticipant = await roomsRepository.getParticipantByProfileAndRoom(
      client,
      profileId,
      room.id
    );
    if (existingParticipant) {
      if (existingParticipant.status === ParticipantStatus.LEFT) {
        await roomsRepository.updateParticipantStatus(
          client,
          existingParticipant.id,
          ParticipantStatus.ONLINE
        );
      }
      return this.mapRoom(room);
    }
    const count = await roomsRepository.getParticipantCount(client, room.id);
    if (count >= room.max_participants) {
      throw new Error("Room is full");
    }
    await roomsRepository.addParticipant(client, {
      room_id: room.id,
      profile_id: profileId,
      role: ParticipantRole.PARTICIPANT,
      status: ParticipantStatus.ONLINE
    });
    return this.mapRoom(room);
  },
  async leaveRoom(client, roomId, profileId) {
    const participant = await roomsRepository.getParticipantByProfileAndRoom(
      client,
      profileId,
      roomId
    );
    if (!participant) {
      throw new Error("You are not in this room");
    }
    if (participant.role === ParticipantRole.HOST) {
      await roomsRepository.deleteRoom(client, roomId);
      return;
    }
    await roomsRepository.removeParticipant(client, participant.id);
  },
  async getRoomById(client, id) {
    const room = await roomsRepository.getRoomById(client, id);
    if (!room) return null;
    return this.mapRoom(room);
  },
  async getActiveRooms(client) {
    const rooms = await roomsRepository.getActiveRooms(client);
    return rooms.map((room) => this.mapRoom(room));
  },
  async getParticipants(client, roomId) {
    const participants = await roomsRepository.getParticipantsByRoomId(client, roomId);
    return participants.map((p) => ({
      id: p.id,
      roomId: p.room_id,
      profileId: p.profile_id,
      name: p.profiles?.name ?? "Unknown",
      avatarUrl: p.profiles?.avatar_url ?? null,
      role: p.role,
      status: p.status,
      joinedAt: p.joined_at
    }));
  },
  async updateRoomSettings(client, roomId, profileId, settings) {
    const room = await roomsRepository.getRoomById(client, roomId);
    if (!room) {
      throw new Error("Room not found");
    }
    if (room.host_id !== profileId) {
      throw new Error("Only the host can update room settings");
    }
    const updates = {};
    if (settings.name !== void 0) updates.name = settings.name;
    if (settings.turnDuration !== void 0) updates.turn_duration = settings.turnDuration;
    if (settings.maxParticipants !== void 0) updates.max_participants = settings.maxParticipants;
    await roomsRepository.updateRoom(client, roomId, updates);
  },
  async subscribeToParticipants(client, roomId, callback) {
    return roomsRepository.subscribeToRoomParticipants(client, roomId, async () => {
      const participants = await this.getParticipants(client, roomId);
      callback(participants);
    });
  },
  async subscribeToRoom(client, roomId, callback) {
    return roomsRepository.subscribeToRoomChanges(client, roomId, async () => {
      const room = await this.getRoomById(client, roomId);
      if (room) {
        callback(room);
      }
    });
  },
  mapRoom(room) {
    return {
      id: room.id,
      name: room.name,
      code: room.code,
      status: room.status,
      languageId: room.language_id,
      topicId: room.topic_id,
      levelId: room.level_id,
      hostId: room.host_id,
      hostName: room.profiles?.name ?? "",
      languageName: room.languages?.name ?? "",
      topicName: room.topics?.name ?? "",
      levelName: room.levels?.name ?? "",
      turnDuration: room.turn_duration,
      maxParticipants: room.max_participants,
      participantCount: room.participant_count ?? 0,
      createdAt: room.created_at,
      updatedAt: room.updated_at
    };
  }
};
function useRooms() {
  const supabase = useSupabaseClient();
  const store = useRoomsStore();
  let participantsSubscription = null;
  let roomSubscription = null;
  async function getProfileId() {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) throw new Error("You must be logged in");
    const { data: profile } = await supabase.from("profiles").select("id").eq("auth_user_id", user.id).single();
    if (!profile) throw new Error("Profile not found");
    return profile.id;
  }
  async function createRoom(input) {
    store.setLoading(true);
    store.setError(null);
    try {
      const profileId = await getProfileId();
      const room = await roomsService.createRoom(supabase, input, profileId);
      store.setCurrentRoom(room);
      return room;
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to create room";
      store.setError(message);
      throw err;
    } finally {
      store.setLoading(false);
    }
  }
  async function joinRoom(code) {
    store.setLoading(true);
    store.setError(null);
    try {
      const profileId = await getProfileId();
      const room = await roomsService.joinRoom(supabase, code, profileId);
      store.setCurrentRoom(room);
      return room;
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to join room";
      store.setError(message);
      throw err;
    } finally {
      store.setLoading(false);
    }
  }
  async function leaveRoom(roomId) {
    store.setLoading(true);
    store.setError(null);
    try {
      const profileId = await getProfileId();
      await roomsService.leaveRoom(supabase, roomId, profileId);
      unsubscribe();
      store.clearRoom();
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to leave room";
      store.setError(message);
      throw err;
    } finally {
      store.setLoading(false);
    }
  }
  async function loadRoom(id) {
    store.setLoading(true);
    store.setError(null);
    try {
      const room = await roomsService.getRoomById(supabase, id);
      store.setCurrentRoom(room);
      if (room) {
        const participants = await roomsService.getParticipants(supabase, id);
        store.setParticipants(participants);
      }
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to load room";
      store.setError(message);
    } finally {
      store.setLoading(false);
    }
  }
  async function loadActiveRooms() {
    store.setLoading(true);
    store.setError(null);
    try {
      const rooms = await roomsService.getActiveRooms(supabase);
      store.setRooms(rooms);
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to load rooms";
      store.setError(message);
    } finally {
      store.setLoading(false);
    }
  }
  async function updateRoomSettings(roomId, settings) {
    store.setError(null);
    try {
      const profileId = await getProfileId();
      await roomsService.updateRoomSettings(supabase, roomId, profileId, settings);
      await loadRoom(roomId);
    } catch (err) {
      const message = err instanceof Error ? err.message : "Failed to update room settings";
      store.setError(message);
      throw err;
    }
  }
  function subscribeToParticipants(roomId) {
    if (participantsSubscription) {
      participantsSubscription.unsubscribe();
    }
    roomsService.subscribeToParticipants(supabase, roomId, (participants) => {
      store.setParticipants(participants);
    }).then((subscription) => {
      participantsSubscription = subscription;
    });
  }
  function subscribeToRoom(roomId) {
    if (roomSubscription) {
      roomSubscription.unsubscribe();
    }
    roomsService.subscribeToRoom(supabase, roomId, (room) => {
      store.setCurrentRoom(room);
    }).then((subscription) => {
      roomSubscription = subscription;
    });
  }
  function unsubscribe() {
    if (participantsSubscription) {
      participantsSubscription.unsubscribe();
      participantsSubscription = null;
    }
    if (roomSubscription) {
      roomSubscription.unsubscribe();
      roomSubscription = null;
    }
  }
  return {
    rooms: computed(() => store.rooms),
    currentRoom: computed(() => store.currentRoom),
    participants: computed(() => store.participants),
    loading: computed(() => store.loading),
    error: computed(() => store.error),
    createRoom,
    joinRoom,
    leaveRoom,
    loadRoom,
    loadActiveRooms,
    updateRoomSettings,
    subscribeToParticipants,
    subscribeToRoom,
    unsubscribe
  };
}

export { __nuxt_component_2 as _, __nuxt_component_4 as a, useRooms as u };
//# sourceMappingURL=useRooms-rcc0CV93.mjs.map
