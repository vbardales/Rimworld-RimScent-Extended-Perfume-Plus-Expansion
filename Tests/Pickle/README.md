# Pickle suite

This companion is development-only and is never part of `Mod/`. Its scenarios read the loaded
`HediffDef` objects after RimWorld has applied the optional patch files, and assert that the
`RimScentReworked.ModExtension_Scent` points to the expected thought. They do not claim that an
item was consumed or that RimScent's scanner produced a mood thought; those are separate runtime
behaviors.

Build the local step assembly before a run:

```powershell
dotnet build Tests/Pickle/Source/RimScentExtendedPerfumePlus.PickleSteps.csproj -c Release
```

Run only through the shared WSL launcher. Each feature has `@requires` tags, so it must be staged
in a pass that explicitly adds the corresponding optional mod; a skipped feature is not evidence.
The dependency maps are versioned in this folder: `wsl-ids.map` resolves the mod's hard
dependencies, while `wsl-deps.perfumes.map`, `wsl-deps.anima.map`, and `wsl-deps.social.map`
each activate exactly one integration, its non-core dependencies, and the local RimScent Extended
checkout. The package identities were read from the locally installed Workshop copies on
2026-09-26. Every submission must name its relevant map with `-DepMap`; no default map is assumed.

No scenario has been executed or visually reviewed. Their execution, report review, and startup-log
review are all evidence for `done -> tested`.
