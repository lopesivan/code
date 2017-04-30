# modules/repo.sh
function code.repo.load () {

    b.unset 'code.repo'

    _code.repo.load_default_repo

    return $?

}

function _code.repo.load_default_repo () {

    b.set "code.repo.help_message" '2'

    local dir=${HOME}/developer/vim/vim

    if [ -n "$dir" ]; then                      # se variável não nula
        if [ -d "$dir" ]; then                  # é um diretório

            # se o repositorio não foi alterado
            cd $dir
            if ! [[ `git status --porcelain` ]]; then
                #no changes
                return 0
            else
                b.raise RepoHasChangesException
            fi

        else
            b.raise FolderNotFoundException   # se arquivo não encontrado
        fi
    else
        b.raise StringIsNullException         # se a variável é nula
    fi

    return 1
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
