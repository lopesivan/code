# tasks/default.sh

function _version (){
    cat <<EOF
$(b.get "code.config.name") (42algoritmos tools) $(b.get "code.config.version")
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by $(b.get "code.config.author").
EOF
}

function btask.default.run() {

    code.options.load

    b.opt.init "$@"

    if b.opt.has_flag? --debug; then

        # --help
        if b.opt.has_flag? --help; then
            echo "help ON"
        else
            echo "help OFF"
        fi

        return 1
    fi

    if b.opt.has_flag? --version; then
        _version
        return 1
    fi

    if b.opt.has_flag? --help; then
        b.opt.show_usage
        return 1
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
