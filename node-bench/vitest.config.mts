import { defineConfig } from 'vitest/config';
import codspeedPlugin from "@codspeed/vitest-plugin";

export default defineConfig({
  test: {
    include: ['*.bench.ts'],
    fileParallelism: false,
    benchmark: {
      includeSamples: false,
    },
  },
  plugins: [codspeedPlugin()],
});