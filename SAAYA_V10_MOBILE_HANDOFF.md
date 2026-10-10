# SAAYA v10 — Simple Mobile Edition (source handoff)

## What's changed
- Main flow: Welcome → pick occupation → optionally pick a place → Today / My day / Map / More.
- Guest mode is the default and **stays on the device** (localStorage after setup). No login required on later visits unless data is cleared or the app is uninstalled.
- Email OTP login remains optional and **requires your Supabase project**. Auth sessions may refresh locally when the user returns to login; this is not server-enforced API authorization.
- 21 occupations are retained; main screen uses two plain-language actions. Specialist information is in My day, while camera/compass/heart-rate tools remain in More.
- Main UI has translations for **15 languages**, including RTL support for Arabic and Urdu. Detailed occupation guidance, old tool pages and some errors still use English. These are NOT certified translations or every language in the world.
- Weather and marine info show unavailable if a model is missing. No false street-level heat, medical diagnoses, high blood pressure predictions or ordinary-camera thermal measurements.
- UI is intentionally narrow even on desktop to reflect iOS/Android proportions.

## Run locally
1. Install Node.js 22+.
2. Unzip. In SAAYA-MOBILE, run `START-SAAYA.bat` (Windows) or `npm install && npm run dev` (Mac/Linux).
3. Open `http://localhost:3010/welcome`.
4. Run `npm run test:v10`, `npm run test:all`, and `npm run build`.

## Android (requires internet and signing)
1. Deploy the full Next.js server (including `/api/*`) to your own public HTTPS host; test `/api/version`, `/api/guidance` and `/api/marine` on real locations. `next` here uses server API routes, **not a fully offline static website**.
2. On Windows run `PREPARE-ANDROID.bat` and enter the published HTTPS base URL. Or set `CAPACITOR_SERVER_URL=https://your-host.example` and run `npm run native:android:prepare`.
3. The script installs Capacitor dependencies, creates `android/` if needed, and syncs it. Open it in Android Studio with Android SDK, test on a physical phone, configure permissions and release signing.
4. Build an AAB/APK in Android Studio **only after** live device validation. Play Store publication needs a developer account, store policy compliance and signing credentials.

## iOS (requires Mac and signing)
1. Install Node 22+, Xcode, CocoaPods as required, and have an Apple Developer team.
2. Deploy the same HTTPS backend.
3. On macOS run `PREPARE-IOS.command` or `CAPACITOR_SERVER_URL=https://your-host.example npm run native:ios:prepare`.
4. Open the generated Xcode workspace, configure certificates, entitlements/privacy strings and provisioning, test on an actual iPhone, archive and submit.
5. Apple may reject thin WebView shells; ensure native app value, offline explanations, privacy declarations and device-specific UX.

## Known limits (do not market as implemented)
- This archive does **not** contain a built Android APK/AAB or iOS IPA. Store deployment was not performed.
- Background warnings after the app is killed are **not guaranteed**. Implement regional, authorized push services and native task policies before promising that feature.
- Main phrasebook covers 15 languages, not all content. Have qualified reviewers check translations and region-specific first aid before release.
- A weather model is not an on-site heat sensor. No phone camera measures live object temperature without actual infrared hardware.
- Compatible BLE heart-rate sensors may work with relevant device/browser support; Apple HealthKit and Android Health Connect are not integrated. No BP diagnosis or heatstroke diagnosis.
- The country-specific IMD/NDMA warning adapter must NOT be represented as global official alerts. Use official local authority feeds for each country before launching alerts there.
- The old specialist tool screens remain accessible behind More and can require further plain-language localization.
- Depend on a production-hosted backend. Login Supabase, notification permissions, weather providers and offline state must be tested on real phones before stores.

## Security and privacy
The optional account flow stores access and refresh tokens in this device's browser storage to reduce repeated sign-ins. That has XSS/shared-device risks. Conduct a full security review (CSP, auth callback handling, token refresh/revocation, storage strategy, OWASP mobile testing) before production.

## UI regression checks to run on actual devices
320px, 360px, 390px, tablets, landscape, system font at 200%, Arabic RTL, dark mode, large weather numbers, GPS denied, no network, changing city mid-request, sea point inland, app background/foreground, notification blocked, repeated login, account logout, compass without sensor, camera permission refused, screen reader headings and action focus order.
