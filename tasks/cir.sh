# tasks/cir.sh
function btask.cir.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_cir"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/cir

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
