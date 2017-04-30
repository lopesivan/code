# tests/task/python_test.sh
b.module.require unittest

# test:
# ➡ code python
function b.test.code_python () {

  local cmd="code python"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/python'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code python --help
function b.test.code_python_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code python --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "python") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
