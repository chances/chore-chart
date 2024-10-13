import { loadSync } from "@std/dotenv";
import * as path from "@std/path";
import { defineConfig } from "vite";
import solid from "vite-plugin-solid";

export default defineConfig({
  root: "./src",
  publicDir: "./public",
  plugins: [solid()],
  define: {
    env: loadSync(),
  },
  build: {
    rollupOptions: {
      input: {
        main: path.join(import.meta.dirname, "src", "index.html"),
        dashboard: path.join(import.meta.dirname, "src", "dashboard", "index.html"),
      },
    },
  },
})
