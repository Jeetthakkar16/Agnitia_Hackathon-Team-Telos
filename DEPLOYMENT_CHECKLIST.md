# TERRA07 Vercel Release Checklist

## 1. Build gate

From the project root:

```bash
pnpm install
pnpm typecheck
pnpm qa
pnpm test:pure
pnpm build
```

Do not promote a deployment if any command fails.

## 2. Vercel configuration

- Framework preset: **Next.js**
- Root directory: project root
- Install command: from `vercel.json`
- Build command: from `vercel.json`
- Recommended environment variable:
  - `TERRA07_USER_AGENT=TERRA07/2.0 (+https://YOUR-DOMAIN; contact=YOUR_EMAIL)`
- Add the final HTTPS domain before a public pitch.

No paid map/weather key is required by the default investor build.

## 3. API smoke tests

Open these on the preview deployment:

- `/api/weather?lat=22.7196&lon=75.8577`
- `/api/thermal?scope=global&zoom=1.8&metric=temperatureC&series=1`
- `/api/thermal?scope=global&zoom=1.8&metric=apparentC&series=1`
- `/api/search?q=Indore`
- `/api/forecast?lat=22.7196&lon=75.8577`

Each should return JSON rather than an HTML error page. Provider outages must produce an explicit unavailable/error response rather than fabricated values.

## 4. Product smoke tests

### Earth
- globe renders before thermal data finishes;
- satellite texture is visible;
- thermal field appears and the legend matches the blue→red scale;
- switching **Feels-like / Air temperature** changes the layer correctly;
- forecast scrubber works from now through +24 h;
- drag, zoom and rotation remain smooth;
- thermal-provider failure leaves the map usable.

### Local detail
- search a city;
- switch to Local detail;
- zoom/pan freely;
- real road geometry appears after zooming in;
- road heat colours are clearly labelled model estimates;
- at close zoom, mapped buildings/green areas load when available;
- clicking a road updates its name/status.

### My Safety
- survey can be completed without an account;
- consent choice is respected;
- official warning cannot be weakened by personalisation;
- fluid-restriction guidance never gives a universal litre target;
- emergency workflow is reachable and readable on mobile.

### Cool Routes
- origin/destination search works;
- route provider errors are visible;
- alternatives never claim verified shade unless such data is actually connected.

### City Intelligence
- no internal “Partial Heat Priority Index” is exposed to ordinary users;
- connected factors are distinguishable from unavailable factors;
- verification queue is understandable in plain language.

## 5. Mobile QA

Test at least one physical Android phone plus Chrome responsive sizes:

- 360×800
- 390×844
- 412×915
- tablet around 768 px width

Check touch targets, bottom/desktop navigation, search suggestions, map gestures, dialogs and emergency content.

## 6. Investor-demo rehearsal

Use `docs/PITCH_DEMO_SCRIPT.md` and keep the live demonstration under three minutes. Preload the deployment before going on stage, but do not replace real provider data with fake values.

## 7. Production upgrade before scale

The public OpenFreeMap service is useful for the investor/pilot build but is provided without an SLA. Before meaningful paid scale, self-host tiles or contract an SLA-backed provider. Complete medical review and local model validation before marketing TERRA07 as a health-safety product at scale.
