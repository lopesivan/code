# tests/task/server_test.sh
b.module.require unittest

# test:
# ➡ code server
function b.test.code_server () {

  local cmd="code server"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/server'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code server --help
function b.test.code_server_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code server --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "server") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
