import { _ as __nuxt_component_1 } from './LoadingSpinner-BhnzeBaj.mjs';
import { u as useRooms, _ as __nuxt_component_2, a as __nuxt_component_4 } from './useRooms-rcc0CV93.mjs';
import { u as useRoute, a as useSupabaseClient, _ as __nuxt_component_0, n as navigateTo } from './server.mjs';
import { defineComponent, ref, watch, computed, resolveComponent, mergeProps, unref, withCtx, createTextVNode, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent, ssrInterpolate, ssrRenderList, ssrRenderClass, ssrRenderAttr } from 'vue/server-renderer';
import 'pinia';
import '../nitro/nitro.mjs';
import 'node:http';
import 'node:https';
import 'node:events';
import 'node:buffer';
import 'node:fs';
import 'node:path';
import 'node:crypto';
import '../routes/renderer.mjs';
import 'vue-bundle-renderer/runtime';
import 'unhead/server';
import 'devalue';
import 'unhead/utils';
import 'vue-router';
import 'class-variance-authority';
import 'clsx';
import 'tailwind-merge';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "[id]",
  __ssrInlineRender: true,
  setup(__props) {
    const route = useRoute();
    const roomId = route.params.id;
    const {
      currentRoom,
      participants,
      loading,
      error,
      leaveRoom
    } = useRooms();
    const showSettings = ref(false);
    const showQRCode = ref(false);
    const isHost = ref(false);
    watch(currentRoom, (room) => {
      if (room) {
        checkIsHost();
      }
    });
    async function checkIsHost() {
      const supabase = useSupabaseClient();
      const { data: { user } } = await supabase.auth.getUser();
      if (user && currentRoom.value) {
        const { data: profile } = await supabase.from("profiles").select("id").eq("auth_user_id", user.id).single();
        if (profile) {
          isHost.value = profile.id === currentRoom.value.hostId;
        }
      }
    }
    async function handleLeave() {
      try {
        await leaveRoom(roomId);
        navigateTo("/rooms");
      } catch {
      }
    }
    const onlineParticipants = computed(
      () => participants.value.filter((p) => p.status === "online" || p.status === "away")
    );
    const host = computed(
      () => participants.value.find((p) => p.role === "host")
    );
    return (_ctx, _push, _parent, _attrs) => {
      const _component_LoadingSpinner = __nuxt_component_1;
      const _component_ErrorMessage = __nuxt_component_2;
      const _component_Button = __nuxt_component_0;
      const _component_EmptyState = __nuxt_component_4;
      const _component_QRCode = resolveComponent("QRCode");
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-1 flex-col gap-4 py-6" }, _attrs))}>`);
      if (unref(loading)) {
        _push(`<div class="flex justify-center py-12">`);
        _push(ssrRenderComponent(_component_LoadingSpinner, { size: "lg" }, null, _parent));
        _push(`</div>`);
      } else if (unref(error)) {
        _push(`<div class="py-8">`);
        _push(ssrRenderComponent(_component_ErrorMessage, { message: unref(error) }, null, _parent));
        _push(`</div>`);
      } else if (unref(currentRoom)) {
        _push(`<!--[--><div class="flex items-center justify-between"><div><h2 class="text-xl font-semibold text-slate-100">${ssrInterpolate(unref(currentRoom).name)}</h2><p class="mt-1 text-sm text-slate-400">${ssrInterpolate(unref(currentRoom).languageName)} · ${ssrInterpolate(unref(currentRoom).topicName)} · ${ssrInterpolate(unref(currentRoom).levelName)}</p></div><div class="flex gap-2">`);
        if (unref(isHost)) {
          _push(ssrRenderComponent(_component_Button, {
            variant: "outline",
            size: "sm",
            onClick: ($event) => showSettings.value = true
          }, {
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(` Settings `);
              } else {
                return [
                  createTextVNode(" Settings ")
                ];
              }
            }),
            _: 1
          }, _parent));
        } else {
          _push(`<!---->`);
        }
        _push(ssrRenderComponent(_component_Button, {
          variant: "outline",
          size: "sm",
          onClick: ($event) => showQRCode.value = true
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(` QR Code `);
            } else {
              return [
                createTextVNode(" QR Code ")
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(ssrRenderComponent(_component_Button, {
          variant: "ghost",
          size: "sm",
          class: "text-red-400 hover:text-red-300",
          onClick: handleLeave
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(` Leave `);
            } else {
              return [
                createTextVNode(" Leave ")
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`</div></div><div class="rounded-xl bg-slate-800 p-4"><div class="flex items-center justify-between"><div><p class="text-sm text-slate-400">Room Code</p><p class="mt-1 text-2xl font-bold tracking-widest text-primary-400">${ssrInterpolate(unref(currentRoom).code)}</p></div><div class="text-right"><p class="text-sm text-slate-400">Status</p><span class="mt-1 inline-block rounded-full bg-green-600/20 px-3 py-1 text-sm text-green-400">${ssrInterpolate(unref(currentRoom).status)}</span></div></div><div class="mt-4 grid grid-cols-2 gap-4 border-t border-slate-700 pt-4"><div><p class="text-xs text-slate-500">Turn Duration</p><p class="text-sm text-slate-300">${ssrInterpolate(unref(currentRoom).turnDuration)}s</p></div><div><p class="text-xs text-slate-500">Participants</p><p class="text-sm text-slate-300">${ssrInterpolate(unref(onlineParticipants).length)}/${ssrInterpolate(unref(currentRoom).maxParticipants)}</p></div><div><p class="text-xs text-slate-500">Host</p><p class="text-sm text-slate-300">${ssrInterpolate(unref(host)?.name ?? unref(currentRoom).hostName)}</p></div><div><p class="text-xs text-slate-500">Created</p><p class="text-sm text-slate-300">${ssrInterpolate(new Date(unref(currentRoom).createdAt).toLocaleDateString())}</p></div></div></div><div><h3 class="mb-3 text-sm font-medium text-slate-400"> Participants (${ssrInterpolate(unref(onlineParticipants).length)}) </h3>`);
        if (unref(participants).length === 0) {
          _push(`<div class="py-8">`);
          _push(ssrRenderComponent(_component_EmptyState, {
            title: "No participants yet",
            description: "Share the room code to invite others"
          }, null, _parent));
          _push(`</div>`);
        } else {
          _push(`<div class="flex flex-col gap-2"><!--[-->`);
          ssrRenderList(unref(participants), (participant) => {
            _push(`<div class="flex items-center gap-3 rounded-xl bg-slate-800 p-3"><div class="relative flex h-10 w-10 items-center justify-center rounded-full bg-slate-700"><span class="text-sm font-medium text-slate-300">${ssrInterpolate(participant.name.charAt(0))}</span><span class="${ssrRenderClass([
              "absolute -right-0.5 -top-0.5 h-3 w-3 rounded-full border-2 border-slate-800",
              participant.status === "online" ? "bg-green-500" : participant.status === "away" ? "bg-yellow-500" : "bg-slate-500"
            ])}"></span></div><div class="flex-1"><p class="text-sm font-medium text-slate-100">${ssrInterpolate(participant.name)}</p><p class="text-xs text-slate-500">${ssrInterpolate(participant.role === "host" ? "Host" : "Participant")}</p></div></div>`);
          });
          _push(`<!--]--></div>`);
        }
        _push(`</div><!--]-->`);
      } else {
        _push(`<div class="py-12">`);
        _push(ssrRenderComponent(_component_EmptyState, {
          title: "Room not found",
          description: "This room may have been deleted or is no longer available"
        }, null, _parent));
        _push(`</div>`);
      }
      if (unref(showSettings) && unref(currentRoom)) {
        _push(`<div class="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black/50"><div class="w-full max-w-md rounded-t-2xl sm:rounded-2xl bg-slate-900 p-6"><div class="mb-6 flex items-center justify-between"><h3 class="text-lg font-semibold text-slate-100">Room Settings</h3><button class="text-slate-400 hover:text-slate-300"><span class="sr-only">Close</span><svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg></button></div><form class="flex flex-col gap-4"><div><label class="mb-1 block text-sm text-slate-400" for="name">Room Name</label><input id="name"${ssrRenderAttr("value", unref(currentRoom).name)} type="text" class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"></div><div class="grid grid-cols-2 gap-3"><div><label class="mb-1 block text-sm text-slate-400" for="turnDuration">Turn Duration (s)</label><input id="turnDuration"${ssrRenderAttr("value", unref(currentRoom).turnDuration)} type="number" min="30" max="300" class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"></div><div><label class="mb-1 block text-sm text-slate-400" for="maxParticipants">Max Participants</label><input id="maxParticipants"${ssrRenderAttr("value", unref(currentRoom).maxParticipants)} type="number" min="2" max="12" class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"></div></div>`);
        _push(ssrRenderComponent(_component_Button, {
          type: "submit",
          variant: "default",
          size: "lg",
          class: "mt-2 w-full"
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(` Save Changes `);
            } else {
              return [
                createTextVNode(" Save Changes ")
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`</form></div></div>`);
      } else {
        _push(`<!---->`);
      }
      if (unref(showQRCode) && unref(currentRoom)) {
        _push(`<div class="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black/50"><div class="w-full max-w-sm rounded-t-2xl sm:rounded-2xl bg-slate-900 p-6"><div class="mb-6 flex items-center justify-between"><h3 class="text-lg font-semibold text-slate-100">Share Room</h3><button class="text-slate-400 hover:text-slate-300"><span class="sr-only">Close</span><svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg></button></div>`);
        _push(ssrRenderComponent(_component_QRCode, {
          code: unref(currentRoom).code
        }, null, _parent));
        _push(`</div></div>`);
      } else {
        _push(`<!---->`);
      }
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/rooms/[id].vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=_id_-CPUfo3El.mjs.map
