# OUT OF SPEC RPG Stage 5.3.8 Validation Report

## Focus of this iteration

- Always supplement any side Punchy did not submit in the current first-person pass, without gating on the held item or offhand stack.
- Attempt to fill missing hands before held-item rendering and retain an end-of-frame fallback for frames without an item-render invocation.
- Attach hand geometry to Punchy's cached first-person `PlayerModel`, not the world entity model.
- Replace the thin camera-facing palm plates with a 3D palm centered in the native arm local plane (`z=0`) and almost native arm thickness; mirror the left-hand finger order.
- Use base arm skin-atlas UV regions, arm-width-aware geometry, fixed hand geometry scale and relaxed idle finger pose.

## Automated checks

- Full judge suite: exit code 0, 380 PASS lines, no FAIL/ERROR lines.
- Deep package-validation fixture: exit code 0; JDK packagers compiled and ran; merged archive read back; Punchy classes/assets/license/mixins retained; Stage 1.1 baseline payload unchanged.
- See `STAGE_5_3_8_TEST_STATUS.md` and `validation_logs/`.

## Explicit limits

No ForgeGradle build or Minecraft runtime test was performed by this environment. A clean source audit cannot confirm that the actual client will visually display the intended bilateral hands. The next required checks are `gradle clean build` on the user's Windows setup, followed by an in-game screenshot with empty hands and with an item held.
