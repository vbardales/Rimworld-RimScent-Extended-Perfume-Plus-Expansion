# RimScent Extended: Perfume Plus Expansion

Everything a colonist wears, drinks or breathes that stays on them afterwards. For RimWorld 1.6.

## A translation for the perfume expansion

The [perfume expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=3649714034) has
**no `Languages` folder at all**. Its 16 defs are translated here: 5 hediffs, 5 thoughts,
5 perfumes, the research. Since it is a hard dependency, the translation sits at the root of the
mod, with no `IfModActive`.

## The Perfumes mod (Romyashi)

The mod has a whole perfumery — bottles, still, research — and **not one
`ModExtension_Scent`**. Each perfume now smells of what it is made from:

| Perfume | Smell |
|---|---|
| floral | flowers |
| herbal | cut greenery |
| hunting | the blend that masks |
| ancient | recovered from ruins |
| anima | the tree |
| aromafleur petals | reuses `RimScent_FloweryScent` |

The anima perfume comes from a separate module and carries a `MayRequire` for it. Two traps
handled:

- its patch is wrapped in a nested conditional — if the def does not exist, nothing happens and
  no error is raised;
- **its translation is isolated** in `RomyPerfumesAnima/`, gated on the same mod: a key aimed at
  a missing def is a load error, not a warning.

## Social Supplements

| Target | Smell |
|---|---|
| the 3 worn "Scenters" (hediffs) | worn perfume, +3 |
| 2 vape hediffs | vapour cloud, −1 |
| mouthwash, mint tea, mint plant and leaves | mint, +2 |
| chillies, hot sauce | pepper in the air, −1 |
| polyflower, petals, juice | **reuses** `RimScent_FloweryScent` |

The vape smell lasts exactly as long as the effect does, like `SmokeleafHigh` upstream.

The polyflower does **not** carry `purpose="Beauty"` — checked — so the generic flower patch was
not catching it.

## Why worn scents work at all

On a neighbouring pawn, RimScent reads **only their `HediffDef`s**. A perfume put on the item
would smell of nothing once the bottle is shelved; put on the hediff the bottle applies, it
follows the colonist. It is the only hook available, and it is the one these mods were already
offering without knowing it.

`RimScentExtended_Scent_WornScent` is shared with other expansions and is therefore **declared
in the socle**.

## Requirements

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- [RimScent: Perfume Expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=3649714034)
- RimScent Extended (the socle)

Perfumes, Anima Expansion and Social Supplements are not required: each section loads only if its
mod is active, through `LoadFolders.xml`. Nothing is written to the save.

## Licence

MIT — see [LICENSE](LICENSE) and [ATTRIBUTION.md](ATTRIBUTION.md).
