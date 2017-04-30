# tests/task/latex_test.sh
b.module.require unittest

# test:
# ➡ code latex
function b.test.code_latex () {

  local cmd="code latex"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/latex'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code latex --help
function b.test.code_latex_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code latex --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "latex") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
