# Testing

## Offline XML contract test

Run from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File Tests/Test-Xml.ps1
```

The test parses every distributed XML file and validates the nine owned scent thoughts and their
mood effects, every owned patch reference, all three hard dependencies, the three optional
`LoadFolders.xml` gates, the complete 60-entry French DefInjected inventory, and the delivered
image dimensions and size limits.

The shared 1.6 validators provide the complementary check against installed RimScent, Perfume
Expansion, and RimScent Extended definitions:

```powershell
powershell -ExecutionPolicy Bypass -File ../scripts/Check-XmlFields.ps1 -ModPath Mod
powershell -ExecutionPolicy Bypass -File ../scripts/Check-DefRefs.ps1 -ModPath Mod -AlsoScan <RimScentMod>,<PerfumeExpansionMod>,../RimScentExtended/Mod -Brief
powershell -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod Mod -Targets Mod,<RimScentMod>,<PerfumeExpansionMod>,../RimScentExtended/Mod
```

## Functional and Pickle scope

This repository owns XML definitions, translations, and `PatchOperation` declarations only. It
has no assembly, settings, UI, save data, custom callback, or player interaction. The offline
contract test covers the declarations the repository owns; testing RimWorld's dependency loading,
language switching, or RimScent's scent scanning would test those systems rather than this mod.

Therefore Pickle/Gherkin is `not_applicable` for the `preTest -> done` gate. A future Pickle
feature is required if this mod gains player-facing interaction, persistence, a custom callback,
or other behavior that cannot be reduced to these XML contracts. Runtime integration, English and
French display, and log validation remain required evidence for `done -> tested` and must use the
shared WSL harness when requested.
