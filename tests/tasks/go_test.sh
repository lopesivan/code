# tests/task/go_test.sh
b.module.require unittest

# test:
# ➡ code go
function b.test.code_go () {

  local cmd="code go"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/go'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code go --help
function b.test.code_go_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code go --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "go") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
