import { q as executeAsync } from '../nitro/nitro.mjs';
import { d as defineNuxtRouteMiddleware, b as useAuthStore, n as navigateTo } from './server.mjs';
import 'node:http';
import 'node:https';
import 'node:events';
import 'node:buffer';
import 'node:fs';
import 'node:path';
import 'node:crypto';
import 'vue';
import '../routes/renderer.mjs';
import 'vue-bundle-renderer/runtime';
import 'vue/server-renderer';
import 'unhead/server';
import 'devalue';
import 'unhead/utils';
import 'vue-router';
import 'pinia';
import 'class-variance-authority';
import 'clsx';
import 'tailwind-merge';

const auth = defineNuxtRouteMiddleware(async () => {
  let __temp, __restore;
  const store = useAuthStore();
  if (!store.initialized) {
    [__temp, __restore] = executeAsync(() => new Promise((resolve) => {
      const unwatch = store.$subscribe(() => {
        if (store.initialized) {
          unwatch();
          resolve();
        }
      });
    })), await __temp, __restore();
  }
  if (!store.isAuthenticated) {
    return navigateTo("/");
  }
});

export { auth as default };
//# sourceMappingURL=auth-Bu_9iQ46.mjs.map
