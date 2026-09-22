---
localization: complete
translation_en: complete
translation_fr: complete
mod:          RimScent Extended: Perfume Plus Expansion
packageId:    nelim.rimscent.extended.perfumeplus
repo:         Rimworld-RimScent-Extended-Perfume-Plus-Expansion
visibility:   public
detached:     no
stage:        done
licence:      open
licence_at:   the same MIT base as RimScent Extended
dependencies: declared
showcase:     complete
settings_audit: not_applicable
tested_on:
workshop:
remaining:
  - unverified: never seen running; no in-game, Pickle, English/French UI, optional-integration, or log validation
session:      "audit, independent-repository initialization, static stage review, and offline test gate: 2026-09-22"
updated:      2026-09-22, AUDIT.md workflow audit; GitHub master verified; advanced to done
---

# RimScent Extended: Perfume Plus Expansion — status

The stage names are the AUDIT.md chain:
`dansMonoRepo -> horsMonoRepo -> ModIcon générée -> Preview générée -> preOptions -> options ->
l10n -> preTest -> done -> tested -> prepublished -> published`.

## Audit — 2026-09-22

Static audit source: monorepo commit `cf5553d5c99590504fe80fd664cc30aec16c82ba` (2026-09-20).
After that audit, this directory was initialized as an independent Git repository with local root
commit `a9b0a8bbd41f4b5051099a674aedb1788aff14fe` (2026-09-22). No RimWorld instance was launched.

### horsMonoRepo -> done

Validated as the last cumulative stage. This directory has its own `.git` repository, an
`origin` configured for `https://github.com/vbardales/Rimworld-RimScent-Extended-Perfume-Plus-Expansion.git`,
and root commit `fc9c750ba512e0f9876386c099a1200023add5de`; it is not a subtree. `CHANGELOG.md`
is present. `master` was pushed and its upstream was verified at the same commit on 2026-09-22.

The independent static checks establish the intermediate `ModIcon générée`, `Preview générée`,
`preOptions`, `options`, and `l10n` transitions: no unfinished-work markers were found; the
delivered icon and preview meet the documented dimensions; the preview directly shows distinct
amber, blue, and purple accents; `About.xml` has an English description and the conventional
visual suffixes `Extended` and `Plus`; the settings decision is justified `not_applicable`; and
the static EN/FR localization audit is complete. The dependency scan below also establishes the
`l10n -> preTest` dependency declaration/load-order criterion.

The identity is internally coherent (`nelim.rimscent.extended.perfumeplus`, package name and folder),
the public/open-MIT claim is backed by `LICENSE` and `ATTRIBUTION.md`, and README/attribution are
present. `Mod/LICENSE` is included in the distributable folder.

### Independent static validations retained

- `Mod/About/ModIcon.png`: directly inspected, PNG 128 x 128 (21,533 bytes).
- `Mod/About/Preview.png`: directly inspected, PNG 896 x 504 (564,410 bytes), below 1 MB; its
  distinct amber and blue/purple accents are legible. The 1,254 x 1,254 source artwork is retained
  at `Art/Preview-source.png`.
- All 13 XML files parse. `scripts/Check-XmlFields.ps1 -ModPath .`: 6 definition files checked,
  no unknown fields.
- `scripts/Check-DefRefs.ps1 -ModPath . -AlsoScan` with the installed RimScent (3645569466),
  Perfume Expansion (3649714034), and local RimScent Extended: no missing references, wrong types,
  or unresolved parents.
- `About.xml` correctly declares the three hard requirements; the optional Perfumes, Anima, and
  Social Supplements integrations are only `loadAfter` and are selected through matching
  `LoadFolders.xml` `IfModActive` gates. The Anima translation is separately gated for its
  `MayRequire` def.

## Settings audit — 2026-09-22

`settings_audit: not_applicable`. This is a definitions/patches-only compatibility and translation
mod: it has no C# code, serialized settings, configurable behavior, settings page, or MainButtons
definition. Inspection found no player-facing option that XML editing could usefully expose.
No empty Mod options page or shortcut is defined, which is the appropriate access contract here.

## Translation audit — 2026-09-22

`localization`, `translation_en`, and `translation_fr`: `complete` for static pre-`preTest`
coverage. English is the source text in the owned defs; French is supplied through DefInjected,
including the hard Perfume Expansion translation and separately gated optional integrations.

`scripts/Check-DefInjected.ps1 -TransMod . -Targets` with the same installed hard dependencies
and the local socle checked 60 keys with 0 errors. It specifically reported the Anima `MayRequire`
as a gated translation, matching its `RomyPerfumesAnima` load folder. No code-owned player text
exists to require Keyed resources. Runtime EN/FR display remains unverified until a later in-game
test stage.

## Done gate — 2026-09-22

`Tests/Test-Xml.ps1` was added and passed against the delivered tree: 13 XML files parsed; the
nine owned thoughts and their mood effects, patch-reference branches, hard dependencies, optional
folder gates, 60 French DefInjected entries, and delivered image limits all passed. `TESTING.md`
records the command and complementary shared 1.6 validator commands.

The offline test remains proportionate to the `preTest -> done` gate. A narrowly scoped Pickle
suite was subsequently added for `done -> tested`: it reads loaded target `HediffDef` objects and
checks that their runtime `ModExtension_Scent` references the intended thought. The local step
assembly builds with zero warnings; its execution is deliberately not claimed here. There is no
player-facing settings/UI or persistence scenario for this mod.

## Next transition: done -> tested

Run the documented integration validation in the shared WSL harness: minimal hard dependencies,
the optional Perfumes, Anima Expansion, and Social Supplements passes as available, plus English
and French display/log review. This is not a known defect and must not be inferred from the
offline results.
