alias ls='ls --color=auto'
alias l='ls -CF --color=auto'
alias lsl='ls -l'
alias ll='ls -l'
alias lsa='ls -A'
alias la='ls -A'
alias lsla='ls -la'

alias grepn='grep -n -A1 -B1 --color=auto'

alias vles='vim -u /usr/share/vim/vim72/macros/less.vim'
alias mkdir='mkdir -p'
alias scrls='screen -ls'
alias scr='screen -r'
alias cls='clear; pwd; ls'

function tryone() { v=($@ -or '.'); echo $v; }
function duh() { du -hs "$@"/*; }
function mkcd() { mkdir -p "$@" && eval cd "\"$@\""; }
function mvcd() { mv "$1" "$2" && cd "$2"; }
function mkcp() { mkdir -p "$1" && eval cp "\"$2\" \"$1\""; }
function mkmv() { mkdir -p "$1" && eval mv "\"$2\" \"$1\""; }
function swap() { eval mv "\"$1\"" "\"$2\".bk" && eval mv "\"$2\"" "\"$1\"" && eval mv "\"$2\".bk" "\"$2\""; }
function greps() { ps aux | grep -v grep | grep $1; }

function stage() { hg push && cap staging update:code; }
function produce() { hg push && cap production update:code; }

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
