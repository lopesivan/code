# tests/task/cir_test.sh
b.module.require unittest

# test:
# ➡ code cir
function b.test.code_cir () {

  local cmd="code cir"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/cir'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code cir --help
function b.test.code_cir_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code cir --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "cir") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
