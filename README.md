# Mathias’s dotfiles

![Screenshot of my shell prompt](https://i.imgur.com/EkEtphC.png)

## Installation

Make sure to grant the terminal "Full Disk Access" to ensure the script works from a different dir than root (otherwise Library will not be permitted to be accessed) 

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Desktop/github/dotfiles/`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/memben/dotfiles.git && cd dotfiles
```

To update, `cd` into your local `dotfiles` repository and then:

```zsh
bash brew.sh
```

```zsh
bash bootstrap.sh
```




### Git-free install

To install these dotfiles without Git (preferred):

```bash
curl -#L https://github.com/memben/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,.osx,LICENSE-MIT.txt}
```

To update later on, just run that command again.

## What to do after running the scripts

Two support multiple external monitors on M1 install:
https://www.synaptics.com/products/displaylink-graphics/downloads/macos

### MacOS Settings
* run ```bash source ~/.appConfig/.config``` to configure programms and keyboard layout as desired
* Add custom keyboard layout in Settings >> Keyboard >> Edit Input >> + >> Scroll down >> others >> EN-DE
* Set firefox as a standard webbrowser
* for ASUS PB287Q set color profile to sRGB (to prevent flickering), make sure 60hz refresh rate is applied
* edit Shortcuts 
    * Shitf/Ctrl/R for Screenshot to Clipboard
    * Ctrl/Space for Spotlight
    * Esc for Caps Lock
    * Command for Globe
* install browser addons for firefox (bitwarden, Addblocker unlimited, Leechblock, Remove Youtube suggestions)


### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/memben/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-L26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```


### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Mathias Bynens"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="mathias@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.

## Feedback

Suggestions/improvements
[welcome](https://github.com/mathiasbynens/dotfiles/issues)!


## Forked from
| [Mathias Bynens](https://mathiasbynens.be/) |

