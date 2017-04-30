# tests/task/dark_test.sh
b.module.require unittest

# test:
# ➡ code dark
function b.test.code_dark () {

  local cmd="code dark"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/dark'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code dark --help
function b.test.code_dark_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code dark --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "dark") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
