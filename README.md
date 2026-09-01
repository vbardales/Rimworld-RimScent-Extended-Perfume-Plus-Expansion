# RimScent Extended: Perfume Plus Expansion

Tout ce qu'un colon porte, boit ou respire et qui lui reste dessus. RimWorld 1.6.

## Traduction de l'extension parfums

L'[extension parfums](https://steamcommunity.com/sharedfiles/filedetails/?id=3649714034)
n'a **aucun dossier `Languages`**. Ses 16 defs sont traduits ici : 5 hediffs, 5 pensées,
5 parfums, la recherche. Comme c'est une dépendance dure, la traduction est à la racine du
mod, sans `IfModActive`.

## Mod Perfumes (Romyashi)

Le mod a toute une parfumerie — flacons, alambic, recherche — et **pas une seule
`ModExtension_Scent`**. Chaque parfum sent désormais ce dont il est fait :

| Parfum | Odeur |
|---|---|
| floral | fleurs |
| végétal | verdure coupée |
| de chasse | le mélange qui masque |
| ancien | retrouvé dans les ruines |
| d'anima | l'arbre |
| pétales d'aromafleur | réutilise `RimScent_FloweryScent` |

Le parfum d'anima vient d'un module séparé et porte un `MayRequire` dessus. Deux pièges
traités :

- son patch est enveloppé dans un conditionnel imbriqué — si le def n'existe pas, rien ne
  se produit et aucune erreur n'est levée ;
- **sa traduction est isolée** dans `RomyPerfumesAnima/`, conditionné au même mod : une clé
  qui vise un def absent est une erreur de chargement, pas un avertissement.

## Social Supplements

| Cible | Odeur |
|---|---|
| les 3 « Scenters » portés (hediffs) | parfum porté, +3 |
| 2 vapotages (hediffs) | nuage de vapeur, −1 |
| bain de bouche, thé à la menthe, plante et feuilles de menthe | menthe, +2 |
| piments, sauce piquante | piment dans l'air, −1 |
| polyfleur, pétales, jus | **réutilise** `RimScent_FloweryScent` |

L'odeur du vapotage dure exactement ce que dure l'effet, comme `SmokeleafHigh` en amont.

La polyfleur ne porte **pas** `purpose="Beauty"` — vérifié — donc le patch fleurs générique
ne l'attrapait pas.

## Pourquoi les odeurs portées fonctionnent

RimScent ne lit sur un pion voisin **que ses `HediffDef`**. Un parfum posé sur l'objet ne
sentirait rien une fois le flacon rangé ; posé sur le hediff que le flacon applique, il suit
le colon. C'est le seul point d'accroche disponible, et c'est celui que ces mods offraient
déjà sans le savoir.

`RimScentExtended_Scent_WornScent` est partagé avec d'autres extensions et reste donc
**déclaré dans le socle**.

## Dépendances

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- [RimScent: Perfume Expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=3649714034)
- RimScent Extended (le socle)

Perfumes, Anima Expansion et Social Supplements ne sont pas requis : chaque volet ne se
charge que si son mod est actif, via `LoadFolders.xml`. Rien n'est écrit dans la sauvegarde.

## Licence

MIT — voir [LICENSE](LICENSE) et [ATTRIBUTION.md](ATTRIBUTION.md).
