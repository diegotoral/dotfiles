# Diego's dotfiles

## Requirements

Set zsh as your login shell

```sh
$ chsh -s $(chich zsh)
```

## Installation
1. Clone this repository
```sh
$ git clone https://github.com/diegotoral/dotfiles.git ~/.dotfiles
```
2. Install [rcm](https://github.com/thoughtbot/rcm)
```sh
$ brew tap toughtbot/formulae
$ brew install rcm
```
3. Execute the installation
```sh
$ env RCRC=$HOME/.dotfiles/rcrc rcup
```

## Feedback
Suggestions or improvements are welcome. File a [issue](https://github.com/diegotoral/dotfiles/issues)!
