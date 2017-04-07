if declare -Ff after_install >/dev/null; then
  before_install sequester_gems
  after_install communize_gems
fi

sequester_gems() {
  local gemdir="$PREFIX/lib/ruby/gems"
  if [ -L "$gemdir" ]; then
    rm "$gemdir"
    mkdir "$gemdir"
  fi
}

communize_gems() {
  case $VERSION_NAME in
    [0-9]*)
      rbenv communize "$VERSION_NAME" || true
      ;;
    *)
      echo "Not communizing non-MRI version $VERSION_NAME"
      ;;
  esac
}
