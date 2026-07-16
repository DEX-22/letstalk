import { a as useAuth, _ as __nuxt_component_0 } from './server.mjs';
import { defineComponent, mergeProps, withCtx, createTextVNode, unref, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent, ssrInterpolate, ssrRenderSlot } from 'vue/server-renderer';
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
import 'pinia';
import 'class-variance-authority';
import 'clsx';
import 'tailwind-merge';

const _sfc_main$1 = /* @__PURE__ */ defineComponent({
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
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("shared/components/EmptyState.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_1 = Object.assign(_sfc_main$1, { __name: "EmptyState" });
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    const { user, logout } = useAuth();
    return (_ctx, _push, _parent, _attrs) => {
      const _component_Button = __nuxt_component_0;
      const _component_EmptyState = __nuxt_component_1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-1 flex-col gap-4 py-6" }, _attrs))}><div class="flex items-center justify-between"><h2 class="text-xl font-semibold text-slate-100">Rooms</h2>`);
      _push(ssrRenderComponent(_component_Button, {
        variant: "default",
        size: "sm"
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
      _push(`</div><div class="flex items-center gap-3 rounded-xl bg-slate-800 p-3"><div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-600"><span class="text-sm font-medium text-white">${ssrInterpolate(unref(user)?.name?.charAt(0) ?? "?")}</span></div><div class="flex-1"><p class="text-sm font-medium text-slate-100">${ssrInterpolate(unref(user)?.name)}</p><p class="text-xs text-slate-400">${ssrInterpolate(unref(user)?.role === "guest" ? "Guest" : "Signed in")}</p></div>`);
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
      _push(ssrRenderComponent(_component_EmptyState, {
        title: "No rooms yet",
        description: "Create a room or join one to get started"
      }, null, _parent));
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
//# sourceMappingURL=index-DsuLmzVX.mjs.map
