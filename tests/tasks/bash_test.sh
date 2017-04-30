# tests/task/bash_test.sh
b.module.require unittest

# test:
# ➡ code bash
function b.test.code_bash () {

  local cmd="code bash"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/sh'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code bash --help
function b.test.code_bash_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code bash --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "bash") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
