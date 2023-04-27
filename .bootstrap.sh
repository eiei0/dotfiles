#!/bin/bash

##### String Formatters #####

if [[ -t 1 ]]
then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_mkbold() { tty_escape "1;$1"; }
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"
  do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

chomp() {
  printf "%s" "${1/"$'\n'"/}"
}

ohai() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

warn() {
  printf "${tty_red}Warning${tty_reset}: %s\n" "$(chomp "$1")" >&2
}


##### Shared Functions #####

pub_gpg_path="$HOME/public.pgp"

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

install_xcode_cli_tools() {
  if ! command_exists xcode-select; then
    ohai "Installing Xcode command line tools..." 
      xcode-select --install
  else
    ohai "Xcode command line tools already installed"
  fi
}

install_homebrew() {
  if ! command_exists brew; then
    ohai "Installing Homebrew..." 
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if ! command_exists brew; then
      (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  else
    ohai "Homebrew already installed"
  fi
}

generate_ssh_key() {
  if [ ! -f $HOME/.ssh/id_rsa ]; then
    ohai "Generating new SSH key..."

    ohai "Enter Github email: "
    read -p "" email
    ohai "Using email $email"

    ssh-keygen -t rsa -b 4096 -C "$email"
    ssh-add --apple-use-keychain ~/.ssh/id_rsa
  else
    ohai "SSH key already generated"
  fi
}

install_gpg() {
  if ! command_exists gpg; then
    ohai "Installing GPG client..." 
      brew install gnupg
  else
    ohai "GPG client already installed"
  fi
}

generate_gpg_key() {
  if [[ ! $(gpg --list-secret-keys --keyid-format LONG) ]]; then
    algo=rsa4096
    uid='j0nnyappleseed000@mac.com'
    expire=0

    ohai "Generating new GPG key..."

    ohai "Please enter passphrase for new gpg key:"
      read -sp "" passphrase
      gpg --batch --passphrase "$passphrase" --quick-generate-key "$uid" $algo sign $expire 
      gpg --output $pub_gpg_path --armor --export $uid
  else
    ohai "GPG key already generated"
  fi
}

install_github_cli() {
  if ! command_exists gh; then
    ohai "Installing Github CLI..." 
      brew install gh
  else
    ohai "Github CLI already installed"
  fi
}

configure_github_keys() {
  ohai "Logging into Github..."
  gh auth login # has an option to add generated ssh_keys


  if [ -f $pub_gpg_path ]; then
    ohai "Adding GPG key to Github..."
    gh auth refresh -s write:gpg_key
    gh gpg-key add $pub_gpg_path -t 'gpg_key'
    
    rm $pub_gpg_path
  fi
}

install_yadm() {
  if ! command_exists yadm; then
    ohai "Installing YADM..." 
      brew install yadm
  else
    ohai "YADM already installed"
  fi
}

setup_yadm() {
  # make sure dotfiles repo hasn't already been cloned
  if [ ! -d "$HOME/.local/share/yadm/repo.git" ]; then
    ohai "Cloning dotfiles..." 
      yadm clone git@github.com:eiei0/dotfiles.git

    ohai "Running bootstrap script..."
      yadm bootstrap
  else
    ohai "Dotfiles already exist" 
  fi
}

##### Main #####

main() {
  install_xcode_cli_tools
  install_homebrew

  generate_ssh_key
  install_gpg
  generate_gpg_key
  install_github_cli
  configure_github_keys

  install_yadm
  setup_yadm

  ohai "Setup Complete!"
}

main "$@"