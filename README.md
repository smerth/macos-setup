# Setup New MacOS based computer for development with Node and Python

This readme outlines how I setup a new MacOS for general use and for Node and Python development.  The repo contains some shell scripts to help speed-up the process and some reference material to help clarify the steps.

If you follow these steps **sequentially without jumping around**, and trust we will cover all the major steps, it should be a fairly fast and efficient setup.


## Install Developer Tools

Installing XCode is a painfully long wait and not necessary if all you need are the **developer tools**.  To initiate installation of just the tools without installing XCode just call git

```shell
git
```

Since git is not installed you will be prompted to install developer tools (since git comes with that package.) 


## Download this repo

Download the zip of this repo to your Downloads folder.  Then move it to the root of your `User` folder.

```shell
cd ~/ && mv Downloads/macos-setup-main macos-setup
```


## Install a nice font for coding

I like [Anonymous Pro Font](https://www.marksimonson.com/fonts/view/anonymous-pro) for use in VSCode and Terminal.  But I want the version with lots of icons so I [download the Anonymice Pro Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/AnonymousPro.zip) from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

Double click to open the archive and click on a font variant to open FontBook. Install the font then drag the remaining variants of the font into FontBook to install them.


## Install Homebrew

We will use [Homebrew](https://brew.sh/) to install the majority of our apps

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Run any post install commands in terminal to finish the install


## Install Warp Terminal

```shell
brew install warp
```


## Sign into Warp

- [ ] First login to your Github account in the web browser
- [ ] Login to Warp using your GitHub account (you'll be redirected to GitHub in the Browser)


## Configure Warp

- [ ] Choose prompt
- [ ] Choose theme
- [ ] Choose the font (use the previously installed **Anonymice Pro Mono** font)
- [ ] Set font size to "22"


## Open This readme in Warp

You can open a markdown file in Warp, then you can execute any code blocks in the markdown by clicking on the code block. This will make moving through this readme much faster than cutting and pasting code into terminal.

```shell
cd ~/macos-setup && open README.md -a warp
```


## Install casks (apps) with Homebrew

In Homebrew parlance apps are called casks.  We are going to programatically install a number of casks back to back. To prepare for that first run this command it will download the list of versions for all casks.  we need this because we will install some versions of casks that are off the main release (eg. Firefox Developer Edition)

```bash
brew tap homebrew/cask-versions
```

Open and read the list of casks to be installed.

```shell
cd install-brew-casks && open cask-list.txt -a textedit
```

- [ ] Check `cask-list.txt` to make sure the apps you want to install are all there.  Add or subtract apps as you see fit. Check the `useful-casks.txt` file for more into about various interesting casks.

Run the cask install script

```bash
zsh install-casks.zsh
```

> IMPORTANT!!!
>
> Stick around during this process. You might need to to provide the login password for the computer during one or more of these installations.
> 
> This will take some time...  get yourself a tea...


## Install Oh-My-Zsh

Oh-My-Zsh is the quickest way to get a nice terminal experiance.  Install [Oh My Zsh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Change the theme**

Change theme in the `.zshrc` file.  If you use iTerm2 you can choose freely from any on the available themes.  However, if you use Warp you need to choose a theme with a relatively clean prompt since Warp adds alot of formatting to the prompt and the history blocks of previously executed code.

Try: 
```shell
ZSH_THEME="af-magic"
```
or 
```shell
ZSH_THEME="half-life"
```

### Install Oh-My-Zsh plugins

**zsh-syntax-highlighting**

Setup syntax highlighting for Terminal and iTerm2 if you use them (I can't get it to work with Warp)

Follow [install directions for Oh-My-Zsh]([https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh))

Clone this repository in oh-my-zsh's plugins directory:
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
Activate the plugin in ~/.zshrc:
```shell
plugins=( [plugins...] zsh-syntax-highlighting)
```
Restart zsh (such as by opening a new instance of your terminal emulator).


**zsh-autosuggestions**

Follow the install for [install for Oh-My-Zsh](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)

Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
```shell
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
```

Start a new terminal session.

## Setup Node.js

We are going to install Node using nvm so we easily manage Node versions.  We are going to install nvm as an Oh-My-Zsh plugin

**zsh-nvm**

zsh-nvm will install nvm as an Oh-My-Zsh plugin making it easy to update nvm and not mess up existing node and package installations.  In addition it will configure auto swithing the noe version listed in a `.nvmrc` file if present.

Clone zsh-nvm into your custom plugins repo
```shell
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
```

export settings for zsh-nvm and load the plugin in `.zshrc`
```shell
export NVM_AUTO_USE=true
plugins+=(zsh-nvm)
```

Reload the shell (source `.zshrc`)
```shell
source .zshrc 
```

**Install two versions of node**
Install Node at version 18
```shell
nvm install 18
```
Install Node at version 16
```shell
nvm install 16
```

**Test auto-switching between Node versions**
To make sure all previous changes take effect close out your terminal shell and re-open a fresh one
```shell
mkdir one && cd one && touch .nvmrc && echo "v16" > .nvmrc
```
and 
```shell
mkdir one && cd one && touch .nvmrc && echo "v18" > .nvmrc
```
check auto switching
```shell
node --version && cd one && cd ../two && cd ../one && cd ../
```

**Install Yarn**
```shell
nvm use 18 && npm install -g yarn
```
and 
```shell
nvm use 16 && npm install -g yarn
```

**Configure NPM**

if you cd into an empty folder and run `npm init` or `yarn init` you will initiate a CLI to walk through setting up a project.  However the answers to each prompt will not be autofilled with your standard preferences.

Create an `.npmrc` file

```bash
touch .npmrc
```
and add your preferences and authorization to download from and publish to GitHub package registry.

```bash
init-author-name=Stephen Merth
init-author-email=stephen.merth@gmail.com
init-author-url=https://smerth.github.io/
init-license=MIT
email=stephen.merth@gmail.com
registry=https://registry.npmjs.org
//registry.npmjs.org/:_authToken=[AUTH_TOKEN_FOR_NPM_REGISTRY]
@smerth:registry=https://npm.pkg.github.com/smerth
//npm.pkg.github.com/:_authToken=[PAT_WITH_PERMISSIONS_FOR_GITHUB_PACKAGE_REGISTRY]
//npm.pkg.github.com/smerth/:_authToken=[PAT_WITH_PERMISSIONS_FOR_GITHUB_PACKAGE_REGISTRY]
always-auth=true
scripts-prepend-node-path=true
```


## Configure iTerm2

**Set theme**

- [ ] @ `settings > profiles > general > theme` set to "Dark"

**Install a color palette**

- [ ] go to https://iterm2colorschemes.com/ and choose colours palette
- [ ] create a file on the desktop with ext `.itermcolors`
- [ ] paste choosen color palette into file
- [ ] doouble click file to load colours into presets
- [ ] go to `settings > profiles > colours` and choose the preset

**Choose a font**

- [ ] `settings > profiles > text > font` set to "Anonymous Pro Font" or "AnonymicePro Font" for the Nerd Font version with the icons
- [ ] set font size to "22"

**Load new tabs and windows in previous location**

- [ ] @ `Preferences > Profiles > General > Working Directory` set to "Reuse previous sessions directory"

**Use opt + arrow to move across tokens in a text string**

- [ ] @ `Preferences > Profiles > Keys > Key Mapping > Presets` set to "Natural Text Editing"


## Configure VSCode

- [ ] Turn on settings sync (syncs settings with Github account)
- [ ] Under turn on "linked tag editing" in: settings > linked editing

#### Install extensions

If you synched settings for VSCode from a previous install this won't be necessary.

Current Favorites:

- [ ] Just Black + comments (theme)
- [ ] Font size shortcuts
- [ ] GitHub Copilot (requires subscription)
- [ ] GitLens
- [ ] Jupyter
- [ ] Python
- [ ] Rainbow CSV
- [ ] Prettier
- [ ] Vscode icons
- [ ] live server
- [ ] vsc-nvm

Consider:

- [ ] ES7+ snippets (dsznajder)
- [ ] Vetur (for vue)
- [ ] Indent rainbow
- [ ] Todo highlight
- [ ] Version lens
- [ ] Import cost
- [ ] Debugger for chrome (and also does Firefox)
- [ ] rest client

## Configure Firefox Developer

Set preferences
- [ ] Set as default browser
- [ ] Setup url white list for cookies

Install extensions
- [ ] privacy badger
- [ ] ublock origin

## Configure Typora

You can use `open -a typora xxx.md` to open the markdown file `xxx.md` in Typora from a command line. If Typora is your default editor for `.md` files, when `open xxx.md` would be enough.

You can also add
```
alias tp="open -a typora"
```
in your `.bash_profile` or `.zprofile` other configuration file, then you would be able to simply type `typora xxx.md` instead.

(Requires Typora ≥ 1.1) If you want to use command line to not only open existing files, but also creating new files when target `.md` file does not exists, you could add
```
alias typora="/Applications/Typora.app/Contents/MacOS/Typora"
```
in your `.bash_profile` or other configuration file.

Then if you run `typora xxx.md` and `xxx.md` does not exists, Typora will pop up a dialog to ask you whether to create target file or cancel the operation.

## Configure remaining apps installed with Homebrew

Now is a good time to open each app installed via Homebrew.  Open each app and access preferences with `cmd + ,`  Authorize each app if necessary and set preferences.


## Setup Git and GitHub

We need to get up and running with:
- Git
- GitHub Git Credential Manager
- GitHub CLI
- GitHub Desktop


### Install Git

Git is installed when the developer tools are installed however I prefer to manage installs through Homebrew where possible

```bash
brew install git
```

### Install Git Credential Manager

[Git Credential Manager](https://github.com/GitCredentialManager/git-credential-manager) (GCM) is another way to store your credentials securely and connect to GitHub over HTTPS. With GCM, you don't have to manually [create and store a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token), as GCM manages authentication on your behalf, including 2FA (two-factor authentication).

```shell
brew install --cask git-credential-manager
```

The next time you clone an HTTPS URL that requires authentication, Git will prompt you to log in using a browser window. You may first be asked to authorize an OAuth app. If your account or organization requires [two-factor auth](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa), you'll also need to complete the 2FA challenge.

Once you've authenticated successfully, your credentials are stored in the macOS keychain and will be used every time you clone an HTTPS URL. Git will not require you to type your credentials in the command line again unless you change your credentials.

- [ ] clone a private repo to initiate authentication

For more information or to report issues with GCM, see the official GCM docs at "[Git Credential Manager](https://github.com/GitCredentialManager/git-credential-manager)."


### Configure git

GitHub Credential Manager should configure git however if further config is necessary use the following pattern:

```bash
git config --global user.name "Your Name Here"
```

Global level configuration is user-specific, meaning it is applied to an operating system user. Global configuration values are stored in a file that is located in a user's home directory. `~ /.gitconfig` on unix systems

- [ ] check `.gitconfig` against this reference version

```shell
[filter "lfs"]
	process = git-lfs filter-process
	required = true
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
[user]
	name = Stephen Merth
	email = stephen.merth@gmail.com
	twitter = StephenMerth
[push]
	default = simple
	autoSetupRemote = true
[color]
	ui = auto
[core]
	pager = less -r
	autocrlf = input
	ignorecase = false	
[credential]
	helper = 
	helper = /usr/local/share/gcm-core/git-credential-manager
[init]
	defaultBranch = main
[credential "https://dev.azure.com"]
	useHttpPath = true
```


### Install GitHub CLI

[GitHub CLI](https://cli.github.com/)

[GitHub CLI tutorial](https://www.youtube.com/watch?v=BRAG1Kj4-Ss)

Install GitHub CLI
```bash
brew install gh
```

Authenticate GitHub CLI
```bash
gh auth login
```

- Choose to authenticate with a web browser...
- Choose https...

**Configure GitHub CLI**
Set editor to nano so you don't have to leave the terminal
```bash
gh config set editor "nano --wait"
```

### Install GitHub Desktop

[GitHub Desktop](https://desktop.github.com/)

- [ ] install GitHub Desktop
- [ ] create a new repo so you can set the default location for local repos to `smerth/developer/github`
- [ ] publish the new repo to GitHub


## Install Python

[Python](https://www.python.org/)

### Anaconda

We're going to use Anaconda to setup and manage Python environments.  Anaconda comes with a big array of data science packages, use `miniconda` if all you want are python environments.

Download the [Anaconda Free Distribution](https://www.anaconda.com/download) and use the installer.  Don't use Homebrew to install Anaconda.  The installer offers more control over the placement of files.

Check that `.bash_profile` has been created.  Since we're running zsh, copy the conda init script from `.bash_profile` to `.zprofile`.  You can delete `.bash_profile`

Reopen Warp.  If Everything worked your prompt should begin with `base` which indicated you are currently using the base python installation.


### Set up Python Environments

Now use condo to install python versions in their own environments
```bash
conda create --name py310
```

To activate this environment
```bash
conda activate py310
```

Install a specific python version in this environment
```bash
conda install python=3.10
```

To deactivate an active environment
```bash
conda deactivate
```
To view a list of environments
```shell
conda list
```


### Anaconda Overview
[Learning Anaconda](https://learning.anaconda.cloud/path/intro-to-python)

### Uninstall Anaconda
[Remove environments](https://www.freecodecamp.org/news/how-to-delete-an-environment-in-conda/)
[Uninstall Anaconda](https://docs.anaconda.com/free/anaconda/install/uninstall/)


## iCloud

If you are using a Mac, your most important data (contacts, messages, calendars, music, etc) is synched to iCloud. Get that data onto your new Mac

- [x] log-in to iCloud
- [x] turn on synching for all the data that is relevant to you
- [x] open all apple applications, click through introductory windows, and make sure they are synced with iCloud

## MacOS preferences

Get the Finder, Desktop and behaviour setup the way you like.

- [x] Simplify the dock
- [x] Simplify the menubar by moving widgets into settings and removing separate widgets
- [x] Setup finder windows the way you like
- [x] Turn on stage manager (or toggle under settings when you want it)
- [x] Show widgets on desktop if you want them
- [x] Set widget style monochrome
- [x] Turn on mission control
- [x] Turn on hot corners:
  - [x] TL - mission control
  - [x] TR - application window
  - [x] BL - screen saver
  - [x] BR - desktop

## Install apps from app store.

Download any apps you need from the App Store. Click on your account in the store to see a list of your previous purchases.

- [x] 1Password
  - [x] Open and connect to 1password database
- [x] Authy
  - [x] Open and connect to Authy database
- [x] Numbers
- [x] Affinity Designer
- [x] Magnet
- [x] Transmit
  - [x] Download from Panic (not the app store)


