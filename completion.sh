_develo_completion() {
  local cur files

  # Get the current word being completed
  if [ -n "$BASH_VERSION" ]; then
    cur="${COMP_WORDS[COMP_CWORD]}"
  elif [ -n "$ZSH_VERSION" ]; then
    cur="${words[CURRENT]}"
  fi

  # Generate the list of files in .develo directory
  files=($(for file in .develo/*; do
    basename "$file"
  done))

  if [ -n "$BASH_VERSION" ]; then
    # Bash-specific completion
    COMPREPLY=( $(compgen -W "${files[*]}" -- "${cur}") )
  elif [ -n "$ZSH_VERSION" ]; then
    # Zsh-specific completion
    compadd "${files[@]}"
  fi
}

# Register the completion function
if [ -n "$BASH_VERSION" ]; then
  complete -F _develo_completion develo
elif [ -n "$ZSH_VERSION" ]; then
  compdef _develo_completion develo
fi
