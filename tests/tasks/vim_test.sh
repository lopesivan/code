# tests/task/vim_test.sh
b.module.require unittest

# test:
# ➡ code vim
function b.test.code_vim () {

  local cmd="code vim"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/vim'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code vim --help
function b.test.code_vim_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code vim --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "vim") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
