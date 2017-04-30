# tests/task/zero_test.sh
b.module.require unittest

# test:
# ➡ code zero
function b.test.code_zero () {

  local cmd="code zero"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/zero'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code zero --help
function b.test.code_zero_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code zero --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "zero") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
