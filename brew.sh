#!/bin/bash

#ensure brew is installed
which -s brew || ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

#check health and update
brew doctor && brew update && brew upgrade

#install taps
if [ -z "brew tap | grep cask" ]; then
	brew tap phinze/homebrew-cask
	brew install brew-cask
fi

#its faster to install binaries than from source
#read brew cask formulas to install
#for i in `cat ./recipes/brew_cask`; do
#	brew cask install "$i"
#done




#read brew formulas to install
#for i in `cat ./recipes/brew`; do
#	brew install "$i"
#done




#read and execute custom formulas
#for FORMULA in ./formulas/* ; do
#	if [ -f $FORMULA -a -x $FORMULA ]; then
#          $FORMULA
#	  fi
#done


#cd `brew --prefix`
#rm -rf Cellar
#brew prune
#rm -rf Library .git .gitignore bin/brew README.md share/man/man1/brew
#rm -rf ~/Library/Caches/Homebrew

#ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"	  
