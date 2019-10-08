export TERM="xterm-256color"

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
rsync
git
django
cp
python
colored-man-pages
pip
command-not-found
zsh-users/zsh-syntax-highlighting
sudo
z
supercrabtree/k
virtualenv
laravel
nojhan/liquidprompt
EOBUNDLES

# Load the theme.
#antigen theme https://github.com/carloscuesta/materialshell  /zsh/materialshell-dark
#antigen theme kennethreitz
# wezm

antigen apply

#antigen update

export BROWSER=firefox

# aliases
. ~/.zsh_aliases

# Virtualenv 
export WORKON_HOME=~/.virtualenvs
. /usr/bin/virtualenvwrapper.sh

# Start xsession if TTY1
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

source /usr/share/nvm/init-nvm.sh

export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin
export PATH=~/.config/composer/vendor/bin":$PATH"
export GEM_HOME=$HOME/.gem
# export PATH="/opt/miniconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

