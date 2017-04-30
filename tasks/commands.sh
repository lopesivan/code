# tasks/commands.sh
function btask.commands.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_commands"

        return $( b.get "code.config.help_message" )
    fi

    find $(dirname $(readlink -f $(which code)))/tasks/ \
        -name \*.sh \
        -printf "%f\n" |

    sed 's/\.sh$//'    |

    xargs -n1          |

    sort
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
