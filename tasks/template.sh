# tasks/template.sh
function btask.template.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_template"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/template

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
