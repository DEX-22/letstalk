import { defineVitestConfig } from '@nuxt/test-utils/config'

export default defineVitestConfig({
  test: {
    environment: 'nuxt',
    globals: true,
    dir: 'tests/unit',
    include: ['**/*.test.ts', '**/*.spec.ts'],
    coverage: {
      provider: 'v8',
      include: ['modules/**', 'shared/**'],
      exclude: ['**/*.test.ts', '**/*.spec.ts', '**/types/**'],
    },
  },
})