#!/usr/bin/env bash

lint_shell() {
  bin/lint_shell -x \
    bin/* \
    lib/*.bash \
    scripts/*.sh
}

lint_markdown() {
  bin/lint_markdown --frail .
}

lint_yaml() {
  bin/lint_yaml .
}

"$@"
