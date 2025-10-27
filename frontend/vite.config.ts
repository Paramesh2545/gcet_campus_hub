import path from 'path';
import { defineConfig, loadEnv } from 'vite';

export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, '.', '');
    return {
      // Removed API key exposure for security
      // define: {
      //   'process.env.API_KEY': JSON.stringify(env.GEMINI_API_KEY),
      //   'process.env.GEMINI_API_KEY': JSON.stringify(env.GEMINI_API_KEY)
      // },
      resolve: {
        alias: {
          '@': path.resolve(__dirname, '.'),
        }
      },
      server: {
        hmr: {
          clientPort: 443,
        },
        host: true, // Listen on all addresses
        allowedHosts: [
          'https://paramesh2545.github.io/gcet_campus_hub',
          'https://chewy-jacquelyn-unpontifically.ngrok-free.dev',
          'https://.ngrok-free.dev', // Allow all ngrok hosts
          'https://.ngrok.io', // Allow legacy ngrok hosts
        ]
      }
    };
});
