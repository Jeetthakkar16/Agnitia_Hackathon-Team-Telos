# SAAYA v7.0 — Occupation Intelligence (Guidance Beyond Temperature)

Release date: 10 October 2026. Previous project: SAAYA v6.0.

## Product change

A weather summary is only one input. SAAYA now asks what the person does, their work environment, activity effort, protective equipment and whether they are new/returning to heat exposure. Its role-specific workspace combines these inputs with modeled weather and available marine data to display practical **planning prompts** and a private action checklist.

**19 differentiated roles** (not interchangeable theme labels): everyday life, farming, landscaping, unspecified outdoor work, construction, delivery, street vending, sanitation, traffic/field officer, fishing, coastal sailing, offshore/marine worker, cargo ship crew, port/dock worker, students, government/civic teams, healthcare/outreach, researchers and other jobs.

Each occupation has: a clear daily question; common barriers; role-specific actions; optional activity-condition profile; condition-dependent signals; a daily review checklist; and a local problem diary allowing workers to record and export issues without sending data to authorities.

### Concrete journeys

1. **Fisher:** complete onboarding as Fisher, choose a coastal address / accurate point, see modeled wave, wind, gust and sea-surface fields when available, review model distance from selected location, consult official INCOIS SAMUDRA, complete crew/comms/official-alert checklist, record any missing-warning or communications problems. A model value is *not* approval to depart.
2. **Cargo ship crew:** see shipboard heat and fatigue precautions, set 'heated indoor' + 'heavy' + 'PPE', receive context-aware follow-ups for shipboard measurements, workload, rest records and on-site procedures, plus auxiliary marine forecast for the selected nearest sea model cell. Outdoor data *cannot estimate engine-room temperatures*.
3. **Construction:** see specific actions for reflective rooftop/concrete surfaces, site WBGT, shaded rest, PPE, acclimatization, heavy work, and a checklist. SAAYA does not issue work/rest clearance.
4. **Outdoor everyday life:** choose local conditions, time errands and journeys, verify accessible shade/water; optional issue diary.
5. **Government:** field verification checklist for drinking water, shade and community cooling spaces; official alert verification; frontline-worker protections; ward evidence link. It is **not** yet a multi-user municipal command centre.
6. **Farmer:** the v6 multi-field crop-stage and model ETo × Kc views are retained, with new work-context checks and issues diary. No crop-specific forecast guarantees, field soil sensors or drought predictions.
7. **Delivery / street vending / sanitation / ports:** separate work obstacles, workplace controls, real-world support needs, and printable personal observations.

## How the reasoning works

- The **deterministic rule engine** (`lib/occupation-guidance.ts`) defines human-auditable role playbooks with sources. No LLM is diagnosing users or making safety-critical operational decisions.
- `additionalActions` adds precautions for heavy activity, PPE, hot indoor work, newcomers/returning workers, modeled rainy days and unavailable marine fields. No generic air-temperature threshold is used to certify any workplace as safe.
- `contextualSignals` separates missing weather (unknown) from genuine data and uses only explicitly labeled *illustrative planning bands* for modeled apparent temperature. An official hazard alert supersedes any model planning note.
- `parseMarineState` preserves missing numeric marine fields as `null`; never converts absence to 0. The UI hides sea-model values if the selected coordinate is more than 60 km away from the corresponding sea model cell.
- Marine requests run through the existing `/api/marine` Open-Meteo adapter. This endpoint delivers model values and their limitations, **not the full INCOIS warning feed**. We display direct official-source links; never infer 'all clear' from no feed results.
- Work condition selections and worker issue diaries stay in local/session browser storage according to the user's storage choice. They do not become public complaints and are not aggregated into a government dashboard.

## Sources and qualitative worker concerns

Full research rationale: `OCCUPATION_RESEARCH.md`. Specific relevant evidence includes WHO/WMO workplace heat, OSHA water/rest/shade and WBGT, ITF maritime climate risks, IMO fatigue, INCOIS services, and public worker accounts about shade, breaks and water.

## Engineering files added

- `lib/occupation-guidance.ts`: 19 work profiles, context rules, marine model parser, common barriers.
- `components/occupation-workspace.tsx`: responsive tailored workspace, marine overview, interactive context, reviewed action cards, local issue diary with export/delete.
- `app/occupations.css`: occupation cards in light/dark contexts and responsive narrow widths.
- `scripts/test-occupation.mjs`: repeatable checks for role coverage, missing data, dynamic hazards and domain-specific recommendations.

Other files revised: `lib/experience.ts`, `lib/decision-engine.ts`, `components/guided-home.tsx`, `components/experience-setup.tsx`, `app/experience.css`, `app/layout.tsx`, `tsconfig.json`, `package.json`, `START-SAAYA.bat`, `README.md`, `START_HERE.md`.

## Installation / verification

On Windows: extract the project archive, open `SAAYA-MOBILE`, double-click `START-SAAYA.bat`. Requires Node.js >=22 and Internet on first install. Local URL `http://localhost:3010/welcome`. Prefer `npm run test:occupation && npm run test:guidance && npm run qa && npm run typecheck && npm run build` in the same folder after installation.

**Validated:** occupation test, v6 guidance test, static QA, syntactic TSX transpilation, ZIP integrity. **Not validated in this container:** dependency installation, full Next.js build, mounted Android/iOS apps, live provider connectivity and physical-device UI testing. Deployment, push notifications, authentication, official marine feed integration and full municipal aggregation are not certified or claimed.

### Safety and evidence boundaries

- Open-Meteo personal/commercial licensing and fair-use terms require review before commercialization.
- An address or coordinate is a *model lookup*, not a sensor on a fishing boat, bridge, roof, farm, ship engine room or street.
- Official IMD, NDMA, INCOIS, maritime authority notices and site-specific OSH procedures always take precedence.
- SAAYA should not provide navigation, voyage clearance, occupational fitness, irrigation prescriptions, medical diagnoses or emergency dispatch.
- Stage C field trials are intentionally deferred until functional quality, localized information and validation are improved.
