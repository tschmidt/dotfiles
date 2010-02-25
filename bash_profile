source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
##
# Your previous /Users/schmidty/.bash_profile file was backed up as /Users/schmidty/.bash_profile.macports-saved_2009-09-21_at_16:02:33
##

# MacPorts Installer addition on 2009-09-21_at_16:02:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=/Users/schmidty/Dropbox/projects/ruby/bin/:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [[ -s /Users/schmidty/.rvm/scripts/rvm ]] ; then source /Users/schmidty/.rvm/scripts/rvm ; fi