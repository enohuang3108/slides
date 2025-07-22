import "@slidev/cli";
import { defineConfig } from "vite";

export default defineConfig({
  server: {
    historyApiFallback: true,
  },
});
