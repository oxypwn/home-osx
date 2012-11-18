#!/usr/bin/ruby
#config

ohmyzsh_location = "/Volumes/16GB1/home/paul_andrew/osx/BOOTSTRAP/dotfiles/oh-my-zsh"
dotfiles_location = "/Volumes/16GB1/home/paul_andrew/osx/BOOTSTRAP/dotfiles"
rbenv_location = "/Volumes/16GB1/home/paul_andrew/osx/BOOTSTRAP/dotfiles/rbenv"
bootstrap_location = "/Volumes/16GB1/home/paul_andrew/osx/BOOTSTRAP"


#hostname
`sudo scutil --set HostName stewie.lan`

#crontab
`crontab #{dotfiles_location}/paul_andrew.crontab`


`mkdir $HOME/bin`


unless rbenv_location == ""
  puts "Linking rbenv..."
  `ln -Fs #{rbenv_location} $HOME/.rbenv`
  `ln -Fs #{dotfiles_location}/zshrc $HOME/.zshrc`
  
end


#oh-my-zsh
unless ohmyzsh_location == ""
   puts "Linking oh-my-zsh..."
   `ln -Fs #{ohmyzsh_location} $HOME/.oh-my-zsh`
end
unless ENV['SHELL'] == "/bin/zsh"
     puts "Changing default shell to zsh..."
     `chsh -s /bin/zsh`
end


#dotfiles
puts "Linking dotfiles"
`bash #{bootstrap_location}/linking.sh`

#execute brew.sh
`sh #{bootstrap_location}/brew.sh`

