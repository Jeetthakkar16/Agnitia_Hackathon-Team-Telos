# TERRA07 3.2 validation record

**Passed:** Node test modules for shared Earth/Ocean/Climate logic, UI source invariants, 6/2 road selection, street-only palettes, name fallback, search lifecycle, selected-street filtering, field toolkit calculations and NOAA/marine/climate data calculations. Static QA and local TypeScript-import/syntax verifier passed. CSS `tinycss2` parser returned zero stylesheet errors for the two imported files, and essential p* selectors exist.

**Not performed:** a full Next.js production build, Microsoft Windows launcher execution, interactive Chrome browser acceptance or provider integration acceptance. The npm registry could not be resolved from the packaging runtime. A standalone headless-browser experiment timed out and does not count as a pass.

**Do not infer:** operational correctness of marine/cyclone services, a certified navigation capability, validated street temperatures, or a clinical risk score from source tests.

**Version evidence:** app header `v3.2`, `http://localhost:3007/api/version` returns `3.2.0`. Any localhost port `3000` view is another running server, not this release.
