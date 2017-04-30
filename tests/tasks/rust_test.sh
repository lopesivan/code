# tests/task/rust_test.sh
b.module.require unittest

# test:
# ➡ code rust
function b.test.code_rust () {

  local cmd="code rust"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/rust'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code rust --help
function b.test.code_rust_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code rust --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "rust") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
