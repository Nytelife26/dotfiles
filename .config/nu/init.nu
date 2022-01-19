alias clock = tty-clock -scD -C 5
alias e = (fzf | xargs -r $nu.env.EDITOR)
alias el = exal
alias exa = exa --group-directories-first
alias exal = exa -lFh --group-directories-first
alias gif = giph -s -l -c 1,1,1,0.3 -b 5 -p -5 (echo "~/recordings/recording-" (date format "%Y-%m-%dT%H:%M:%S") ".gif" | cat)
alias n = nvim
alias nf = neofetch --colors 5 7 7 5 5 7 --underline off --ascii_colors 5 5 5 5 5 5 --w3m --source ~/pictures/lock.png
alias q = exit
alias fm = nnn
alias pri = doas -u root
alias opbr = $nu.env.BROWSER
alias empty = truncate -s 0
alias add = git add -A
alias commit = git commit
alias pull = git pull
alias push = git push
alias pullall = fd . -d 1 -t d -x sh -c # "(cd {} && git pull)";
alias pixelate = catimg -w (tput cols) -t
alias za = zathura

def sendit [msg: string] {
	git add -A
	git commit -m "$msg"
	git push
}

def dirs [
	--search (-s): string
	--from (-f): path
] {
	fd -t d $search $from | lines
}

def fzcd [search: path] {
	cd (dirs -s $search | first)
}

if ($nu.env | select DISPLAY | empty?) && ($nu.env | select XDG_VTNR | empty?) == $false { if $nu.env.XDG_VTNR == "1"  {
	exec startx
} {} } {}

# zoxide init nushell --hook prompt | save ~/.config/nu/zoxide.nu
source ~/.config/nu/zoxide.nu
# starship init nu | save ~/.config/nu/starship.nu
source ~/.config/nu/starship.nu

# local ret_status="%(?:%{$fg_bold[magenta]%}» :%{$fg_bold[red]%}» )"
# PROMPT='%n@[%m] ${ret_status} %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)'
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}git:(%{$fg[cyan]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}±"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
