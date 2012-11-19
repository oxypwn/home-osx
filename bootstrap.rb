#!/usr/bin/ruby

# Setup variables
basedir = "$HOME"
basename = ".source"
boostrtap ="$basedir/$basename"
ohmyzsh = "$bootstrap/oh-my-zsh"
rbenv = "$bootstrap/rbenv"


# Create some default paths
`mkdir $HOME/bin`

# Set hostname
`sudo scutil --set HostName stewie.lan`

#crontab
#`crontab #{dotfiles_location}/paul_andrew.crontab`




unless rbenv == ""
  puts "Linking rbenv..."
  `ln -Fs #{rbenv} $HOME/.rbenv`
end


#oh-my-zsh
unless ohmyzsh_location == ""
	puts "Linking oh-my-zsh..."
	`ln -Fs #{ohmyzsh} $HOME/.oh-my-zsh`
end
unless ENV['SHELL'] == "/bin/zsh"
	puts "Changing default shell to zsh..."
	`chsh -s /bin/zsh`
	`ln -Fs #{dotfiles}/zshrc $HOME/.zshrc`
end


#dotfiles
puts "Linking dotfiles"
`bash #{bootstrap}/linking.sh`

#execute brew.sh
`sh #{bootstrap_location}/brew.sh`

