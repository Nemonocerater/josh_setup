# josh_setup

Dotfiles and scripts for a new Mac.

## Laptop setup

Run these steps from your home directory (`~`) on a fresh machine.

### 1. Bootstrap SSH and clone this repo

Create `~/setup.sh` and paste the script below into it:

```bash
#!/bin/bash
set -euo pipefail

read -p "SSH key name (e.g. github): " KEY_NAME
if [[ -z "$KEY_NAME" ]]; then
  echo "Key name cannot be empty."
  exit 1
fi

KEY_PATH="$HOME/.ssh/$KEY_NAME"
CONFIG="$HOME/.ssh/config"

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [[ -f "$KEY_PATH" ]]; then
  echo "Key already exists: $KEY_PATH"
  read -p "Use existing key? [y/N] " USE_EXISTING
  if [[ ! "$USE_EXISTING" =~ ^[Yy]$ ]]; then
    exit 1
  fi
else
  read -p "Email for key comment (optional): " KEY_EMAIL
  ssh-keygen -t ed25519 -f "$KEY_PATH" -N "" ${KEY_EMAIL:+-C "$KEY_EMAIL"}
fi

if ! grep -q "IdentityFile ~/.ssh/$KEY_NAME" "$CONFIG" 2>/dev/null; then
  cat >> "$CONFIG" <<EOF

Host github.com
  IdentityFile ~/.ssh/$KEY_NAME
EOF
  chmod 600 "$CONFIG"
fi

pbcopy < "$KEY_PATH.pub"
echo "Public key copied to clipboard."
open "https://github.com/settings/keys"
read -p "Add the key on GitHub, then press Enter to continue..."

eval "$(ssh-agent -s)"
ssh-add "$KEY_PATH"

mkdir -p "$HOME/code"
if [[ -d "$HOME/code/josh_setup/.git" ]]; then
  echo "~/code/josh_setup already exists; skipping clone."
else
  git clone git@github.com:Nemonocerater/josh_setup.git "$HOME/code/josh_setup"
fi

echo "Done. Next: cd ~/code/josh_setup && ./mac_init.sh"
```

<details>
<summary>What the script does</summary>

1. Ask for a name for your GitHub SSH key
2. Create `~/.ssh/<name>` and `~/.ssh/<name>.pub` (no passphrase)
3. Add a `github.com` entry to `~/.ssh/config`
4. Copy the public key to your clipboard
5. Open GitHub’s SSH key settings in your browser
6. Wait for you to add the key, then load it into `ssh-agent`
7. Create `~/code` and clone this repo

</details>

Then run:

```sh
chmod +x ~/setup.sh && ~/setup.sh
```

### 2. Install tools and configure dotfiles

```sh
cd ~/code/josh_setup
./mac_init.sh
```

`mac_init.sh` installs Homebrew, oh-my-zsh, iTerm2, Chrome, MacVim, nvm, gh, and related tools. It also calls `mac_config.sh` at the end, so running both is optional but harmless.

Expect interactive prompts during `mac_init.sh` (Homebrew, oh-my-zsh, etc.).

### Prerequisites

If `git` or `ssh-keygen` are missing, install Xcode Command Line Tools first:

```sh
xcode-select --install
```

# TODOs

- [ ] Move everything that installs to use `Brewfile`
  `brew install --cask docker`
