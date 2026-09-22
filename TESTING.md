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
contract test covers the declarations the repository owns. It does not prove that RimWorld loaded
each optional patch and produced the intended runtime `HediffDef` extension.

`Tests/Pickle/` therefore contains the narrowly scoped `done -> tested` runtime suite. Its local
step reads each loaded target `HediffDef` after patch application and confirms that its
`RimScentReworked.ModExtension_Scent` references the expected thought. It deliberately does not
test RimWorld's dependency loading/language switch or RimScent's scanner. Build it with the command
in `Tests/Pickle/README.md`, stage each optional target through a verified named dependency map,
and run each feature in English and French using the shared WSL harness.
