# tasks/js.sh
function btask.js.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_js"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/js

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
