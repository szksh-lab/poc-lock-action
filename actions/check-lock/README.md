# check-lock

Action to check a given lock.

## Requirements

- GitHub CLI

## Example

```yaml
- name: Check lock
  id: check-lock
  uses: ./actions/check-lock
  with:
    github_token: ${{steps.token.outputs.token}}
    lock_branch: ${{env.LOCK_BRANCH}}
```

## Inputs

### Required

- `lock_branch`: A lock branch name (e.g. `lock/foo`)

### Optional

- `github_token`: By default, `${{github.token}}` is used. The permission `contents:read` is necessary

## Outputs

- `is_locked`: true or false.
- `commit_sha`: Full commit hash of a lock branch
