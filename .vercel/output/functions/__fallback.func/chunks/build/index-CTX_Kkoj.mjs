import { g as useAuth, _ as __nuxt_component_0, n as navigateTo, b as useRouter, e as encodeRoutePath, r as resolveRouteObject, c as useNuxtApp, d as useRuntimeConfig, f as nuxtLinkDefaults } from './server.mjs';
import { _ as __nuxt_component_1 } from './LoadingSpinner-BhnzeBaj.mjs';
import { u as useRooms, _ as __nuxt_component_2, a as __nuxt_component_4 } from './useRooms-rcc0CV93.mjs';
import { defineComponent, ref, resolveComponent, mergeProps, withCtx, createTextVNode, unref, createVNode, toDisplayString, shallowRef, h, computed, useSSRContext } from 'vue';
import { C as parseQuery, l as hasProtocol, n as joinURL, m as isScriptProtocol, D as withTrailingSlash, E as withoutTrailingSlash } from '../nitro/nitro.mjs';
import { ssrRenderAttrs, ssrRenderComponent, ssrInterpolate, ssrRenderList } from 'vue/server-renderer';
import '../routes/renderer.mjs';
import 'vue-bundle-renderer/runtime';
import 'unhead/server';
import 'devalue';
import 'unhead/utils';
import 'vue-router';
import 'pinia';
import 'class-variance-authority';
import 'clsx';
import 'tailwind-merge';
import 'node:http';
import 'node:https';
import 'node:events';
import 'node:buffer';
import 'node:fs';
import 'node:path';
import 'node:crypto';

const firstNonUndefined = (...args) => args.find((arg) => arg !== void 0);
function sanitizeExternalHref(value) {
  let candidate = value.replace(/[\u0000-\u001F\s]+/g, "");
  while (candidate.toLowerCase().startsWith("view-source:")) {
    candidate = candidate.slice("view-source:".length);
  }
  const colon = candidate.indexOf(":");
  if (colon > 0 && isScriptProtocol(candidate.slice(0, colon + 1))) {
    return null;
  }
  return value;
}
// @__NO_SIDE_EFFECTS__
function defineNuxtLink(options) {
  const componentName = options.componentName || "NuxtLink";
  function isHashLinkWithoutHashMode(link) {
    return typeof link === "string" && link.startsWith("#");
  }
  function resolveTrailingSlashBehavior(to, resolve, trailingSlash) {
    const effectiveTrailingSlash = trailingSlash ?? options.trailingSlash;
    if (!to || effectiveTrailingSlash !== "append" && effectiveTrailingSlash !== "remove") {
      return to;
    }
    if (typeof to === "string") {
      return applyTrailingSlashBehavior(to, effectiveTrailingSlash);
    }
    const path = "path" in to && to.path !== void 0 ? to.path : resolve(to).path;
    const resolvedPath = {
      ...to,
      name: void 0,
      // named routes would otherwise always override trailing slash behavior
      path: applyTrailingSlashBehavior(path, effectiveTrailingSlash)
    };
    return resolvedPath;
  }
  function useNuxtLink(props) {
    const router = useRouter();
    const config = useRuntimeConfig();
    const hasTarget = computed(() => !!unref(props.target) && unref(props.target) !== "_self");
    const isAbsoluteUrl = computed(() => {
      const path = unref(props.to) || unref(props.href) || "";
      return typeof path === "string" && hasProtocol(path, { acceptRelative: true });
    });
    const builtinRouterLink = resolveComponent("RouterLink");
    const useBuiltinLink = builtinRouterLink && typeof builtinRouterLink !== "string" ? builtinRouterLink.useLink : void 0;
    const isExternal = computed(() => {
      if (unref(props.external)) {
        return true;
      }
      const path = unref(props.to) || unref(props.href) || "";
      if (typeof path === "object") {
        return false;
      }
      return path === "" || isAbsoluteUrl.value;
    });
    const to = computed(() => {
      const path = unref(props.to) || unref(props.href) || "";
      if (isExternal.value) {
        return path;
      }
      return resolveTrailingSlashBehavior(path, router.resolve, unref(props.trailingSlash));
    });
    const link = isExternal.value ? void 0 : useBuiltinLink?.({ ...props, to, viewTransition: unref(props.viewTransition) });
    const href = computed(() => {
      const effectiveTrailingSlash = unref(props.trailingSlash) ?? options.trailingSlash;
      if (!to.value || isAbsoluteUrl.value || isHashLinkWithoutHashMode(to.value)) {
        const raw = to.value;
        return typeof raw === "string" ? sanitizeExternalHref(raw) : raw;
      }
      if (isExternal.value) {
        const path = typeof to.value === "object" && "path" in to.value ? resolveRouteObject(to.value) : to.value;
        const href2 = typeof path === "object" ? router.resolve(path).href : path;
        const safe = typeof href2 === "string" ? sanitizeExternalHref(href2) : href2;
        return safe === null ? null : applyTrailingSlashBehavior(safe, effectiveTrailingSlash);
      }
      if (typeof to.value === "object") {
        return router.resolve(to.value)?.href ?? null;
      }
      return applyTrailingSlashBehavior(joinURL(config.app.baseURL, to.value), effectiveTrailingSlash);
    });
    return {
      to,
      hasTarget,
      isAbsoluteUrl,
      isExternal,
      //
      href,
      isActive: link?.isActive ?? computed(() => to.value === router.currentRoute.value.path),
      isExactActive: link?.isExactActive ?? computed(() => to.value === router.currentRoute.value.path),
      route: link?.route ?? computed(() => router.resolve(to.value)),
      async navigate(_e) {
        if (href.value === null) {
          return;
        }
        await navigateTo(href.value, { replace: unref(props.replace), external: isExternal.value || hasTarget.value });
      }
    };
  }
  return defineComponent({
    name: componentName,
    props: {
      // Routing
      to: {
        type: [String, Object],
        default: void 0,
        required: false
      },
      href: {
        type: [String, Object],
        default: void 0,
        required: false
      },
      // Attributes
      target: {
        type: String,
        default: void 0,
        required: false
      },
      rel: {
        type: String,
        default: void 0,
        required: false
      },
      noRel: {
        type: Boolean,
        default: void 0,
        required: false
      },
      // Prefetching
      prefetch: {
        type: Boolean,
        default: void 0,
        required: false
      },
      prefetchOn: {
        type: [String, Object],
        default: void 0,
        required: false
      },
      noPrefetch: {
        type: Boolean,
        default: void 0,
        required: false
      },
      // Styling
      activeClass: {
        type: String,
        default: void 0,
        required: false
      },
      exactActiveClass: {
        type: String,
        default: void 0,
        required: false
      },
      prefetchedClass: {
        type: String,
        default: void 0,
        required: false
      },
      // Vue Router's `<RouterLink>` additional props
      replace: {
        type: Boolean,
        default: void 0,
        required: false
      },
      ariaCurrentValue: {
        type: String,
        default: void 0,
        required: false
      },
      // Edge cases handling
      external: {
        type: Boolean,
        default: void 0,
        required: false
      },
      // Slot API
      custom: {
        type: Boolean,
        default: void 0,
        required: false
      },
      // Behavior
      trailingSlash: {
        type: String,
        default: void 0,
        required: false
      }
    },
    useLink: useNuxtLink,
    setup(props, { slots }) {
      const router = useRouter();
      const { to, href, navigate, isExternal, hasTarget, isAbsoluteUrl } = useNuxtLink(props);
      shallowRef(false);
      const el = void 0;
      const elRef = void 0;
      async function prefetch(nuxtApp = useNuxtApp()) {
        {
          return;
        }
      }
      return () => {
        if (!isExternal.value && !hasTarget.value && !isHashLinkWithoutHashMode(to.value)) {
          const routerLinkProps = {
            ref: elRef,
            to: to.value,
            activeClass: props.activeClass || options.activeClass,
            exactActiveClass: props.exactActiveClass || options.exactActiveClass,
            replace: props.replace,
            ariaCurrentValue: props.ariaCurrentValue,
            custom: props.custom
          };
          if (!props.custom) {
            routerLinkProps.rel = props.rel || void 0;
          }
          return h(
            resolveComponent("RouterLink"),
            routerLinkProps,
            slots.default
          );
        }
        const target = props.target || null;
        const rel = firstNonUndefined(
          // converts `""` to `null` to prevent the attribute from being added as empty (`rel=""`)
          props.noRel ? "" : props.rel,
          options.externalRelAttribute,
          /*
          * A fallback rel of `noopener noreferrer` is applied for external links or links that open in a new tab.
          * This solves a reverse tabnapping security flaw in browsers pre-2021 as well as improving privacy.
          */
          isAbsoluteUrl.value || hasTarget.value ? "noopener noreferrer" : ""
        ) || null;
        if (props.custom) {
          if (!slots.default) {
            return null;
          }
          return slots.default({
            href: href.value,
            navigate,
            prefetch,
            get route() {
              if (!href.value) {
                return void 0;
              }
              const url = new URL(href.value, "http://localhost");
              return {
                path: url.pathname,
                fullPath: url.pathname,
                get query() {
                  return parseQuery(url.search);
                },
                hash: url.hash,
                params: {},
                name: void 0,
                matched: [],
                redirectedFrom: void 0,
                meta: {},
                href: href.value
              };
            },
            rel,
            target,
            isExternal: isExternal.value || hasTarget.value,
            isActive: false,
            isExactActive: false
          });
        }
        return h("a", {
          ref: el,
          href: href.value || null,
          // converts `""` to `null` to prevent the attribute from being added as empty (`href=""`)
          rel,
          target,
          onClick: async (event) => {
            if (isExternal.value || hasTarget.value) {
              return;
            }
            event.preventDefault();
            try {
              const encodedHref = encodeRoutePath(href.value ?? "");
              return await (props.replace ? router.replace(encodedHref) : router.push(encodedHref));
            } finally {
            }
          }
        }, slots.default?.());
      };
    }
  });
}
const __nuxt_component_3 = /* @__PURE__ */ defineNuxtLink(nuxtLinkDefaults);
function applyTrailingSlashBehavior(to, trailingSlash) {
  const normalizeFn = trailingSlash === "append" ? withTrailingSlash : withoutTrailingSlash;
  const hasProtocolDifferentFromHttp = hasProtocol(to) && !to.startsWith("http");
  if (hasProtocolDifferentFromHttp) {
    return to;
  }
  return normalizeFn(to, true);
}
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    const { user, logout } = useAuth();
    const { rooms, loading, error } = useRooms();
    const showCreateModal = ref(false);
    const showJoinModal = ref(false);
    function handleRoomCreated(roomId) {
      showCreateModal.value = false;
      navigateTo(`/rooms/${roomId}`);
    }
    function handleRoomJoined(roomId) {
      showJoinModal.value = false;
      navigateTo(`/rooms/${roomId}`);
    }
    return (_ctx, _push, _parent, _attrs) => {
      const _component_Button = __nuxt_component_0;
      const _component_LoadingSpinner = __nuxt_component_1;
      const _component_ErrorMessage = __nuxt_component_2;
      const _component_NuxtLink = __nuxt_component_3;
      const _component_EmptyState = __nuxt_component_4;
      const _component_CreateRoomModal = resolveComponent("CreateRoomModal");
      const _component_JoinRoomModal = resolveComponent("JoinRoomModal");
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-1 flex-col gap-4 py-6" }, _attrs))}><div class="flex items-center justify-between"><h2 class="text-xl font-semibold text-slate-100">Rooms</h2><div class="flex gap-2">`);
      _push(ssrRenderComponent(_component_Button, {
        variant: "outline",
        size: "sm",
        onClick: ($event) => showJoinModal.value = true
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(` Join Room `);
          } else {
            return [
              createTextVNode(" Join Room ")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(ssrRenderComponent(_component_Button, {
        variant: "default",
        size: "sm",
        onClick: ($event) => showCreateModal.value = true
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(` Create Room `);
          } else {
            return [
              createTextVNode(" Create Room ")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div></div><div class="flex items-center gap-3 rounded-xl bg-slate-800 p-3"><div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-600"><span class="text-sm font-medium text-white">${ssrInterpolate(unref(user)?.name?.charAt(0) ?? "?")}</span></div><div class="flex-1"><p class="text-sm font-medium text-slate-100">${ssrInterpolate(unref(user)?.name)}</p><p class="text-xs text-slate-400">${ssrInterpolate(unref(user)?.role === "guest" ? "Guest" : "Signed in")}</p></div>`);
      _push(ssrRenderComponent(_component_Button, {
        variant: "ghost",
        size: "sm",
        onClick: unref(logout)
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(` Sign out `);
          } else {
            return [
              createTextVNode(" Sign out ")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
      if (unref(loading)) {
        _push(`<div class="flex justify-center py-12">`);
        _push(ssrRenderComponent(_component_LoadingSpinner, { size: "lg" }, null, _parent));
        _push(`</div>`);
      } else if (unref(error)) {
        _push(`<div class="py-8">`);
        _push(ssrRenderComponent(_component_ErrorMessage, { message: unref(error) }, null, _parent));
        _push(`</div>`);
      } else if (unref(rooms).length > 0) {
        _push(`<div class="flex flex-col gap-3"><!--[-->`);
        ssrRenderList(unref(rooms), (room) => {
          _push(ssrRenderComponent(_component_NuxtLink, {
            key: room.id,
            to: `/rooms/${room.id}`,
            class: "flex flex-col gap-2 rounded-xl bg-slate-800 p-4 transition-colors hover:bg-slate-750"
          }, {
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(`<div class="flex items-center justify-between"${_scopeId}><h3 class="font-medium text-slate-100"${_scopeId}>${ssrInterpolate(room.name)}</h3><span class="rounded-full bg-primary-600/20 px-2 py-0.5 text-xs text-primary-400"${_scopeId}>${ssrInterpolate(room.status)}</span></div><div class="flex items-center gap-3 text-xs text-slate-400"${_scopeId}><span${_scopeId}>${ssrInterpolate(room.languageName)}</span><span${_scopeId}>·</span><span${_scopeId}>${ssrInterpolate(room.topicName)}</span><span${_scopeId}>·</span><span${_scopeId}>${ssrInterpolate(room.levelName)}</span></div><div class="flex items-center justify-between text-xs"${_scopeId}><span class="text-slate-500"${_scopeId}> Host: ${ssrInterpolate(room.hostName)}</span><span class="text-slate-400"${_scopeId}>${ssrInterpolate(room.participantCount)}/${ssrInterpolate(room.maxParticipants)} participants </span></div>`);
              } else {
                return [
                  createVNode("div", { class: "flex items-center justify-between" }, [
                    createVNode("h3", { class: "font-medium text-slate-100" }, toDisplayString(room.name), 1),
                    createVNode("span", { class: "rounded-full bg-primary-600/20 px-2 py-0.5 text-xs text-primary-400" }, toDisplayString(room.status), 1)
                  ]),
                  createVNode("div", { class: "flex items-center gap-3 text-xs text-slate-400" }, [
                    createVNode("span", null, toDisplayString(room.languageName), 1),
                    createVNode("span", null, "·"),
                    createVNode("span", null, toDisplayString(room.topicName), 1),
                    createVNode("span", null, "·"),
                    createVNode("span", null, toDisplayString(room.levelName), 1)
                  ]),
                  createVNode("div", { class: "flex items-center justify-between text-xs" }, [
                    createVNode("span", { class: "text-slate-500" }, " Host: " + toDisplayString(room.hostName), 1),
                    createVNode("span", { class: "text-slate-400" }, toDisplayString(room.participantCount) + "/" + toDisplayString(room.maxParticipants) + " participants ", 1)
                  ])
                ];
              }
            }),
            _: 2
          }, _parent));
        });
        _push(`<!--]--></div>`);
      } else {
        _push(`<div class="py-12">`);
        _push(ssrRenderComponent(_component_EmptyState, {
          title: "No active rooms",
          description: "Create a room or join one to get started"
        }, null, _parent));
        _push(`</div>`);
      }
      if (unref(showCreateModal)) {
        _push(ssrRenderComponent(_component_CreateRoomModal, {
          onClose: ($event) => showCreateModal.value = false,
          onCreated: handleRoomCreated
        }, null, _parent));
      } else {
        _push(`<!---->`);
      }
      if (unref(showJoinModal)) {
        _push(ssrRenderComponent(_component_JoinRoomModal, {
          onClose: ($event) => showJoinModal.value = false,
          onJoined: handleRoomJoined
        }, null, _parent));
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/rooms/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-CTX_Kkoj.mjs.map
