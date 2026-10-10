import type { CapacitorConfig } from '@capacitor/cli';

const remoteUrl = process.env.CAPACITOR_SERVER_URL?.trim();
const config: CapacitorConfig = {
  appId: 'app.saaya.mobile',
  appName: 'AAVRA',
  // The Next.js application uses server API routes, so the native shell must point at
  // a deployed HTTPS SAAYA backend unless a separate static/mobile API build is made.
  // `www` contains a safe configuration screen rather than pretending `.next` is a WebView bundle.
  webDir: 'www',
  bundledWebRuntime: false,
  ...(remoteUrl ? { server: { url: remoteUrl, cleartext: false } } : {}),
  plugins: {
    Geolocation: { permissions: ['location'] },
    LocalNotifications: { smallIcon: 'ic_stat_heat' }
  }
};
export default config;
