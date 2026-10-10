# Installation fix — pnpm 11

This release corrects pnpm 11's `ERR_PNPM_IGNORED_BUILDS` error.

**Root cause:** The previous archive used `onlyBuiltDependencies` in `pnpm-workspace.yaml`. pnpm 11 removed that setting in favor of `allowBuilds`.

The new `pnpm-workspace.yaml` includes:

```yaml
packages:
  - '.'
allowBuilds:
  esbuild: true
  sharp: true
```

The launcher now uses a `.terra07-deps-ready` marker created only after a successful installation. If an earlier installation failed, a new extraction of this release triggers repair rather than treating `node_modules` as complete.

## Run

1. Extract the ZIP into a new folder (do not merge with an old installation).
2. Double-click `START-TERRA07.bat`.
3. Keep the command window open and visit http://localhost:3000.

## Fix an already extracted older version without downloading again

Replace the contents of `pnpm-workspace.yaml` with the YAML block above. Open CMD inside the same directory and run:

```bat
npx pnpm@11.25.0 install
npx pnpm@11.25.0 dev --hostname 127.0.0.1 --port 3000
```

No Administrator permission, Corepack changes, blanket `dangerouslyAllowAllBuilds` setting, or pnpm update is required.

## Notes

- The deprecated transitive dependency warnings are not this error.
- If `pnpm install` still fails, provide the new error output; do not weaken pnpm's security settings globally.
- Package/runtime compilation and network-provider behavior must still be tested on the user's Windows machine.
