function init_rsa {
	( ssh-add -l | grep -q `ssh-keygen -lf /w/path/to/rsa_key1 | awk '{print $2}'` ) || ( ssh-add /w/path/to/rsa_key1 );
	( ssh-add -l | grep -q `ssh-keygen -lf /w/path/to/rsa_key2 | awk '{print $2}'` ) || ( ssh-add /w/path/to/rsa_key2 ); }

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
	(umask 077; ssh-agent >| "$env")
	. "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
	agent_start
	init_rsa
elif [ "SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
	init_rsa
fi

unset env

# Aliases
alias init_rsa=init_rsa
