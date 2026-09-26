# Protocol reading record

Read on 2026-09-26 for repository commit `e76635e5a5c2f3aadd7333644730920a7402a4ab`.
The SHA-256 below is the version read. A document marked **deferred** was read, found irrelevant
to the current `done -> tested` work, and need not be reread merely because it changes; reread it
when its stated trigger becomes relevant. **Missing** means the requested path did not exist at
this checkout at the time of the pass.

| Document | Version read | Result / reread trigger |
| --- | --- | --- |
| `../AGENTS.md` | `36631e7304333692cf07d7eb7968ec97fc1c2533f9ff342a8b80dfe160b8bcf0` | **Superseded** for this session by the user instruction that earlier AGENTS rules no longer apply. |
| `../AUDIT.md` | `d5dc23b06e35f79b2ee5e7d52ab25132ab45d517962c31a3c19d1d1445d5b740` | **Used**: gates, evidence states, WSL-only testing, dispatcher-only run requests. |
| `../MOD_SETTINGS.md` | `404916bc99a7f1c6fc00d7ab51d417f86fc719ab62af023c4022f502d7a9f2c6` | **Used**: this XML-only mod remains `settings_audit: not_applicable`. Reread for any settings/UI change. |
| `../PUBLISHING.md` | `7d34f55d583d7f657cc66b899ca7d5d385584c02d1d138af40afe1a7d204342a` | **Deferred**: applies from prepublication onward. Reread before `prepublished`, CI, tag, release, or Workshop work. |
| `../TRANSLATIONS.md` | `298f74d226da2c4b9365d65a82275d0fe80c7edb3fe08910f6b452fbad945792` | **Used**: static EN/French result is distinct from pending runtime display review. Reread after text/Def changes. |
| `../STYLE_RIMWORLD.md` | `de13cbe5e1f978b7357eadedfc2df035b857e3641b0023fd2da6e44985ffb205` | **Deferred**: no preview/icon work is requested. Reread only for owner-led asset work or visual re-audit. |
| `../WORKSHOP_COMMENTS.md` | `6c69a05bb42493305b2400fe39a2cff2ff3a9196b3fd2f2671429816b39d3c69` | **Deferred**: comments are a publication task. Reread before drafting/posting Workshop comments. |
| `../scripts/SEARCHING.md` | `9dbd52b2bcd4ba66c7465c02c0e9c816b24f4251c0fd447561a315dfc15d20b4` | **Deferred**: no corpus search is currently needed. Reread before a Workshop-corpus query. |
| `../PickleTools/README.md` | `628350c7bcc3ecbfa14b6fe2a4655108065ffdc3b7e07b3a6016f879a123b67f` | **Used**: shared-tool catalogue and companion-map conventions. |
| `../PickleTools/Headless/README.md` | `488a0bb2ca831792c3b6f284e6457dd6fc47ba6d0b2cf24b7e36ec6075dbb54b` | **Used**: staging, evidence, pass-map, WSL and lock constraints. |
| `../PickleTools/docs/steps.md` | `0f897b4557a9b7414d95cfccbbea09db3fb3cce0ddac463a22dae1342678364a` | **Used**: no existing shared step reads a scent extension; local step remains necessary. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | `f6f85474f6d3dda1521d0fbb7625eee324f75b07ca2cc20dbf40951e93fc3ae2` | **Deferred**: reread before any CI, tag, GitHub release, secret, dry-run, or Steam publication action. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `135d16d524e875fad926588df27920b00eefb9a360e07c95361061072707fd21` | **Used**: a session submits a run; it never directly launches the WSL runner or watches the queue. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `90b7385b1bda5b88c20e053f2d68c5b07ff4e07eb885c53137cbafa73e6d8d80` | **Used**: one pass per request; owner, full SHA in label, and fresh evidence directory are required. |
| `STATUS.md` | `29071d57da81f6cbabfd1d27b27a429c226abe1bbb50586862bf17033d209316` | **Used**: stage is `done`; runtime integration and EN/FR checks are pending. |
| `README.md` | `e3bd091aa726fa527363ada6ecb6fe9e52889f72a4c184486a5b6e31cc32169b` | **Used**: integration scope and target behavior. |
| `CHANGELOG.md` | `2828ff37822050cc5f321fecc406b78c6b72f83242bd2eade826312747631c39` | **Deferred**: reread when making a release-notable change. |
| `ATTRIBUTION.md` | `ab4b8d56f60274b20b6df24ed36ab72291b4e14b0caccdf78dcd4dcb65d004d0` | **Deferred**: rights already audited; reread for attribution/rights/publication changes. |
| `LICENSE` | `ae6ae5fa894c78bb5c5b661ac6b51a86ceed7b5d596f2a7b2981218b16b26a94` | **Deferred**: reread for rights or release work. |
| `PUBLICATION.md` | **Missing** | Needed before `prepublished`; no publication action may infer it exists. |
| `TESTING.md` | `0d9a0fe83d9016db320f9c514b2aa03d3e3edcebc5d5c096e20151a0b10c6cb2` | **Used**: offline contract scope and the intended runtime assertion. |
| `BACKLOG.md` | **Missing** | The requested repository-local backlog is absent; the monorepo backlog was intentionally not read. |
| `docs/runs/` | **Missing** | No durable run evidence exists yet. Create/read an entry after a dispatcher-completed run. |
| `Tests/Pickle/` | `c797137f916129f0aa74f26b6d19bf2e08ad62a799d37499e98ffa86790bbf21` (suite README); features `d86fcb01`, `ed175636`, `bfeff542` | **Used**: three optional-integration scenarios; none executed. |
| `Mod/About/About.xml` | `f3469cd4c2982e1cbabbc472878fbc677ced38cd8e9ef98fee6483a6b39429d9` | **Used**: three hard dependencies and optional `loadAfter` targets. |
| `NOTES.md` | **Missing** | No repository-local notes to consult. |
| `BUGS.md` | **Missing** | No repository-local bug register to consult. |
| `docs/PROTOCOLS-READ.md` | **Created by this pass** | This is the local record required by the dispatcher documentation. |

## Current operational consequence

Do not call `Run-PickleWsl.ps1` from this session. After the optional integration IDs and named
dependency maps are available, freeze the tested tree, compile the companion step assembly, and
submit one dispatcher request per integration/language pass with a new `Tests/Pickle/Evidence/`
destination. Read the dispatcher result, report `exitReason`, scenario count, startup log, and
each relevant capture before changing `STATUS.md`.
