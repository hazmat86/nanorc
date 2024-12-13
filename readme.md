# Improved Nano Syntax Highlighting Files

This repository holds ``{lang}.nanorc`` files that have improved definitions of syntax highlighting for various languages.

## Installation

There are two ways to install this repo.

### 1. Automatic installer

Copy the following code to download and run the installer script:

```sh
curl https://raw.githubusercontent.com/hazmat86/nanorc/master/install.sh | sh
```

If your machine doesn't have `curl` command, use this code:

```sh
wget https://raw.githubusercontent.com/hazmat86/nanorc/master/install.sh -O- | sh
```

This automatically unpacks all the `.nanorc` files to `~/.nano`.

#### Note

Some syntax definitions which exist in Nano upstream may be preferable to the ones provided by this package.  
The ` install.sh` script may be run with `-l` or `--lite` to insert the included syntax definitions from this package with *lower* precedence than the ones provided by the standard package.


### 2. Clone repo (copy the files)

The files should be placed inside of the `~/.nano/` directory.

You can put the files in another directory inside the correct `.nano` folder.
For example: `~/.nano/nanorc/`.
For readability will use `$install_path` for the path of your choose.

For our install in termux run:

`git clone git@github.com:hazmat86/nanorc.git $install_path`
or  
`git clone https://github.com/hazmat86/nanorc.git $install_path`

## Configuration

After installation, you need to inform `nano` to used the new highlight files. 
The configuration file is located at `~/.nanorc` or `~/.config/nano/nanorc`
If this file doesn't exist, create a new one.

Again there are three ways:

### 1. Include all

Append the content of the folder in one line, with wildcard:

`echo "include $install_path/*.nanorc" >> ~/.nanorc`

### 2. Include/append our `nanorc` file

Simply run:

`cat $install_path/nanorc >> ~/.nanorc`  

### 3. One by one

Add your preferable languages one by one into the file. For example:

```
## C/C++
include "~/.nano/c.nanorc"
```

## Tricks & Tweaks

### Why not include the original files?

Good question! It's due to the way that nano reads the files, the regex instructions should be in a _specific order_ which is evident in some nanorc files.
And if we use the `include` or `extendsyntax` commands, the colors or other things may not work as expected.  
The best way to make changes is by copying and editing the original files.  
Please see this [issue](https://savannah.gnu.org/bugs/index.php?5698).   
But if some original nanorc file needs an update, feel free to [patch it](https://savannah.gnu.org/patch/?func=additem&group=nano)!

### My shortcut is not working!

Please see this [issue](https://savannah.gnu.org/bugs/?56994).

## Acknowledgements

Some of these files are derived from the original [Nano](https://www.nano-editor.org) editor [repo](https://git.savannah.gnu.org/cgit/nano.git)
