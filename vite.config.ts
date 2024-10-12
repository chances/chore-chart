import * as path from "@std/path";
import { defineConfig } from 'vite'
import solid from 'vite-plugin-solid'

export default defineConfig({
  root: "./src",
  publicDir: "./public",
  plugins: [solid()],
  build: {
    rollupOptions: {
      input: {
        main: path.join(__dirname, "src", "index.html"),
        dash: path.join(__dirname, "src", "dash", "index.html"),
      },
    },
  },
})
