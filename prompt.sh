mkdir -p ~/.local/bin
mkdir -p ~/.config

curl -sS -L https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz | tar xz -C ~/.local/bin
cp ./config/starship.toml ~/.config/

echo 'eval "$(starship init bash)"' >> ~/.bashrc