install_lazygit() {
    if command -v lazygit &>/dev/null; then
        echo "lazygit already installed"
        return 0
    fi

    local arch
    case "$(uname -m)" in
        x86_64)  arch="x86_64" ;;
        aarch64) arch="arm64" ;;
        *)       echo "Unsupported architecture: $(uname -m)"; return 1 ;;
    esac

    # Récupère le tag de la dernière release via l'API GitHub
    local version
    version=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')

    local tmp
    tmp=$(mktemp -d)
    local filename="lazygit_${version}_Linux_${arch}.tar.gz"

    echo "Installing lazygit v${version} (${arch})..."
    curl -fsSL -o "${tmp}/${filename}" \
        "https://github.com/jesseduffield/lazygit/releases/download/v${version}/${filename}"

    tar -xzf "${tmp}/${filename}" -C "${tmp}" lazygit
    install "${tmp}/lazygit" "${HOME}/.local/bin/lazygit"

    rm -rf "${tmp}"
    echo "lazygit v${version} installed to ~/.local/bin/lazygit"
}

install_starship() {
    if command -v starship &>/dev/null; then
        echo "starship already installed"
        return 0
    fi

    curl -fsSL https://starship.rs/install.sh | sh -s -- --bin-dir "${HOME}/.local/bin" --yes
}

install_lazygit
install_starship