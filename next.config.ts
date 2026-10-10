import type { NextConfig } from "next";
const nextConfig: NextConfig = {
  reactStrictMode: true,
  poweredByHeader: false,
  async headers() {
    return [{
      source: "/(.*)",
      headers: [
        { key: "Referrer-Policy", value: "strict-origin-when-cross-origin" },
        { key: "X-Content-Type-Options", value: "nosniff" },
        { key: "Permissions-Policy", value: "geolocation=(self), microphone=(), camera=(self), bluetooth=(self), accelerometer=(self), gyroscope=(self), magnetometer=(self)" }
      ]
    }];
  }
};
export default nextConfig;
