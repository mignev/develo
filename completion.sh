_develo_completion() {
  local cur files
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  files=$(ls .develo/)
  COMPREPLY=( $(compgen -W "${files}" -- ${cur}) )
}

complete -F _develo_completion develo
