7anshuai's dotfiles
========

The reopsitory is heavily borrowed from [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles). Thanks to Mathias and the other contributors.

## Installation

### Using Git and the bootstrap script

Using Git clone the repository wherever you want. (For example `~/Projects/dotfiles`) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/7anshuai/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/7anshuai/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh}
```

To update later on, just run that command again.