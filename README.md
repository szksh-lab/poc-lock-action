# poc-lock-action

PoC of the lock mechanism for CI with GitHub branches

Sometimes we want to prevent pull requests from being merged until jobs on the head branch are finished.
For example, if you run `terraform apply` on the default branch, you may want to prevent pull requests from being merged into the default branch until `terraform apply` is finished on the default branch.

This PoC implements the lock mechanism with GitHub branches.

## Overview

By GitHub branch protection, disable all users to merge pull requests themselves and allow only a GitHub App to merge pull requests.
To merge pull requests, users have to post a comment `/merge` to pull requests.

When a comment `/merge` is posted, the GitHub Actions Workflow `merge` is run.
The workflow checks if the deploy is locked.
If the deploy is locked, the pull request isn't merged.
Users have to wait until the lock is released.
If the deploy isn't locked, the workflow gets a lock and merge the pull request.
If it fails to get a lock, the pull request isn't merged.
If the workflow can get a lock but can't merge the pull request, the lock is released.

When a pull request is merged, the GitHub Actions Workflow `deploy` is run.
The workflow checks if the deploy is locked.
If the deploy isn't locked, the workflow gets a lock.
The workflow runs a deploy.
After the deploy, the workflow releases the lock.

## How to set up

- Create a GitHub App
  - Permissions
    - `pull_requests: write`
      - Post comments, Merge pull requests
    - `contents: write`
      - Get, create, and delete branches
      - Merge pull requests
- Set up a GitHub repository Ruleset allowing only the GitHub App to release locks
- Set up a GitHub branch protection allowing only the GitHub App to push commits to the default branch

Please see [terraform](terraform) too.

- Set up GitHub Actions Workflows
  - [merge](.github/workflows/merge.yaml)
    - This workflow is triggered when a comment `/merge` is posted to a pull request
    - Get a lock and merge the pull request
  - [deploy](.github/workflows/deploy.yaml)
    - This workflow is triggered when a pull request is merged to the default branch
    - Ensure a lock, deploy, and release the lock

## GitHub Actions Workflows


## LICENSE

[MIT](LICENSE)
