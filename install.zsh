#!/bin/zsh
cd $(dirname ${(%):-%N})
BASE=$(pwd)

# initialization for some alias and commands
source ~/.zshrc

# load functions
source functions

# installation steps ; nvm 
if is_existed nvm; then
    echo "nvm already existed, skipping installation.."
else
    echo "Installing nvm ...";
    # version can be changed in future
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.38.0/install.sh | bash &> /dev/null;
    # append nvm directory to .zshrc
    echo "export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "\"\${HOME}/.nvm"\" || printf %s "\"\${XDG_CONFIG_HOME}/nvm\"")"" >> ${HOME}/.zshrc;
    echo "[ -s "\"\$NVM_DIR/nvm.sh\"" ] && \. "\"\$NVM_DIR/nvm.sh\""" >> ${HOME}/.zshrc;
    source ~/.zshrc
    # install node
    if is_existed nvm; then
    	echo "Installing node via nvm ...";
    	nvm install node;
	echo "Node installation done."
    else
	echo "nvm installation failed";
	exit 1;
    fi
fi

# installation steps ; run a script for each OS
# check if it is MacOS
if [ "$(uname -s)" = 'Darwin' ]; then
    echo " === the system is Mac OS ===";
    echo "running install script for Mac OS ..."
    ./install_scripts/install_macos
else
    # if the OS is Linux, check which distro it is
    DISTRO=$(cat /etc/*-release | awk '/^NAME/ {split($0, a, "\""); print(a[2])}')
    echo " === the system is Linux, ${DISTRO} distro ===";
    if [ ${DISTRO} = 'Ubuntu' ]; then
        echo "running install script for ${DISTRO} ..."
	./install_scripts/install_ubuntu
    elif [ ${DISTRO} = 'Arch Linux' ]; then
        echo "running install script for ${DISTRO} ..."
	./install_scripts/install_arch
    fi 
fi

# git user configuration
git config --global user.email "antin.choi@gmail.com"
git config --global user.name "fr0ghunt3r"
git config --global user.signingKey 93BE6E938F5618CA
git config --global commit.gpgsign true

# for gpg tty configuration
gpg_tty="export GPG_TTY=\$(tty)"
check_if_line_exists ${gpg_tty} || add_line_to_file ${gpg_tty} "${HOME}/.zshrc"
