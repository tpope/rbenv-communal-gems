# Share gems across multiple rbenv Ruby installs

Take a look at this gem path:

    ~/.rbenv/versions/1.9.3-p327/lib/ruby/gems/1.9.1

See that second version in there?  That's the built-in RubyGems method of
isolating gems based on Ruby compatibility.  Since anything linked against
1.9.1 can (in theory) be linked against 1.9.3, the two share a gem home.

You see where I'm going with this.  I posit that per-build gem paths
originated in the same paranoia that gave us gemsets, and now that we have
Bundler, they can be eschewed.  This plugin makes it easy to maintain a
unified gem home.

The `rbenv communize` command blows away (`rm -rf` style) the `lib/ruby/gems`
directory in the given version and replaces it with a symlink to
`~/.rbenv/gems`.  The opposite command is `rbenv sequester`, which removes the
symlink and recreates it as an empty directory.  If you are using
[ruby-build][] as a plugin, new installs will be automatically communized.
(Problem?)

Waste less time.  Waste less space.  And go back to using utility gems (like
[hitch][] and [gem-browse][]) without having to keep 12 copies up to date.

## Installation

    mkdir -p ~/.rbenv/plugins
    git clone git://github.com/tpope/rbenv-communal-gems.git \
      ~/.rbenv/plugins/rbenv-communal-gems
    rbenv communize --all

[ruby-build]: https://github.com/sstephenson/ruby-build
[hitch]: https://github.com/therubymug/hitch
[gem-browse]: https://github.com/tpope/gem-browse
