# Screw this, I'm only using interactive shells

if [-r ~/.bashrc ]; then
	source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
