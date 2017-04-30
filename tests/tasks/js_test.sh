# tests/task/js_test.sh
b.module.require unittest

# test:
# ➡ code js
function b.test.code_js () {

  local cmd="code js"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/js'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code js --help
function b.test.code_js_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code js --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "js") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
