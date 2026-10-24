# Stage 5.3.25 Test Status

## Passed

- `tests/run_judge_tests.sh`: exit code 0. The full portable regression suite completed, including 442 HandSealPoseLibrary assertions, spell growth, casting/session, contract, UI and source/package checks.
- Focused hand audit: passed — 1.12x hand-only scale, contact solver connected to pose constraints, attack/use/pick-block interaction lock, stop of an already-active item-use action, and Stage 5.3.25/0.6.34 identity.
- `OUT_OF_SPEC_DEEP_PACKAGE_TEST=1 python3 tests/validate_project.py`: passed. The JDK merger compiled; the add-on/mixin configs merged; Stage 1.1 baseline CRC/size and critical class checks passed; Punchy metadata was not introduced.
- Resource/config validation: all 12 JSON files parsed; expanded `mods.toml` declares only OUT OF SPEC; package baseline SHA-256 remains `ebb72ec47f22b64fbac3ab58ff96f9d0df5fe276638bb3cb57bf3b1832fd1fda`.

## Not verified here

- Full ForgeGradle `gradle clean build`: not run, because this execution environment has no Gradle executable or populated ForgeGradle cache.
- Minecraft in-game visual verification: not run. The user must check the increased size, actual finger contacts on the twelve poses, item interaction lock/unlock, running/holding states, and cancel/completion recovery.

The test suite explicitly does not substitute for Forge compilation or an in-game render test. No claim is made that every contact is visually perfect before the next screenshots are reviewed.
