# tests/task/gof_test.sh
b.module.require unittest

# test:
# ➡ code gof
function b.test.code_gof () {

  local cmd="code gof"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/gof'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code gof --help
function b.test.code_gof_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code gof --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "gof") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
