apt-get install -y sudo
sudo apt-get update -y
sudo apt-get install -y screen zsh vim git

sudo cp -r .bashrc ~/ 
sudo cp -r .gitconfig ~/ 
sudo cp -r .gitignore ~/
sudo cp -r .oh-my-zsh ~/
sudo cp -r .screenrc ~/
sudo cp -r .vimrc ~/
sudo cp -r .zshrc ~/

#git clone https://github.com/shajiquan/gitit-bigger ~/workspace/gitit;
#cd ~/workspace/gitit;
#cp sample.gitit.conf my-gitit.conf;
#./run/run.sh start;
