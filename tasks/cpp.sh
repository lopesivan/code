# tasks/cpp.sh
function btask.cpp.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_cpp"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/cpp

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
