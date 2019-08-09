# SSH KEYCHAIN PRELOAD

## Usage:

1. Clone and copy .bashrc into your home directory. On Linux-based systems, that's `~/`. On Windows systems, that's `C:\Users\<Username>\`.
2. Edit the file to change the `/w/path...` entries at the top to the path(s) to your ssh keys. You can put as many or as few keys as you like here. The script comes with 2 instances outlined.
3. Start a bash shell (might need to re-source the file in Linux). The bashrc should automatically attemtpt to load the ssh keys you defined. If they need passwords, you will be prompted for them before the shell allows you to type other commands.

## Notes:
On windows, the ssh-agent runs as a service, so you only need to re-enter your ssh passwords if you a) kill the service, or b) reboot.
The keys to add to the keychain should have been generated by the ssh-keygen command. Keys generated elsewhere might not work (PuTTY ppk keys for instance). The paths should be to your private keys, not the public counterparts.

