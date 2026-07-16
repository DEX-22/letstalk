import { defineComponent, mergeProps, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderClass, ssrInterpolate } from 'vue/server-renderer';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "LoadingSpinner",
  __ssrInlineRender: true,
  props: {
    size: { default: "default" },
    label: { default: "Loading..." }
  },
  setup(__props) {
    return (_ctx, _push, _parent, _attrs) => {
      _push(`<div${ssrRenderAttrs(mergeProps({
        class: "flex flex-col items-center justify-center gap-3",
        role: "status",
        "aria-live": "polite"
      }, _attrs))}><span class="${ssrRenderClass([{
        "h-4 w-4": __props.size === "sm",
        "h-6 w-6": __props.size === "default",
        "h-8 w-8": __props.size === "lg"
      }, "animate-spin rounded-full border-2 border-primary-500 border-t-transparent"])}"></span>`);
      if (__props.label) {
        _push(`<span class="text-sm text-slate-400">${ssrInterpolate(__props.label)}</span>`);
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("shared/components/LoadingSpinner.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const __nuxt_component_1 = Object.assign(_sfc_main, { __name: "LoadingSpinner" });

export { __nuxt_component_1 as _ };
//# sourceMappingURL=LoadingSpinner-BhnzeBaj.mjs.map
