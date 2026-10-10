# Release 02.1 — Local validation (2026-10-09)

- Road name tests: PASS, including primary OSM names, aliases, refs, missing names, locality truthfulness and OpenFreeMap class isolation.
- Nearby road selection: PASS (6 nearby / 2 nearby / distant excluded, clipping/deduplication).
- Isothermal display source checks: PASS (street lines, globe projection, fallback, no area-color fills).
- Heat/safety logic tests: PASS.
- Project QA / static local import checks: PASS.
- TypeScript parser: 0 syntactic diagnostics across TS/TSX sources.
- Full dependency-aware Next.js production build / WebGL browser execution: NOT performed in this container.
- Provider availability and street-name completeness depend on real OpenStreetMap data for the requested location.
- Source archive SHA-256 is reported separately at delivery.
