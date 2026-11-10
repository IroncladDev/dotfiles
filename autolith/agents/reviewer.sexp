(:name "reviewer"
 :description "Check the current branch and highlight any regressions, problems, concerns, and user-facing changes. I use `jj`, not `git`, for version control. Read the commits messages in the current branch for more context and use `jj diff` to view the diff for a commit. Run `pnpm lint` and `pnpm type-check` to ensure my code passes those checks. Run related tests with vitest."
 :instructions ""
 :tools ("resource.read" "rearch.*")
 :spawns nil
 :models ("@parent")
 :reasoning-effort :high
 :blocking-p t
)
