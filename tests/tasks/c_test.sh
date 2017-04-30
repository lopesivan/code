# tests/task/c_test.sh
b.module.require unittest

# test:
# ➡ code c
function b.test.code_c () {

  local cmd="code c"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/c'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code c --help
function b.test.code_c_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code c --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "c") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
