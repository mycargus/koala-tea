#!/usr/bin/env bash

set -e

# shellcheck source=lib/binutil.bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../lib/binutil.bash" &&
ensure_running_from_root

GIT_DIR="$(git rev-parse --git-dir)"
OS_NAME="$(uname | tr '[:upper:]' '[:lower:]')"

function read_link() {
  case "${OS_NAME}" in
    darwin)
      exit_code="$(hash greadlink)"
      if [ "$exit_code" == "0" ]; then
        greadlink -f "$1"
      else
        echo "Install greadlink first. With homebrew you can: 'brew install coreutils'"
      fi
      ;;
    *)
      readlink -f "$1"
      ;;
  esac
}

echo "Installing hooks ..."

path_to="$( dirname "$( dirname "$( read_link "${BASH_SOURCE[0]}" )" )" )"
ln -s "$path_to/pre-commit.sh" "$GIT_DIR/hooks/pre-commit"

echo "Done!"
