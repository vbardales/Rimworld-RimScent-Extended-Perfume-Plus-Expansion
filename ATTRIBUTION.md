# Attribution

## RimScent, and its perfume expansion

by **reo / ocarina0001** — MIT.

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- [RimScent: Perfume Expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=3649714034)

A companion mod, not a fork. No file from either is copied or redistributed. Both are declared
as hard dependencies; we use `RimScentReworked.ModExtension_Scent`, their own public extension
point, and reuse their `RimScent_FloweryScent` where it fits rather than adding one more.

The French translation of the perfume expansion is original work.

## Mods read by this expansion

Nothing is copied from them. Each is targeted only by `PatchOperation`s, in a folder that loads
only if the mod is active:

- **Perfumes** (`romyashi.perfumes`) and its **Anima Expansion** module
  (`romyashi.animaexpansion`).
- **Social Supplements** (`mlie.socialsupplements`).

## This mod

MIT, © Nelim. Defs, patches and translations are original work.
