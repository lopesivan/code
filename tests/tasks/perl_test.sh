# tests/task/perl_test.sh
b.module.require unittest

# test:
# ➡ code perl
function b.test.code_perl () {

  local cmd="code perl"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/perl'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code perl --help
function b.test.code_perl_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code perl --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "perl") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
