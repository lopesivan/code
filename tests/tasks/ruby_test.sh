# tests/task/ruby_test.sh
b.module.require unittest

# test:
# ➡ code ruby
function b.test.code_ruby () {

  local cmd="code ruby"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/ruby'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code ruby --help
function b.test.code_ruby_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code ruby --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "ruby") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
