# tests/task/cpp_test.sh
b.module.require unittest

# test:
# ➡ code cpp
function b.test.code_cpp () {

  local cmd="code cpp"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/cpp'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code cpp --help
function b.test.code_cpp_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code cpp --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "cpp") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
