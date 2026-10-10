# Release 4.2 verification

- Input: original `TERRA07-PLATFORM-v4.1-SIMPLE-MAP-FIX.zip`.
- Preserved `lib/map-style.ts` and basemap configuration unmodified.
- Added `lib/isotherm-contours.ts`, `lib/map-isotherm-overlay.ts`, `/api/isotherms` and optional overlay controls.
- `npm run test:all`: PASSED in current environment.
- `npm run test:v4`: PASSED source-based JSX parse and v4 onboarding/alerts tests.
- `npm run test:isotherms`: PASSED on synthetic grids for varied, missing, constant, and invalid values.
- Archive integrity and checkpoint preservation verified at packaging time.
- **NOT verified:** dependency-backed Next.js production build/typecheck, rendered browser graphics and real external Open-Meteo connectivity. These require a connected development machine.
- **No actual API keys were introduced**, and original map provider remained unchanged.
- Not certified for marine navigation, medical diagnosis, or official public hazard warnings.
