# Release 02 Validation — 2026-10-09

- Project QA: PASS.
- Pure heat/safety policy tests: PASS.
- Dynamic nearby real road count: six returns six, two returns two, far roads excluded, duplicates deduplicated: PASS.
- Vector tiles street-only/isothermal overlays and unified globe source checks: PASS.
- TypeScript/TSX syntax and local import-resolution: PASS (full list in release tests).
- Unchanged Checkpoint 01 ZIP SHA-256 verified.
- No dependency installation or full Next.js/WebGL/browser validation in this environment: npm registry returns `EAI_AGAIN`.
- Android project included as source; Gradle/APK/AAB signing and Play Store checks NOT executed.

## Live checks required
1. Windows: double-click `START-TERRA07.bat` and wait for http://localhost:3000.
2. Search Rajwada Palace, Indore, observe real named or unnamed roads within 450 m.
3. See blue/cyan at low model temperature and red at high model temperature when actual data provides those conditions; do not alter the data to force colors.
4. Click real mapped road to see estimate provenance; zoom out to Earth and return to local streets using the camera buttons.
5. Disable Overpass and verify vector tile road fallback; disable map data and verify clear unavailable indication, with weather independently functional.
6. Turn on tracking voluntarily; verify GPS and worker mode continue between screens while foreground tab active.
7. Install PWA from secure hosted page or localhost and re-open; API and map require network access.
