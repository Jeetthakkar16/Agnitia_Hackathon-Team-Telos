# SAAYA v8 — Bug-fix and UX report

## User-reported defects

1. Farmer home reports all data unavailable while Worksite Toolkit shows a temperature. **Fixed in source:** guidance API now uses weather fallback with clear limits. May still show unavailable if all providers fail; this is intentional and safer.
2. Worksite Toolkit displays a negative Sun height without explanation. **Fixed:** Nighttime state and next approximate daylight (device local time), with raw sun azimuth suppressed at night. Actual shade remains unverified.
3. Worksite Toolkit uses Indore or a previous random area. **Fixed:** reuses valid onboarding/current saved place. If none exists, labels Indore as example rather than falsely claiming the user is there.
4. Confusing source/status when data doesn't load. **Improved:** retry button, user-visible provider failure reason, source/timestamp label, typed fallback and no fake feels-like values.
5. Unwieldy desktop toolkit and crowded mobile tool list. **Improved:** feature-first modules, secondary options hidden until expanded, sensible small-screen stacking, focus visible states, compact front page.
6. Worksite shift planning unavailable on MET fallback. **Improved:** exposes model hourly samples from available MET Norway timeseries. Not an occupational threshold or monitored measurement.

## Still unverified or incomplete

- No field-device/browser E2E run: npm install could not complete in this runtime.
- Mobile native APK/IPA not built; Next.js app still needs Capacitor configuration and physical device testing.
- OpenStreetMap and weather provider availability varies by network/location; offline weather and alerts remain unavailable.
- Model forecasts cannot certify work-rest cycles, ships at sea, roof radiant heat, shade geometry, or specific crop drought.
- Some old legacy TERRA07 routes and test names remain from the previous architecture. Removing them without a migration test could break existing functionality.
- True sun rise/set events require a verified astronomical/location timezone service for precision; this release intentionally labels its approximate next-daylight time as device-local.

## Verification commands

```
npm run test:v8
npm run test:guidance
npm run test:occupation
npm run test:toolkit
npm run qa
npm run typecheck
npm run build
```

The first five require Node 22+, later two require dependency installation.
