# tasks/java.sh
function btask.java.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_java"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/java

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
