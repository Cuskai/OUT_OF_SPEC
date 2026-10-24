# Stage 5.3.25 Iteration Log

Baseline: Stage 5.3.24 / Mod 0.6.33 (user-confirmed both-hand visibility).

1. Added `HAND_MODEL_SCALE = 1.12f` on `hand_basis`; arm/sleeve scale unchanged.
2. Refactored end-of-frame rendering to prepare both rigs first, run the contact solver in a shared camera-space frame, then draw both hands.
3. Added bounded contact corrections from `PoseProfile.contacts()`: specified relations use stronger convergence, provisional relations use gentler convergence, and underdetermined `CROSSES` foreground order is left untouched.
4. Added Forge click/use input cancellation while the two-hand seal state owns both hands. An active ongoing item-use action is stopped. Interaction resumes after the release animation.
5. Added `tests/check_hand_scale_contact_and_occupancy.py` and wired it into Linux/Windows test runners.
6. Updated project identity and runtime marker to Stage 5.3.25 / 0.6.34.

No Punchy runtime dependency was reintroduced. No existing spell, growth, contract, input-session, UI, or Stage 1.1 baseline code was intentionally removed.
