# tests/task/chef_test.sh
b.module.require unittest

# test:
# ➡ code chef
function b.test.code_chef () {

  local cmd="code chef"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/chef'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code chef --help
function b.test.code_chef_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code chef --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "chef") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
