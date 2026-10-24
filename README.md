# OUT OF SPEC RPG — Stage 5.3.25 Contact-Aware Hand Poses

Mod version: `0.6.34`  
Build marker: `OUT_OF_SPEC_STAGE_5_3_25.0.6.34`  
Target: Minecraft 1.20.1 Forge, Java 17, Gradle 8.14.5

## This iteration

- Increased the hand subtree to `1.12x` through `hand_basis`; the forearm model itself remains at scale `1.0`.
- Connected the pose library's authored contact relations to a bounded camera-space correction pass. Up to seven iterations move individual finger bones, or the wrist for palm/dorsum contacts. Relations with explicitly specified details receive stronger correction; provisional relations receive a weaker correction. Unknown cross-over foreground order is not guessed.
- During active two-hand seal input, cancel attack, use-item and pick-block actions. An item already being actively used is stopped while the seal owns the hands. Interaction lock eases out with the seal pose; normal actions resume after the seal ends/cancels.
- Preserved standalone bilateral rendering, the local 180-degree anatomical hand basis, thin/finger-segment geometry, the twelve independent seal profiles and the no-Punchy architecture.

## First-person hands

OUT OF SPEC renders its own left and right first-person hands at the end of the vanilla hand/item pass. Punchy is not bundled, registered in `mods.toml`, used on the compile classpath, or targeted by an active Mixin. Vanilla continues to render held item models. Map, bow, crossbow, and trident layouts still remain on the vanilla path.

The hand basis is scaled to `1.12x`; forearm geometry remains unchanged. Contact correction consumes `HandSealPoseLibrary.PoseProfile.contacts()` at runtime, rather than treating those relations as documentation only. Because some relations have only provisional crossover details, this is a first contact-calibration pass rather than a claim that all twelve signs are visually final.

## Two-hand item-use limitation

While the seal-input state machine is accepting the twelve basic seals or additional seals, the Forge interaction input event cancels attack/use/pick-block. A continuing item-use action (for example, an already-held use action) is stopped as well. This is a client input lock for the first-person seal interaction; server gameplay still remains server authoritative for casting/contracts.

## Epic Fight future bridge

Epic Fight is not required by this project. It can later receive a separate adapter that feeds its animation pose into the shared pose-data layer. No EF runtime bridge is included in this version.

## Build and verification

From this folder run `gradle clean build` using Gradle 8.14.5 and JDK 17. The expected merged installable artifact is `build/libs/OUT_OF_SPEC_RPG_IronSpell_SAO_Stage5_3_25_ContactAwareHandPoses.jar`.

`tests/run_judge_tests.sh` runs dependency-free Java model tests and source/configuration audits. Passing those tests does not replace ForgeGradle compilation or in-game visual verification. Check ordinary hands, running/holding items, and all seal poses in Minecraft.
