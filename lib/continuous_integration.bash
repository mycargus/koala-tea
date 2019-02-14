#!/usr/bin/env bash

lint_bash() {
  bin/lint_bash -x \
    bin/* \
    lib/*.bash \
    scripts/*
}

lint_markdown() {
  bin/lint_markdown --frail .
}

"$@"
