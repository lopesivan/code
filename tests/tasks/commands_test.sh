# tests/task/commands_test.sh
b.module.require unittest

# test:
# ➡ code commands
function b.test.code_commands () {
  local commands=( bash c chef cir commands cpp dark
                   default go gof init java js latex light perl
                   python ruby rust server template usage vim web zero
                 )
  b.unittest.assert_equal \
    "$( echo ${commands[*]}| sort |xargs -n1 )" "$(code commands)"
}

# test:
# ➡ code commands --help
function b.test.code_long_option_help () {
  local jsonfile="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

  test -n "$jsonfile"           # se a variável não é nula
  b.unittest.assert_success $?  # então sucesso

  local cmd="code commands --help"

  local description=$(cat $jsonfile |
    jq --raw-output '.code[] | select(.command == "commands") | .description'
  )

  b.unittest.assert_equal \
    "$description" "$(${cmd})"
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
