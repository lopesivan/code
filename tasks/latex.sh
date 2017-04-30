# tasks/latex.sh
function btask.latex.run() {
    if [ "$1" == '--help' ]; then
        b.get "code.config.help_message_latex"

        return $( b.get "code.config.help_message" )
    fi

  cd ${HOME}/developer/vim/vim
  git checkout feature/latex

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
