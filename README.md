# Setup New Laptop

Setup a new Mac for web development.

> **_N.B. If you install Homebrew then install and configure Warp first, you can open this README in Warp and click on bash blocks within the doc to execute bash scripts in the Warp terminal._**

## Log in to Github on Safari

Later we'll abondon Safari in favor of Firefox but for now log in to GitHub as this will be useful throughout.

## Download the zip of this repo

Move from Downloads to `~/User/`
```shell
mv macos-setup-main ../macos-setup
```

## Install Developer Tools

Since it takes a while start this now...

Installing XCode is a painfully long wait and not necessary if all you need are the developer tools.  To initiate installation of just the tools without installing XCode just type `git + return` into terminal.  Since git is not installed you will be prompted to install developer tools (since git comes with that package.) 

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

## Install fonts

I like [Anonymous Pro Font](https://www.marksimonson.com/fonts/view/anonymous-pro) for VSCode and Terminal.  But I want the version with lots if icons so download from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

Double click to open the archive and click on a font to open FontBook. Install the font then drag the remaining variants of the font to FontBook to install them.

## Install Homebrew

[Homebrew](https://brew.sh/)

- [x] Install homebrew
- [x] Run the terminal commands to finish the install
- [x] View `.zprofile ` to check it was created


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

## Configure apps installed with Homebrew

### Open each app you have installed

Now is a good time to open each app installed via the App store, dragged in from a legacy apps folder or installed by Homebrew.  Open each app and access preferences with `cmd + ,`  Authorize each app if necessary and set preferences.

### Configure Warp (terminal)

- [x] login using GitHub
- [x] Choose prompt
- [x] Choose theme
- [x] Choose the font and size
- [x]     use the previously installed anonymice mono font @ size 22

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

**Install plugins**

<u>zsh-syntax-highlighting</u>

follow the install proceedure for 0h-my-zsh https://github.com/robbyrussell/oh-my-zsh

<u>zsh-autosuggestions</u>

follow the install proceedure for 0h-my-zsh https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

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

### Nvm

Homebrew installation is not supported. If you have issues with homebrew-installed nvm, please brew uninstall it, and install it using the instructions below, before filing an issue.

Note: If you're using zsh you can easily install nvm as a zsh plugin. Install zsh-nvm and run nvm upgrade to upgrade. (Check the long list of options in the project readme.)

We are going to install nvm following the instructions on the [nvm project page on GitHub](https://github.com/nvm-sh/nvm)

- [x] install using the script on the nvm GitHub page


### Install Node Versions

Install Node 16 and 18 to support your legacy GitHub projects

**Install Node v18**
```shell
nvm install 18
```

**Install Node v16**
```shell
nvm install 16
```

**Test manually switching between Node versions**
```shell
nvm use 16 && nvm use 18
```

### Install global packages

Globally installed packages are installed for each environment (eg: 18 and 16) separately. The NPM package is an example.  If you use Node v16 and check NPM it should be an older version than the one used with Node 18.  Either version of NPM might require an update.

**Update NPM**
```shell
npm install -g npm
```

**Install Yarn**
```shell
nvm use 18 && npm install -g npm
```
and 
```shell
nvm use 16 && npm install -g npm
```

### Automatic Node Version Switching with AVN

Following the instructions on the GitHub project page you can add a snippet to `.zshrc` to auto-load the version of node specified in `.nvmrc`

However [Automatic Version Switching for Node.js](https://github.com/wbyoung/avn) seems like a cleaner way to go it switches to the version of Node defined in `.nvmrc` in a new dircetory, upon entering the directory, if `.nvmrc` exists.

**Install**
```shell
npm install -g avn avn-nvm avn-n
```

**Setup**
```shell
avn setup
```




### Configure NPM

- [x] add npmrc

@ home

```bash
touch .npmrc
```

- [x] Add yarnrc?

@ home

```bash
init-author-name=Stephen Merth
init-author-email=stephen.merth@gmail.com
init-author-url=https://smerth.github.io/
init-license=MIT
email=stephen.merth@gmail.com
registry=https://registry.npmjs.org
//registry.npmjs.org/:_authToken=AUTH_TOKEN
@smerth:registry=https://npm.pkg.github.com/smerth
//npm.pkg.github.com/:_authToken=AUTH_TOKEN
//npm.pkg.github.com/smerth/:_authToken=AUTH_TOKEN
always-auth=true
scripts-prepend-node-path=true
```

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
