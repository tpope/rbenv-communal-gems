if [ ! -x "$RBENV_COMMAND_PATH" ]; then
  communal_gem_home="$(rbenv-communal-gem-home "$RBENV_VERSION")"
  if [ -n "$communal_gem_home" -a -x "$communal_gem_home/bin/$RBENV_COMMAND" ]
  then
    RBENV_COMMAND_PATH="$communal_gem_home/bin/$RBENV_COMMAND"
  fi
fi
