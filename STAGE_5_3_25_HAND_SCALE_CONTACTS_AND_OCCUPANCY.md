# Stage 5.3.25 — Hand Scale, Contact-Aware Poses, and Two-Hand Occupancy

## Scope

Baseline: Stage 5.3.24 / Mod 0.6.33, the first version confirmed by the user to show both custom first-person hands. This is an incremental change; it does not reintroduce Punchy or replace the bilateral rendering hook.

## 1. Hand-only scale

Added `HAND_MODEL_SCALE = 1.12f` to the `hand_basis` bone on all three axes. This scales the palm, wrist transition, thumb and finger segments together while leaving the arm and sleeve at `1.0` scale. It is intentionally a mild increase, not a camera FOV/zoom change.

## 2. Contact-aware seal posing

`HandSealPoseLibrary.PoseProfile.contacts()` is now consumed by `solveAuthoredContacts` before the left/right models are drawn. The solver:

- prepares both hand rigs before measurement so both sides share the same camera-space frame;
- samples a point on the authored element/segment using the current ModelPart transforms;
- targets a gap based on relation type and the approximate radii of the participating segments;
- moves the element's own bone where possible, using the wrist only for palm/dorsum surfaces;
- iterates up to seven times and clamps each correction to avoid large pose jumps;
- applies stronger correction when the written relationship is specified and a lower gain for provisional details;
- does not invent foreground/background order for `CROSSES` constraints whose foreground side is unspecified.

This makes contact constraints executable pose correction rather than metadata only. It remains a first-pass solver: the written specs explicitly leave several crossovers and wrap details for visual calibration, so the game view remains the authority for final pose quality.

## 3. Two-hand action cost

`SealInputDebugClient` listens for Forge `InputEvent.InteractionKeyMappingTriggered`. During active seal-input/hand-occupancy state it cancels attack, use-item, and pick-block. It also calls `stopUsingItem()` if an item-use animation was already active when the player began the seal sequence. The lock remains through the articulated release and then returns input to normal.

This is an input-level limitation; it does not remove items from slots or force a hotbar change. The casting/contract outcome continues to be validated by existing server-side logic.

## Regression expectations

- Hand subtree is 1.12x, forearm stays 1.0x.
- Both hands remain rendered by the standalone bilateral hook.
- Twelve seal profiles remain registered.
- Only authored, bounded contact corrections are applied; ambiguous crossover depth is not guessed.
- Attack, item use and pick-block are canceled while both hands are occupied; ongoing use stops; normal interaction resumes after cancellation/completion.

## Verification boundary

Pure-Java and source/configuration tests can validate model data and wiring, but they cannot prove Minecraft's final 3D appearance. ForgeGradle compilation and in-game checks are reported separately in `STAGE_5_3_25_TEST_STATUS.md`.
