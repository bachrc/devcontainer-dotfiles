mkdir -p ~/.local/bin

curl -sS -L https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz | tar xz -C ~/.local/bin

echo 'eval "$(starship init bash)"' >> ~/.bashrc