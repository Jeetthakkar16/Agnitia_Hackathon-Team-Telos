# Deploy TERRA07 on Vercel

TERRA07 is a standard Next.js 16 application. Vercel supports Next.js directly, so no custom server is required.

## Option A — Vercel dashboard + GitHub

1. Put this project in a GitHub repository.
2. In Vercel choose **Add New → Project**.
3. Import the repository.
4. Framework preset should detect **Next.js** automatically.
5. Keep the project root as the repository root.
6. Add the optional environment variable:

   `TERRA07_USER_AGENT=TERRA07/2.0 (+https://YOUR-DOMAIN; contact=YOUR_EMAIL)`

7. Deploy.
8. After the first deployment, add your production domain under **Project Settings → Domains**.
9. Update `TERRA07_USER_AGENT` with the real domain and redeploy.

## Option B — Vercel CLI

```bash
npm install -g vercel
vercel login
vercel
```

For production:

```bash
vercel deploy --prod
```

Vercel prints the HTTPS deployment URL after the build succeeds.

## Required production checks

Run locally before production:

```bash
npm install
npm run typecheck
npm run qa
npm run test:pure
npm run build
```

Then verify on the Vercel deployment:

- `/` — Earth thermal field and local map modes
- `/api/thermal?scope=global&zoom=1.8&metric=temperatureC&series=1`
- `/api/weather?lat=22.7196&lon=75.8577`
- `/api/search?q=Indore`
- `/safety`
- `/routes`
- `/city`
- `/learn`
- `/privacy`
- `/medical-disclaimer`

## No-key core stack

No Google Maps or OpenWeatherMap key is required for the default build. That avoids blocking the pitch on billing setup.

If you later adopt Google Maps Platform, do it as a controlled provider upgrade rather than putting a key directly into source. Restrict browser keys to your production domain and keep server-only secrets in Vercel Environment Variables.

## Caching

`/api/thermal` returns CDN-cache headers so Vercel can reuse a heat grid for ten minutes and serve stale data while it refreshes. The browser also receives an entire 0–24 hour series for the active map area, so the forecast slider can animate without making a new weather request at every frame.

## Production provider note

OpenFreeMap is appropriate for the early product and commercial use, but it currently offers no SLA. A funded production launch should budget for either self-hosted OpenFreeMap/OpenMapTiles or a commercial tile provider with an SLA.
