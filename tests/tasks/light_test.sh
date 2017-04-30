# tests/task/light_test.sh
b.module.require unittest

# test:
# ➡ code light
function b.test.code_light () {

  local cmd="code light"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/light'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code light --help
function b.test.code_light_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code light --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "light") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
