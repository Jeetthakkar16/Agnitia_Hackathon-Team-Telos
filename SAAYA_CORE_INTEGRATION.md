# SAAYA Core integration

Source: portable JavaScript modules in `lib/saaya-core/` (validation, Open-Meteo provider, activity decision engine). Used by both the standalone developer proof and **AAVRA v13**, the upgraded original SAAYA v10 application.

REST endpoints: POST `/api/saaya/evaluate`; GET `/api/saaya/forecast?latitude=...&longitude=...&mode=live|demo`.

Response: `assessment.attention`, `assessment.flags`, `assessment.conditions`, optional `assessment.alternative`, `assessment.guidance`, and `provenance` (synthetic boolean, weather provider, retrieval time, timezone and notes). Errors use `{error:{code,message,details?}}` with HTTP 400, 422 or 503 (or 500 for unknown errors).

Weather data types: forecast *gridded estimates*, not direct body temperatures. Flag thresholds are screening cues, not evidence of safe/unsafe activity. Missing data yields errors rather than fabricated fallback. No automatic claims that official warnings have been checked.

The client `public/saaya-client.js` is only a light SDK; this prototype has **no API authentication**. A future production server must add auth/tenant isolation, rate limits, licensing review, load tests, multi-provider evaluation, formal guidance review and alert governance.

## Testing

`npm run test:core` requires Node 22 but not npm package installation. `npm run typecheck` and `npm run build` require Next.js dependencies installed.
