# tests/task/web_test.sh
b.module.require unittest

# test:
# ➡ code web
function b.test.code_web () {

  local cmd="code web"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/web'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code web --help
function b.test.code_web_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code web --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "web") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
