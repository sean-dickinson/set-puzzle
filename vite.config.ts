import vue from '@vitejs/plugin-vue'
import {defineConfig} from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import path from 'path'
export default defineConfig({
    plugins: [
        vue(),
        RubyPlugin(),
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'app/javascript'),
        },
    },
})
