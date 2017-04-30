# modules/exception.sh
function code.exception.file_not_found () {
  echo "File was not found."
}

function code.exception.string_is_null () {
  echo "String with null size."
}

function code.exception.folder_not_found () {
  echo "File/folder not found."
}

function code.exception.repo_has_changes () {
  echo "my local git repo has changes."
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
