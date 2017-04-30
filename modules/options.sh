# modules/options.sh

function code.options.load () {
  b.opt.add_flag --debug "enable debug mode"
  b.opt.add_flag --help "display this help and exit"
  b.opt.add_flag --version "output version information and exit"
}
