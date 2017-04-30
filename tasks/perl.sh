# tasks/perl.sh
function btask.perl.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_perl"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/perl

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
