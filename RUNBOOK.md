# TERRA07 operating runbook

## 1. Local development

Requirements: Node.js 22.13+ and pnpm 11.25.

```bash
corepack enable
corepack prepare pnpm@11.25.0 --activate
pnpm install
pnpm typecheck
pnpm qa
pnpm test:pure
pnpm dev
```

Open `http://localhost:3000`.

If Corepack cannot write into the Node installation on Windows, use:

```bash
npx pnpm@11.25.0 install
npx pnpm@11.25.0 dev
```

## 2. Production gate

```bash
pnpm typecheck
pnpm qa
pnpm test:pure
pnpm build
```

Never deploy around a failing build by hiding the error or inserting fixture weather.

## 3. Vercel

Follow `START_HERE.md`, `VERCEL_DEPLOY.md` and `DEPLOYMENT_CHECKLIST.md`.

Recommended production environment variable:

```text
TERRA07_USER_AGENT=TERRA07/2.0 (+https://YOUR-DOMAIN; contact=YOUR_EMAIL)
```

The core investor build requires no private map/weather API key.

## 4. API smoke tests

- `/api/weather?lat=22.7196&lon=75.8577`
- `/api/forecast?lat=22.7196&lon=75.8577`
- `/api/thermal?scope=global&zoom=1.8&metric=temperatureC&series=1`
- `/api/search?q=Rajwada%20Indore`
- `/api/suggest?q=Vijay%20Nagar&lat=22.7196&lon=75.8577`
- `/api/reverse?lat=22.7196&lon=75.8577`
- `/api/alerts?district=Indore&state=Madhya%20Pradesh&city=Indore`
- `/api/streets?...` with a close map bbox
- `/api/urban?...` at close zoom
- `/api/route?...` for two reachable walking points

A provider outage must stay unavailable/degraded. Do not substitute fake data.

## 5. Browser QA

Verify desktop + mobile, light + dark:

- Earth texture/globe/terrain are interactive;
- base map remains visible while thermal data loads;
- thermal legend and forecast time match the selected frame;
- search is keyboard/touch usable;
- local mode reloads roads after move/zoom;
- roads without heat estimates are neutral;
- close zoom progressively loads mapped buildings/green areas;
- live location permission denial is handled clearly;
- provider/source/estimate wording remains visible;
- official alert outages remain visible;
- route failures are explicit;
- City Intelligence distinguishes connected evidence from unavailable evidence.

## 6. Sensitive profile storage

The investor web build uses device/session profile storage. `/api/profile` deliberately remains unavailable until authenticated persistent storage, consent and deletion are implemented.

Before storing health-related profile data in a cloud account:

1. choose an authenticated Vercel-compatible database;
2. verify server-side user identity for every read/write;
3. add explicit persistent-storage consent;
4. implement deletion/export;
5. perform privacy/security review.

## 7. Alerts and background delivery

The repository contains prior Worker scaffolding, but a production Vercel/mobile alert system still needs:

- push-token registration;
- FCM/APNs or another permitted provider;
- authoritative geography matching;
- expiry/deduplication/acknowledgement;
- quiet-hour behavior with an official-warning safety floor;
- physical-device QA.

## 8. Provider scale

OpenFreeMap, public Overpass/geocoding/routing endpoints and other public services are useful for the investor build and controlled pilots subject to their policies. They are not a substitute for contracted/self-hosted production capacity at large scale. Budget for caching, observability, rate controls, failover and SLA-backed infrastructure.
