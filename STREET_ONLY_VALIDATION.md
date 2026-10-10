# TERRA07 street-only thermal delivery — validation

- `node scripts/qa.mjs`: PASS
- `node scripts/test-pure.mjs`: PASS
- `node scripts/test-focused-lanes.mjs`: PASS
- `node scripts/test-isothermal-roads.mjs`: PASS
- `node scripts/check-imports.mjs`: PASS
- TypeScript / TSX syntax parse: 61 files, 0 errors
- Isolated strict TypeScript compile (`lib/nearby-lanes.ts`, `lib/vector-lanes.ts`): PASS
- Verified OpenFreeMap dark style includes `openmaptiles` vector source and `transportation` road layer (upstream style documentation)
- Confirmed Local Detail map does not include heat area fill, square cells or raster heat overlay; it uses GeoJSON line layers only.

**NOT RUN / PENDING:** Full `next build`, `tsc --noEmit` with Next/React dependencies and live mapping-provider/browser integration tests. This container cannot access the npm registry (`EAI_AGAIN`). The user must verify on Windows with `START-TERRA07.bat` and `RUN-TESTS.bat`.

**Accuracy:** Temperature value is shared coarse model data for nearby streets. No differential per-lane temperature is fabricated. A real source must be connected and available for any visible road geometry and heat observation; otherwise the UI labels provider failure.
