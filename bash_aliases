# Shell
alias ls='ls --color=auto --group-directories-first'
alias sl='ls'
alias l='ls -CF'
alias lsl='ls -l'
alias ll='ls -l'
alias lsa='ls -A'
alias la='ls -A'
alias lsla='ls -la'

alias ..='cd ..'

alias mkdir='mkdir -p'
alias md='mkdir'

alias cls='clear; pwd; ls'

alias ff='find . -maxdepth 1 -type f' # all files in cwd
alias fd='find . -maxdepth 1 -type d | grep -v "^\.$"' # all dirs in cwd excluding '.'
#alias nd='find . -maxdepth 1 -type d | wc -l | awk "{print $1 - 1}" }' # count dirs in current dir excluding '.'
alias nd='find . -maxdepth 1 -type d | grep -v "\.$" | wc -l'
alias nf='find . -maxdepth 1 -type f | wc -l' # cound files in current dir

# Grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias grepn='grep -n -A1 -B1 --color=auto'
alias greps='ps ax | grep -v grep | grep'

# Vim
alias vles='vim -u /usr/share/vim/vim72/macros/less.vim'

# Git
alias G='git'

# Screen
alias scrls='screen -ls'
alias scr='screen -r'

# Tmux
alias tn='tmux new -s'
alias ta='tmux attach -dt'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# admin
alias S='sudo'
alias follow='tail -fn50'
alias guard='guard -cdl 2.0'

function tryone() { v=($@ -or '.'); echo $v; }
function duh() { du -hs "$@"/*; }
function mkcd() { mkdir -p "$@" && eval cd "\"$@\""; }
function mvcd() { mv "$1" "$2" && cd "$2"; }
function mkcp() { mkdir -p "$1" && eval cp "\"$2\" \"$1\""; }
function mkmv() { mkdir -p "$1" && eval mv "\"$2\" \"$1\""; }
function swap() { eval mv "\"$1\"" "\"$2\".bk" && eval mv "\"$2\"" "\"$1\"" && eval mv "\"$2\".bk" "\"$2\""; }


function tssh() { 
	REMOTE=$1; shift;
	tar -cf - $@ | pv -s $(du -sb $@ | awk '{sum+=$1} END {print sum}') | ssh $REMOTE "cat - > test.tgz";
}

function x() {
	case $@ in
		*.tar.bz2)	tar -xjf "$@"	;;
		*.tar.gz)	tar -xzf "$@"	;;
		*.tgz)		tar -xzf "$@"	;;
		*.tar)		tar -xf "$@"	;;
		*.rar)		unrar x "$@"	;;
		*.zip)		unzip "$@"		;;
		*.gz)		gunzip "$@"		;;
		*.gzip)		gunzip "$@"		;;
		*.bz2)		bunzip2 "$@"	;;
		*)			echo "'$@' cannot be extracted with x()" ;;
	esac
}

function trash( ) {
	TRASHPATH=~/.local/share/Trash

	if [ -z "$*" ]; then
		echo "Usage: trash FILENAME1 [FILENAME2] ..."
		echo ""
	fi

	for arg in "$@"
		do
			base_name=$(basename ${arg})
			file_name=$(basename ${arg})
			full_name=$(readlink -f ${arg})
			date_deleted=$(date "+%FT%T")

			i=0
			while [ -f $TRASHPATH/files/${base_name} ]
				do
					base_name=${file_name}${i}
					(( i += 1 ))
				done

			mv ${arg} $TRASHPATH/files/${base_name}

			cat > $TRASHPATH/info/${base_name}.trashinfo <<EOF
[Trash Info]
Path=${full_path}
DateDeleted=${date_deleted}
EOF
		done
}

function fif( ) {
	egrep -Rni "$@" .
}

function srange( ) {
	# Usage: srange <file> <line-from> <line-to>
	sed "$2,$3p;d" $1
}

function mod_rename( ) {
	if [ -z $1 ]; then
		echo "Usage: rename NEW_FILENAME"
		echo ""
		exit 1
	fi
	for f in `ls .`; do
		mv $f $1.${f##*.}
	done
}

function sqldump( ) {
	if [ -z "$*" ]; then
		echo "Usage: sqldump database [host] [user]"
		echo "  Supplying a username implies -p"
		echo ""
		exit 1
	fi

	DB="$1"
	shift

	OPTS=""
	if [ -n "$1" ]; then
		OPTS="-h$1 "
		shift
	fi
	if [ -n "$1" ]; then
		OPTS="$OPTS -u$1 -p"
	fi

	OPTS="$OPTS $DB"

	FILENAME="$DB.`/bin/date +%Y%m%dT%H%M%S`.sql"

	mysqldump $OPTS > $FILENAME

	echo "Dumped $DB to $FILENAME"
}

alias sql-dump=sqldump
