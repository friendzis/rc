# *****************************************************************************
# Colors
#
# This part is partially taken from Arch Linux communty wiki

NC='\e[0m'		# No Color

# Regular
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
magenta='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'

# Bold
bblack='\e[1;30m'
bred='\e[1;31m'
bgreen='\e[1;32m'
byellow='\e[1;33m'
bblue='\e[1;34m'
bmagenta='\e[1;35m'
bcyan='\e[1;36m'
bwhite='\e[1;37m'

# Underlined
ublack='\e[4;30m'
ured='\e[4;31m'
ugreen='\e[4;32m'
uyellow='\e[4;33m'
ublue='\e[4;34m'
umagenta='\e[4;35m'
ucyan='\e[4;36m'
uwhite='\e[4;37m'

# Backgrounds
bgblack='\e[40m'
bgred='\e[41m'
bggreen='\e[42m'
bgyellow='\e[43m'
bgblue='\e[44m'
bgmagenta='\e[45m'
bgcyan='\e[46m'
bgwhite='\e[47m'

# High intensity regular
BLACK='\e[0;90m'
RED='\e[0;91m'
GREEN='\e[0;92m'
YELLOW='\e[0;93m'
BLUE='\e[0;94m'
MAGENTA='\e[0;95m'
CYAN='\e[0;96m'
WHITE='\e[0;97m'

# High intensity bold
BBLACK='\e[1;90m'
BRED='\e[1;91m'
BGREEN='\e[1;92m'
BYELLOW='\e[1;93m'
BBLUE='\e[1;94m'
BMAGENTA='\e[1;95m'
BCYAN='\e[1;96m'
BWHITE='\e[1;97m'

# High intensity underlined
UBLACK='\e[4;90m'
URED='\e[4;91m'
UGREEN='\e[4;92m'
UYELLOW='\e[4;93m'
UBLUE='\e[4;94m'
UMAGENTA='\e[4;95m'
UCYAN='\e[4;96m'
UWHITE='\e[4;97m'

# High intensity backgrounds
BGBLACK='\e[100m'
BGRED='\e[101m'
BGGREEN='\e[102m'
BGYELLOW='\e[103m'
BGBLUE='\e[104m'
BGMAGENTA='\e[105m'
BGCYAN='\e[106m'
BGWHITE='\e[107m'

# *****************************************************************************
# Formats
#

# The shell prompt
#PS1='\h\e[m:\e[1;36m\W\e[m\$ '
PS1="\[$BRED\]\h\[$white\]:\[$BCYAN\]\W\[$NC\]\$ "
# A bit different for root
#PS1="\[$BRED\]\h\[$white\]:\[$BCYAN\]\W\[$NC\]\[$BGRED\]\[$bblack\]\$\[$NC\] "


# *****************************************************************************
# Aliases
#

export LS_OPTIONS='--color=auto'	# Make ls pretty!
eval "`dircolors`"
alias ls='pwd; ls $LS_OPTIONS'		# Since PS1 only contains short directory always display full path here
alias ll='ls -l'
alias la=';s -lA'
alias grep='grep $LS_OPTIONS'
alias mkdir='mkdir -p'			# silently create parent directories
