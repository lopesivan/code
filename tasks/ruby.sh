# tasks/ruby.sh
function btask.ruby.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_ruby"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/ruby

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
