A IDE for substrate parachain or ink development based on neovim. will add more feature.

the follow step will guide you to setup the basic environment for subNvim.


1. must install command 
	sudo apt install g++ clangd ripgrep xsel lldb build-essential  cmake autoconf clang pkg-config libssl-dev unzip fd-find fzf

2. check list: 
sudo apt  install gcc g++ gdb git binutils patch bzip2 flex bison make autoconf automake autogen gettext texinfo unzip sharutils libncurses5-dev ncurses-term zlib1g-dev gawk libexpat1-dev zlib1g-dev libglib2.0-dev pkg-config libtool python3 perl numactl lrzsz

3. wget https://github.com/vadimcn/vscode-lldb/releases/download/v1.8.1/codelldb-x86_64-linux.vsix

4. unzip codelldb-x86_64-linux.vsix

5. install nvim:
	https://github.com/neovim/neovim/releases/tag/stable
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	sudo apt install ./nvim-linux64.deb

6. cd /usr/bin
sudo ln -s lldb-vscode-14 lldb-vscode

7. curl https://sh.rustup.rs -sSf | sh
rustup default nightly
cargo install cargo-update    (cargo install-update -a)
cargo install du-dust dutree gitui zoxide procs git-delta skim
cargo +nightly install cargo-expand 

8. install nerd font: Hack Font:   or just apt install fonts-hack-ttf
	a. apt install fontconfig ( can use `fc-cache -f -v`)
	   https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#quick-installation

    b. hack font
	    https://www.nerdfonts.com/font-downloads

9. system+register copy.
#mkdir ~/.local/share/bin/  edit myself clipboard-provider
add  export PATH=$PATH:~/.local/share/bin/  to .bashrc

10. tools 
   bash: fish, nushell
   fzf: skim
   terminal mux:  tmux, zellij
   terminal emulator:  putty, kitty, alacritty,wrap 
   tools: starship
