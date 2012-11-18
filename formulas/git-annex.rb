#!/usr/bin/ruby
puts "Installing git-annex..."
`brew update`
`brew install haskell-platform git ossp-uuid md5sha1sum coreutils pcre`
`cabal update`
`cabal install git-annex --bindir=$HOME/bin`