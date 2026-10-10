# TERRA07 Vercel investor build — validation status

Date: 9 October 2026

## Passed in this environment

- `node scripts/qa.mjs` → **PASS**, 89 source/document files checked.
- `node scripts/test-pure.mjs` → **PASS** for IDW behavior, official-warning safety floor, fluid-restriction safeguard and empty-evidence index behavior.
- TypeScript parser check → **56 TS/TSX files, 0 syntax diagnostics**.
- JSON parse → `package.json`, `vercel.json`, `tsconfig.json` all valid.
- Local `@/…` import audit → **0 unresolved project-local imports**.
- Direct dependency on the OSM volunteer raster-tile endpoint in executable source → **0**.
- User-facing “Partial Heat Priority Index” references in `app/` + `components/` → **0**.
- Thermal/local map event-handler stale-state bug fixed: pan/zoom handlers read the latest mode, metric, forecast hour and samples.
- Thermal API returns explicit provider-unavailable responses instead of fixture data.
- Core map and thermal paths are decoupled so a heat-provider failure does not intentionally blank the base map.

## Build limitation in this sandbox

The execution container currently cannot resolve `registry.npmjs.org` (`EAI_AGAIN`). Corepack therefore cannot download pnpm 11.25.0 and dependencies cannot be installed here. As a result, **this environment cannot honestly claim a completed dependency-aware `tsc --noEmit` or `next build`**.

This is explicitly a validation limitation, not a claimed pass.

## Required final gate on your machine or Vercel

```bash
pnpm install
pnpm typecheck
pnpm qa
pnpm test:pure
pnpm build
```

Vercel’s build must pass before production promotion. After deployment, run every smoke test in `DEPLOYMENT_CHECKLIST.md`.

## Still requires real-world validation before a health product launch

- external-provider latency/uptime at intended scale;
- local thermal-model accuracy against trusted observations;
- satellite LST/NDVI/tree-canopy integration;
- verified shade/water/cooling-resource operations;
- licensed medical/public-health review;
- accessibility and multilingual review;
- authenticated cloud profile storage and deletion flow, if enabled;
- background push delivery and physical-device testing;
- commercial/provider SLA and rate-limit planning.
