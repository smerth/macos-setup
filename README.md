# Setup New MacOS based computer for development with Node and Python

This readme outlines how I setup a new MacOS for general use and for Node and Python development.  The repo contains some shell scripts to help speedup the process and some reference material to help clarify the steps.

If you follow these steps **sequentially without jumping around**, and trust we will cover all the major steps, it should be a fairly fast and efficient setup.


## Install Developer Tools

Installing XCode is a painfully long wait and not necessary if all you need are the **developer tools**.  To initiate installation of just the tools without installing XCode just call git

```shell
git
```

Since git is not installed you will be prompted to install developer tools (since git comes with that package.) 


## Download this repo

Download the zip of this repo to your Downloads folder.

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


## Sign into and configure Warp

- [x] login using GitHub
- [x] Choose prompt
- [x] Choose theme
- [x] Choose the font and size
- [x]     use the previously installed anonymice mono font @ size 22







## Install casks (apps) with Homebrew

In Homebrew parlance apps are called casks.  We are going to programatically install a number of casks back to back. To prepare for that first run

```bash
brew tap homebrew/cask-versions
```

Check the `cask-list` in `install-brew-casks` to make sure the apps you want to install are all there.  Decide whether you are using iTerminal or Warp as you terminal replacement. If you are using Warp you don't need oh-my-zsh.  Check the `useful-casks` file for more into about various interesting casks.

Run the install script

```bash
zsh install-casks.zsh
```

> IMPORTANT
> Stick around during this process. You might need to to provide the login password for the computer during one or more installations.
> This will take some time...


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




## Configure apps installed with Homebrew

### Open each app you have installed

Now is a good time to open each app installed via the App store, dragged in from a legacy apps folder or installed by Homebrew.  Open each app and access preferences with `cmd + ,`  Authorize each app if necessary and set preferences.



### Install Oh-My-Zsh

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





### Configure iTerm2

**Set theme**

- [x] @ `settings > profiles > general > theme` set to "Dark"

**Install a color palette**

- [x] Install a color palette
  - [x] go to https://iterm2colorschemes.com/ and choose colours palette
  - [x] create a file on the desktop with ext `.itermcolors`
  - [x] paste choosen color palette into file
  - [x] doouble click file to load colours into presets
  - [x] go to `settings > profiles > colours` and choose the preset

**Choose a font**

- [x] `settings > profiles > text > font` set to "Anonymous Pro Font" or "AnonymicePro Font" for the Nerd Font version with the icons
- [x] set font size to "22"



**Load new tabs and windows in previous location**

- [x] @ `Preferences > Profiles > General > Working Directory` set to "Reuse previous sessions directory"

**Use opt + arrow to move across tokens in a text string**

- [x] @ `Preferences > Profiles > Keys > Key Mapping > Presets` set to "Natural Text Editing"

### Configure VSCode

- [x] Turn on settings sync (syncs settings with Github account)
- [x] Under turn on "linked tag editing" in: settings > linked editing

#### Install extensions

- [x] Just Black + comments (theme)
- [x] Font size shortcuts
- [x] GitHub Copilot (requires subscription)
- [x] GitLens
- [x] Jupyter
- [x] Python
- [x] Rainbow CSV
- [x] Prettier
- [x] Vscode icons
- [x] live server
- [x] vsc-nvm

Consider:

- [ ] ES7+ snippets (dsznajder)
- [ ] Vetur (for vue)
- [ ] Indent rainbow
- [ ] Todo highlight
- [ ] Version lens
- [ ] Import cost
- [ ] Debugger for chrome (and also does Firefox)
- [ ] rest client

### Configure Firefox Developer

- [x] Set as default browser

- [x] Setup url white list for cookies

install extensions

- [x] privacy badger
- [x] ublock origin

### Typora

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



## Install Git, GitHub Git Credential Manager, GitHub CLI and GitHub Desktop


### Install Git

- [x] intall git using Homebrew:

```bash
brew install git
```

### Install Git Credential Manager

[Git Credential Manager](https://github.com/GitCredentialManager/git-credential-manager) (GCM) is another way to store your credentials securely and connect to GitHub over HTTPS. With GCM, you don't have to manually [create and store a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token), as GCM manages authentication on your behalf, including 2FA (two-factor authentication).

- [x] Install GCM using Homebrew:

```shell
brew install --cask git-credential-manager
```

The next time you clone an HTTPS URL that requires authentication, Git will prompt you to log in using a browser window. You may first be asked to authorize an OAuth app. If your account or organization requires [two-factor auth](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa), you'll also need to complete the 2FA challenge.

Once you've authenticated successfully, your credentials are stored in the macOS keychain and will be used every time you clone an HTTPS URL. Git will not require you to type your credentials in the command line again unless you change your credentials.

- [x] clone a private repo to initiate authentication

For more information or to report issues with GCM, see the official GCM docs at "[Git Credential Manager](https://github.com/GitCredentialManager/git-credential-manager)."


### Configure git

GitHub Credential Manager should configure git however if further config is necessary use the following pattern:

```bash
git config --global user.name "Your Name Here"
```
Global level configuration is user-specific, meaning it is applied to an operating system user. Global configuration values are stored in a file that is located in a user's home directory. `~ /.gitconfig` on unix systems

- [x] check `.gitconfig` against reference version


### Install GitHub CLI

[GitHub CLI](https://cli.github.com/)

[GitHub CLI tutorial](https://www.youtube.com/watch?v=BRAG1Kj4-Ss)

- [x] Install GitHub CLI

```bash
brew install gh
```

- [x] Authenticate GitHub CLI

```bash
gh auth login
```

Choose to authenticate with a web browser...

Choose https...

Configure GitHub CLI

- [x] Set editor to nano so you don't have to leave the terminal

```bash
gh config set editor "nano --wait"
```

### Install GitHub Desktop

[GitHub Desktop](https://desktop.github.com/)

- [x] install GitHub Desktop
- [x] create a new repo so you can set the default location for local repos to `smerth/developer/github`
- [x] publish the new repo to GitHub


## NodeJS



### Test the Node setup

Make this section very straight forward by making it into a bash script if necessary and then test using glym

- [ ] create a test folder
- [ ] cd in and run npm/yarn init
- [ ] check `package.json`
- [ ] install a package from you GitHub account
- [ ] install a private package from your GitHub account

### Working with Private Repos and Packages

[This](https://viewsource.io/publishing-and-installing-private-github-packages-using-yarn-and-lerna/) is a nice flow to setting up the laptop to work with private packages.

```bash
npm install -g lerna
```

[Lerna Docs](https://lerna.js.org/docs/getting-started)

[Authenticating to GitHub package registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry)

## Authenticate by logging in

To authenticate by logging in to npm, use the `npm login` command, replacing USERNAME with your GitHub username, TOKEN with your personal access token (classic), and PUBLIC-EMAIL-ADDRESS with your email address.

If you are using npm CLI version 9 or greater and are logging in or out of a private registry using the command line, you should use the `--auth-type=legacy` option to read in your authentication details from prompts instead of using the default login flow through a browser. For more information, see [`npm-login`](https://docs.npmjs.com/cli/v9/commands/npm-login).

If GitHub Packages is not your default package registry for using npm and you want to use the `npm audit` command, we recommend you use the `--scope` flag with the namespace that hosts the package (the personal account or organization to which the package is scoped) when you authenticate to GitHub Packages.

```bash
npm login --registry=https://npm.pkg.github.com --scope=@smerth
```

Will be prompted for:

USERNAME: smerth

PASSWORD: TOKEN

PUBLIC-EMAIL-ADDRESS: stephen.merth@gmail.com

```bash
Username: smerth
Password:
Email: (this IS public) (stephen.merth@gmail.com) stephen.merth@gmail.com
Logged in as smerth to scope @smerth on https://npm.pkg.github.com/.
```

this writes `.npmrc` to the user root directory of the laptop

#### On a per repo basis

You must add a `.npmrc` file to the the root of each repo with the a personal access token with permission to READ/WRITE PACKAGES.

This directs npm to GitHub packages for packages prefixed `@smerth` and grants permision to download and publish.

```bash
//npm.pkg.github.com/:_authToken=TOKEN
@smerth:registry=https://npm.pkg.github.com
```


## Python

https://www.python.org/

### Anaconda

[Anaconda Free Distribution Download](https://www.anaconda.com/download)

- [x] install the free version of anaconda (to manage python installations and environments) using HomeBrew.

> anaconda comes with a big array of data science packages, use miniconda if all you want are python environments.

https://learning.anaconda.cloud/path/intro-to-python

> Check your dotfiles. Anaconda installs a `.bash_profile` with a script to initialize conda. To keep the dotfiles clean and because you are using zsh instead of bash, copy the block to the `.zprofile`. Check the terminal prompt which should show the current python environment (base by default.)

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

### Uninstall Anaconda

[Remove environments](https://www.freecodecamp.org/news/how-to-delete-an-environment-in-conda/)

[Uninstall Anaconda](https://docs.anaconda.com/free/anaconda/install/uninstall/)
