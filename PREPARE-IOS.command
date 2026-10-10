#!/bin/zsh
cd "$(dirname "$0")" || exit 1
echo "SAAYA v10 iOS — Xcode/macOS required"
if [[ -z "$CAPACITOR_SERVER_URL" ]]; then
  read "CAPACITOR_SERVER_URL?Enter public HTTPS SAAYA URL: "
  export CAPACITOR_SERVER_URL
fi
if [[ -z "$CAPACITOR_SERVER_URL" ]]; then echo "Missing public HTTPS URL"; exit 1; fi
if [[ ! -d node_modules/@capacitor/cli ]]; then npm install || exit 1; fi
npm run native:ios:prepare || exit 1
echo "Open ios/App/App.xcworkspace in Xcode, configure signing, and test on device."
