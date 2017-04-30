# modules/config.sh

function code.config.load () {

    b.unset 'code.config'

    _code.config.load_default_config

    return $?
}

function _code.config.load_from_file () {

    local file="$1"

    local number_of_tasks=$(cat $file | jq '.code[] .start' | wc -l)

    let number_of_tasks--
    for i in $(seq 0 $number_of_tasks); do

        local command=$(cat $file |
            jq --raw-output ".code[$i].command")

        local description=$(cat $file |
            jq --raw-output ".code[$i].description")

        b.set "code.config.help_message_$command" "$description"
    done

    local name=$(cat $file | jq --raw-output ".id.name")

    local version=$(cat $file | jq --raw-output ".id.version")

    b.set "code.config.name" "$name"
    b.set "code.config.version" "$version"
    b.set "code.config.author" "$(git config --get user.name)"
    b.set "code.config.email"  "$(git config --get user.email)"

}

function _code.config.load_default_config () {

    b.set "code.config.help_message" '2'

    local file="$(dirname $(readlink -f $(which code)))/etc/codedoc.json"

    if [ -n "$file" ]; then                     # se variável não nula
        if [ -e "$file" ]; then                 # se arquivo existe
            _code.config.load_from_file "$file" # carrega arquivo

            return $?
        else
            b.raise FileNotFoundException     # se arquivo não encontrado
        fi
    else
        b.raise StringIsNullException         # se a variável é nula
    fi

    return 1
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
