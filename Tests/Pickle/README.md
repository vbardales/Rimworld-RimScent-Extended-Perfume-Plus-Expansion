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
The optional workshop identifiers and dependency maps have not yet been recorded, so no command is
claimed runnable yet. Once those ids are verified, add one named dependency map per supported
integration and run each feature in English and French.

No scenario has been executed or visually reviewed. Their execution, report review, and startup-log
review are all evidence for `done -> tested`.
