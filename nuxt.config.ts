// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  future: {
    compatibilityVersion: 4,
  },

  devtools: { enabled: true },

  modules: [
    '@nuxtjs/tailwindcss',
    '@nuxtjs/color-mode',
    '@nuxtjs/google-fonts',
    '@nuxtjs/supabase',
  ],

  colorMode: {
    classSuffix: '',
    preference: 'dark',
    fallback: 'dark',
  },

  app: {
    head: {
      title: "Let's Talk",
      titleTemplate: "%s · Let's Talk",
      meta: [
        { name: 'theme-color', content: '#0f172a' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      ],
      link: [{ rel: 'icon', href: '/favicon.ico' }],
    },
  },

  tailwindcss: {
    configPath: 'tailwind.config.ts',
    cssPath: '~/assets/css/main.css',
  },

  googleFonts: {
    families: {
      Inter: [400, 500, 600, 700],
    },
    display: 'swap',
    prefetch: true,
    preconnect: true,
  },

  supabase: {
    url: process.env.SUPABASE_URL || '',
    key: process.env.SUPABASE_KEY || '',
    redirectOptions: {
      login: '/',
      callback: '/',
      exclude: ['/*'],
    },
  },

  typescript: {
    strict: true,
    typeCheck: true,
    shim: false,
  },

  imports: {
    autoImport: true,
  },

  components: {
    dirs: [
      '~/shared/components',
      '~/shared/components/ui',
    ],
  },

  css: ['~/assets/css/main.css'],

  nitro: {
    preset: 'vercel',
  },

  routeRules: {
    '/': { prerender: true },
    '/rooms/**': { ssr: false },
  },

  pwa: {
    manifest: {
      name: "Let's Talk",
      short_name: 'Letstalk',
      description: 'Guided conversation sessions for language practice',
      theme_color: '#0f172a',
      background_color: '#0f172a',
      display: 'standalone',
      orientation: 'portrait',
      lang: 'en',
    },
  },
})