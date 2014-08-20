#!/bin/sh

## ask if user wants to keep their current .files
read -p "Do you want to keep your current .files? (y/n)" -n 1 -r
echo

echo "echo works"
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "It worked"
	./yank_mac_config.sh
fi

## Update the vim files
cp vim/.vimrc ~/.vimrc
cp -r vim/.vimtemplates ~/.vimtemplates

## Update the tmux files
cp tmux/.tmux.conf ~/.tmux.conf

## Add bash scripts to bin
cd scripts
for script in *; do
	sudo cp -f $script /bin/$script
	sudo chmod 755 /bin/$script
done
cd ..
