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
  rbenv communize "$VERSION_NAME" || true
}
