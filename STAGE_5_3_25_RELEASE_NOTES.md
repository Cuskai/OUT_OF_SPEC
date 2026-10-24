# Stage 5.3.25 / Mod 0.6.34 — Release Notes

- Increased only the custom hand subtree to 1.12x.
- Added bounded, runtime contact correction driven by the existing twelve-pose contact metadata.
- Added two-hand interaction cost: attack, item use, and pick block are blocked during active seal input; ongoing item use is ended.
- Kept the successful Stage 5.3.24 bilateral standalone rendering hook, no-Punchy design, skin-textured arm model, and local anatomical hand basis.
- Did not add Epic Fight dependency. EF adapter remains future work.

The package is source/regression tested, but no ForgeGradle build or new in-game visual test was executed in this environment.
