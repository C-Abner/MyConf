if [ -z "$1" ]; then
	echo "please input args as yum or apt"
	exit 1
fi
$1 install -y sudo 
sudo $1 update -y 
sudo $1 install -y screen zsh vim git 
sudo cp -r .bashrc ~/ 
sudo cp -r .gitconfig ~/ 
sudo cp -r .gitignore ~/ 
sudo cp -r .oh-my-zsh ~/ 
sudo cp -r .screenrc ~/ 
sudo cp -r .vimrc ~/
sudo cp -r .zshrc ~/
