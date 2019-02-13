#!/usr/bin/env bash

set -e

project_root="$(dirname "$(git rev-parse --git-dir)")"

bash "$project_root"/lib/continuous_integration.bash lint_markdown
