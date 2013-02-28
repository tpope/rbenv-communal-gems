shopt -s nullglob
communal_bin=(${RBENV_ROOT}/gems/*/bin/*)
shopt -s nullglob

cd "$SHIM_PATH"
make_shims ${communal_bin[@]}
cd "$CUR_PATH"
