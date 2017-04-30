# tests/task/java_test.sh
b.module.require unittest

# test:
# ➡ code java
function b.test.code_java () {

  local cmd="code java"

  ${cmd}
  #b.unittest.assert_success $?  # então sucesso

  cd ${HOME}/developer/vim/vim
  git branch | grep '* feature/java'
  b.unittest.assert_success $?  # então sucesso
}

# test:
# ➡ code java --help
function b.test.code_java_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code java --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "java") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}


# vim: set ts=4 sw=4 tw=78 ft=sh:
