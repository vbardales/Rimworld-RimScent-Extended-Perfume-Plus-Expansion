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

## Evidence retention

Pass `-EvidenceDir RimScentExtendedPerfumePlusExpansion/Tests/Pickle/Evidence/<run-name>` for
each submitted pass. The copied report, startup log, and any capture stay on disk only under the
ignored `Tests/Pickle/Evidence/` folder; they are not Git artifacts. After reviewing a successful
pass, retain only its most useful complete evidence set for this mod version (the final English or
French pass that includes the report and startup log), deleting superseded copies. Commit instead a
short factual summary in `docs/runs/` that identifies the tested commit, pass set, language,
scenario counts, `exitReason`, and retained evidence directory.

There are no `@review` scenarios, settings, UI, persistence, save migration, or MainButtons
shortcut in this definitions-only mod. Those manual checks are therefore not applicable; the
runtime obligation is fully covered by the conditional HediffDef integration scenarios in English
and French.
