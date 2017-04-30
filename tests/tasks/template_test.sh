# tests/task/template_test.sh
b.module.require unittest

# test:
# ➡ code template
function b.test.code_template () {

  local cmd="code template"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/template'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code template --help
function b.test.code_template_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code template --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "template") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
