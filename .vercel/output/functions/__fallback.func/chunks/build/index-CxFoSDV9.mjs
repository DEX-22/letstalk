import { a as useAuth, n as navigateTo, _ as __nuxt_component_0 } from './server.mjs';
import { defineComponent, mergeProps, unref, withCtx, createTextVNode, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderAttr, ssrIncludeBooleanAttr, ssrInterpolate, ssrRenderComponent, ssrRenderClass } from 'vue/server-renderer';
import { toTypedSchema } from '@vee-validate/zod';
import { useForm, useField } from 'vee-validate';
import { z } from 'zod';
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
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("shared/components/LoadingSpinner.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_1 = Object.assign(_sfc_main$1, { __name: "LoadingSpinner" });
function useFormValidation(schema) {
  const typedSchema = toTypedSchema(schema);
  const form = useForm({
    validationSchema: typedSchema
  });
  const { errors, handleSubmit, isSubmitting, setFieldValue } = form;
  function useFieldValue(fieldName) {
    const field = useField(fieldName);
    return field.value;
  }
  return {
    errors,
    handleSubmit,
    isSubmitting,
    setFieldValue,
    useFieldValue,
    form
  };
}
const guestLoginSchema = z.object({
  name: z.string().min(1, "Name is required").max(50, "Name must be at most 50 characters").trim()
});
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    const { loginAsGuest, loginWithGoogle, loading, initialized } = useAuth();
    const { errors, handleSubmit, isSubmitting, useFieldValue } = useFormValidation(guestLoginSchema);
    const nameValue = useFieldValue("name");
    handleSubmit(async (values) => {
      try {
        await loginAsGuest(values.name);
        navigateTo("/rooms");
      } catch (error) {
        console.error("Guest login failed:", error);
      }
    });
    return (_ctx, _push, _parent, _attrs) => {
      const _component_Button = __nuxt_component_0;
      const _component_LoadingSpinner = __nuxt_component_1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-1 flex-col items-center justify-center gap-6" }, _attrs))}><div class="text-center"><h1 class="text-3xl font-bold text-slate-100">Let&#39;s Talk</h1><p class="mt-2 text-sm text-slate-400"> Guided conversation sessions for language practice </p></div>`);
      if (!unref(initialized) || !unref(loading)) {
        _push(`<form class="flex w-full flex-col gap-3"><div><input${ssrRenderAttr("value", unref(nameValue))} type="text" placeholder="Enter your name" class="w-full rounded-xl border border-slate-700 bg-slate-800 px-4 py-3 text-sm text-slate-100 placeholder:text-slate-400 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20"${ssrIncludeBooleanAttr(unref(isSubmitting)) ? " disabled" : ""}>`);
        if (unref(errors).name) {
          _push(`<span class="mt-1 block text-xs text-red-400" role="alert">${ssrInterpolate(unref(errors).name)}</span>`);
        } else {
          _push(`<!---->`);
        }
        _push(`</div>`);
        _push(ssrRenderComponent(_component_Button, {
          type: "submit",
          variant: "default",
          size: "lg",
          class: "w-full",
          loading: unref(isSubmitting)
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(` Continue as Guest `);
            } else {
              return [
                createTextVNode(" Continue as Guest ")
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`</form>`);
      } else {
        _push(`<div class="flex w-full flex-col gap-3">`);
        _push(ssrRenderComponent(_component_LoadingSpinner, { size: "lg" }, null, _parent));
        _push(`</div>`);
      }
      _push(ssrRenderComponent(_component_Button, {
        variant: "outline",
        size: "lg",
        class: "w-full",
        loading: unref(loading),
        onClick: unref(loginWithGoogle)
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(` Sign in with Google `);
          } else {
            return [
              createTextVNode(" Sign in with Google ")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-CxFoSDV9.mjs.map
