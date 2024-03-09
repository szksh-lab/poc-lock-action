# merge

Action to merge.

## Requirements

- GitHub CLI
- [int128/ghcp](https://github.com/int128/ghcp)
- [suzuki-shunsuke/github-comment](https://github.com/suzuki-shunsuke/github-comment)

## Example

```yaml
- name: Merge
  uses: ./actions/merge
  with:
    github_token: ${{steps.token.outputs.token}}
    target: ${{env.TARGET}}
    lock_branch: ${{env.LOCK_BRANCH}}
    pr_number: ${{github.event.issue.number}}
```

## Inputs

### Required

- `lock_branch`: A lock branch name (e.g. `lock/foo`)
- `pr_number`: A pull request number to merge

### Optional
- `github_token`: By default, `${{github.token}}` is used. The permission `contents:write` and `pull_requests:write` are required
- `target`

## Outputs

Nothing.
