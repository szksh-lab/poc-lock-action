# unlock

Action to unlock.

## Requirements

- GitHub CLI
- [suzuki-shunsuke/github-comment](https://github.com/suzuki-shunsuke/github-comment)

## Example

```yaml
- name: Unlock
  uses: ./actions/unlock
  with:
    github_token: ${{steps.token.outputs.token}}
    lock_branch: ${{env.LOCK_BRANCH}}
    target: ${{env.TARGET}}
    skip_comment: "true"
    maintainers: "@suzuki-shunsuke"
```

## Inputs

### Required

- `lock_branch`: A lock branch name (e.g. `lock/foo`)

### Optional

- `github_token`: By default, `${{github.token}}` is used. The permission `contents:write` is required. If `skip_comment` is `true`, `pull_requests:write` is also required
- `skip_comment`: true or false. The default is `true`
- `target`
- `maintainers`

## Outputs

Nothing.
