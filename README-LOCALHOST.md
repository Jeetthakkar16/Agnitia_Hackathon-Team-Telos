> **For the current v4.0 release, read `START_HERE.md` and `README.md` first. This historical v3.x guide is retained for reference.**

# Release 02.3 — Localhost

**CURRENT RELEASE: 02 — UNIFIED 3D EARTH STREET HEAT**

See [RELEASE_02_CHANGES.md](RELEASE_02_CHANGES.md) and [RELEASE_02_VALIDATION.md](RELEASE_02_VALIDATION.md). The original locked Checkpoint 01 was preserved as a separate ZIP. The prior road-count and Local Detail references in historical documentation below describe the earlier baseline.

# TERRA07 STREET-ONLY HEAT FIX

The latest street temperature rendering changes are documented in [STREET_ONLY_ISOTHERMAL.md](STREET_ONLY_ISOTHERMAL.md). Local detail shows up to four nearby real OSM road line segments colored by the current regional weather-model temperature. No heat-filled squares or polygons. Street geometry uses OpenFreeMap vector tiles first and Overpass fallback. Road temperature differences are not invented.

> **Installer fix:** pnpm 11 build approvals are now configured using `allowBuilds`, and the Windows launcher repairs failed first installs. See [INSTALL_FIX.md](INSTALL_FIX.md).

> **Focused Lanes update:** This ZIP starts with up to four nearby highlighted mapped roads instead of a globe-wide heat wash, and adds opt-in Outdoor worker mode. See [FOCUSED_HEAT_AND_WORKER_MODE.md](FOCUSED_HEAT_AND_WORKER_MODE.md) for the full scope and safety limits.

# TERRA07 — run locally on Windows

This package is the **complete Next.js TERRA07 investor edition**, prepared to show the full website as HTML in your browser at **http://localhost:3009**. It is not a static-only mockup. The local server enables `/api/weather`, `/api/thermal`, `/api/search`, `/api/route`, and other server-backed features.

## One-click start (Windows 10/11)

1. Extract the new `TERRA07-FOCUSED-LANES-WORKER.zip` completely, e.g. to `C:\TERRA07-LOCALHOST`.
2. Install Node.js 22+ if you don't already have it. Node.js 24 is fine.
3. **Double-click `START-TERRA07.bat`.** If Windows asks permission for `npx`, allow it. On first start it installs packages (you need internet).
4. Keep the black terminal window open. Once Next.js becomes ready, Chrome/Edge will automatically open `http://localhost:3009`.
5. To stop, focus the terminal and press **Ctrl+C**. To restart, run `START-TERRA07.bat` again.

You can also open `OPEN-TERRA07.html` *after* the server has started; it's simply a link/redirect to the real locally served app, not an alternate offline HTML build.

## Manual way (Windows CMD)

```bat
cd /d C:\TERRA07-LOCALHOST
npx pnpm@11.25.0 install
npx pnpm@11.25.0 dev --hostname 127.0.0.1 --port 3009
```

Open http://localhost:3009.

## What to expect

- `/`: four nearby mapped lane highlights and a nearby model-based forecast timeline (3D Earth remains an optional satellite view).
- `/safety`: personal safety plan and official-warning context.
- `/onboarding`: optional personal context survey (stored locally until real secure sign-in/backend integration).
- `/routes`: walking route exploration (third-party routing provider availability varies).
- `/city`: mapped city evidence and planning context.
- `/learn`: controlled heat-safety guidance.

The **detailed map and lane heat estimates depend on internet access** for map styles, Overpass road geometry and the Open-Meteo weather model. Satellite tiles/terrain load only in optional 3D Earth mode. The app deliberately shows unavailable status if a provider cannot be reached. There is **no Google Maps API key requirement** in this build. Provider services may rate-limit or fail; nearby OSM lane availability varies by location/network. Heat fields are model estimates, not per-street sensors. 

## Troubleshooting

- **White/empty/error page**: read the terminal error. Run `RUN-TESTS.bat` and send the output. Some sites block remote map tiles or WebGL.
- **Port 3009 in use**: stop another local Next server (Ctrl+C in its window), then relaunch.
- **No map detail**: make sure you have internet, hardware acceleration enabled in Chrome/Edge, and no network blocker for the tile provider. Even if tiles fail, weather is still separate; never read a missing map as a temperature observation.
- **Blocked first-party downloads**: `npx pnpm@11.25.0 install` needs access to the npm registry. Try an unrestricted connection.
- **Slow first run**: Next.js must compile the app; subsequent runs are faster. Expect weather/model data to load asynchronously.
- **Google Sign-in**: not included as a real login until Google OAuth and secure account infrastructure are configured.

## Development & release

This is also the same codebase prepared for Vercel deployment, see `VERCEL_DEPLOY.md`. Run `RUN-TESTS.bat` after modifying code; before production launch run `npx pnpm@11.25.0 build` and verify all public-safety requirements. Medical advice and city/alert claims require domain-expert review before public deployment.

## Developer note

`START-TERRA07.bat` never requires Administrator/`corepack enable`: it uses `npx pnpm@11.25.0`, the method already working on your PC.

## Worker tracking notes

Press **My location** to start or stop explicit foreground tracking. Expand **Outdoor worker mode** to start a shift, view accuracy, confirm shade/water/buddy readiness, set timed check-ins and take breaks. Tracking and shift state stay active while navigating within TERRA07, but closing/suspending the browser may stop GPS updates; no phone-level background guarantee. Coordinates are sent to the map/weather lookup services but are not stored as a GPS trail by TERRA07. This is not employer monitoring software or medical advice.


## Release 02.1 — Road names

User-facing street labels now use real mapped OSM names/aliases/references. Unnamed roads are marked `Unnamed road` with a verified nearby locality where available; OSM road categories such as `secondary` or `residential` are never displayed as invented street names. See `REAL_STREET_NAMES_02_1.md`.

## Release 02.2 search popup correction

The main Earth search is now a clean submit-only field: it no longer displays a
suggestion panel on top of the map. Other search fields may suggest while typing,
but close on completion. Run `npx pnpm@11.25.0 test:search` to check this.


See `docs/README.md` and root `START_HERE.md`.
