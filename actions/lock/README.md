# lock

Action to lock.

## Requirements

- [int128/ghcp](https://github.com/int128/ghcp)
- [suzuki-shunsuke/github-comment](https://github.com/suzuki-shunsuke/github-comment)

## Example

```yaml
- name: Lock
  uses: ./actions/lock
  with:
    github_token: ${{steps.token.outputs.token}}
    lock_branch: ${{env.LOCK_BRANCH}}
    target: ${{inputs.target}}
    skip_comment: "true"
```

## Inputs

### Required

- `lock_branch`: A lock branch name (e.g. `lock/foo`)

### Optional

- `github_token`: By default, `${{github.token}}` is used. The permission `contents:write` is required. If `skip_comment` is `true`, `pull_requests:write` is also required
- `skip_comment`: true or false. The default is `true`
- `target`

## Outputs

Nothing.
