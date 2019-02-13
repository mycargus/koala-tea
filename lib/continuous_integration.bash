#!/usr/bin/env bash

lint_markdown() {
  bin/lint_markdown --frail .
}

"$@"
