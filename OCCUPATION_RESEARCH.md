# SAAYA — Open Evidence / Worker Needs Review

Compiled 10 October 2026. This is a **qualitative needs synthesis**, not a representative survey, downloaded complaint database or machine-learning training corpus. No private social-media data or identities were imported into the project.

| Occupation | Documented need / concern | What SAAYA v7 does | What it cannot yet do |
|---|---|---|---|
| Construction / roof / concrete | Real workplace radiant heat, sun, PPE, manual workload; need water, shade, rest and site-specific WBGT | Shows role-specific protections, asks about protective equipment / effort, checklist and issue log | Estimate actual roof temperature or on-site WBGT |
| Fishing boats | Forecast/warning access, rough sea, ocean conditions, crew communication, fatigue; Indian fishers need official INCOIS warnings/PFZ | Queries marine weather model, exposes INCOIS link, pre-departure preparation actions | Clear a boat to depart; deliver official shipboard marine alarm or reliable offline offshore reception |
| Cargo shipping | Engine-room heat, restricted rest, fatigue, watches, enclosed work areas | Shipboard context, engine-room measurement reminder, crew rest checks, IMO link | Sense ship temperature or audit STCW rest-hour compliance |
| Offshore/marine workers | PPE/heat on deck, shifting marine conditions, site permits | Separate marine-worker action plan, wind/wave model context, permit and rescue reminders | Replace ship/platform permits or official operating limits |
| Port / dock workers | Reflective container yard heat, lifting restrictions, wind, breaks | Site-level heat and terminal limits checklist | Certify crane operations or distinguish gusts within terminal |
| Delivery riders | Public accounts describe missing shade, drinking water and inability to take breaks without losing income | Route and relief-stop reminders, private issue diary, model heat context | Confirm every cooling stop is open or provide wage compensation |
| Street vendors | Long work shifts without relief; stall appliances add heat | Stall ventilation and water/refill checklist | Inspect food products or certify food safety temperatures |
| Sanitation workers | Protective clothing, physical effort, limited break coverage | PPE-aware work-context messages, rest/shift checklist | Measure under-PPE heat burden |
| Traffic / public safety officers | Sun, pavement radiation and long stationary duty | Rotation, shade and water planning | Issue authoritative traffic-duty work restrictions |
| Farmers / landscapers | Weather-sensitive planting, water need, heat stress in fields | Retains field pin + crop stage and illustrated ETo×Kc, adds worker care | Measure soil moisture, promise yield or predict drought dates |
| Citizens, schools, care and government | Understand changing environmental exposure and how to act / verify resources | Role-specific checklist, official alert links, local evidence | Diagnose illness or attest cooling centre status |

## Core public sources

1. WHO/WMO (2025), *Climate change and workplace heat stress: technical report and guidance* — https://www.who.int/publications/i/item/9789240099814
2. WHO press summary — https://www.who.int/news/item/22-08-2025-who-wmo-issue-new-report-and-guidance-to-protect-workers-from-increasing-heat-stress
3. OSHA, *Heat - Heat Hazard Recognition* (WBGT, radiant heat, workload, PPE and forecast limitation) — https://www.osha.gov/heat-exposure/hazards
4. OSHA, *Heat - Water. Rest. Shade* — https://www.osha.gov/heat-exposure/water-rest-shade
5. ITF Global, *Climate — maritime shipping* (heat, fatigue, worksite risks) — https://www.itfglobal.org/en/supply-chain-guidance/risks-sector/maritime-shipping/occupational-safety-%2B-health/climate
6. IMO, *Seafarers hours of work and rest* — https://www.imo.org/en/ourwork/humanelement/pages/seafarers-hours-of-work-and-rest.aspx
7. INCOIS, *SAMUDRA*, official marine alerts and ocean state services — https://incois.gov.in/site/SAMUDRA/index.html
8. INCOIS, *Potential Fishing Zone Advisory* — https://www.incois.gov.in/MarineFisheries/PfzAdvisory.action
9. ILO, *Heat at work: Implications for safety and health* — https://www.ilo.org/publications/heat-work-implications-safety-and-health
10. FAO, *Crop Water Needs* — https://www.fao.org/4/s2022e/s2022e07.htm

## Qualitative public experiences (illustrative, not statistically representative)

- Workers referenced in an April 2026 Mumbai community discussion include delivery drivers, traffic officers and construction workers enduring outdoor heat — https://www.reddit.com/r/mumbai/comments/1snugp0/is_it_just_me_or_summers_feel_worse_every_year/
- A May 2026 public IndianWorkers discussion highlights difficulty securing shade, water and rest without losing earnings for gig workers — https://www.reddit.com/r/IndianWorkers/comments/1t5a2ju/indias_77_million_gig_workers_have_no_shade_no/
- ITF Global maritime guidance highlights occupational shipboard heat, engine-room exposure, hours of work and fatigue. This is a structured advocacy source, not a record of complaints in the user’s locality.

## Interpretation and product ethics

No public thread is proof that a specific named worker has a problem; no Reddit content is scraped, imported or silently monitored. Role issue options are prompts inspired by recurring themes from the sources, not verified local case counts. Users' private notes are *not* sent to a government office, safety inspector or employer. Only properly consented and independently validated future user research can establish the needs of particular communities or the effectiveness of the application.

## Next engineering priorities before Stage C

1. Reliable build, automated role interaction tests and mobile browsers/device QA.
2. An official INCOIS advisory ingest with timestamps, geospatial boundaries, stale/unavailable states and rigorous source checking (not synthetic notices).
3. On-site WBGT and indoor sensor integration only with validated/calibrated field devices and secure access.
4. Localized Hindi/Odia/Tamil/etc. content professionally reviewed by heat safety and maritime experts.
5. Verified location directory for shade/water facilities, employer privacy boundaries and a consent-based, audited civic feedback workflow.
6. Offline cached official warning metadata with explicit expiry and a visible stale-status warning; never present cached forecasts as live.
7. Scope-specific workflows for vessels/teams with organizational review and access controls before operational use.
