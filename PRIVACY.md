# TERRA07 privacy deployment checklist

TERRA07 can process precise location, broad health-safety preferences and an optional trusted contact. Treat these as sensitive application data.

- Collect only the minimum fields needed for heat-safety timing.
- Make the profile voluntary and editable/deletable.
- Do not place health conditions, pregnancy, medication concerns or fluid restrictions in lock-screen notification text.
- Encrypt transport and production storage, rotate secrets and restrict operator access.
- Separate analytics from health-profile data; do not use health data for advertising.
- Keep an auditable consent/version record for profile fields and notification permissions.
- Provide retention/deletion rules before public launch.
- Obtain legal/privacy review for every deployment jurisdiction.

The included browser build stores a profile on the device only when the user explicitly opts in. The optional D1 Worker is a deployment scaffold and requires real authentication/authorization before public use.
