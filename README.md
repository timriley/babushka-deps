# Tim’s Babushka Deps

[Babushka](http://babushka.me) deps for building my standard computing environment.

## Installation

On a fresh copy of macOS, install Xcode from the Mac App Store, then agree to the Xcode license:

```
sudo xcodebuild -license
```

Make some writeable `/usr/local` directories:

```
sudo mkdir /usr/local/{bin,babushka}
sudo chown `whoami` /usr/local/{bin,babushka}
```

Install Babushka:

```
sh -c "`curl https://babushka.me/up`"
```

Copy over my `~/.ssh` keys to grant access to various GitHub repos.

Then download these deps:

```
mkdir -p ~/.babushka
git clone https://github.com/timriley/babushka-deps ~/.babushka/deps
```

Bootstrap the workstation:

```
babushka "laptop bootstrapped"
```

When this completes, close the shell and open a new one, then continue the installation:

```
babushka "laptop"
```

## Manual steps

- [ ] [Copy Keychain](https://support.apple.com/kb/PH20120?locale=en_US)
- [ ] Remap caps lock key to control via Keyboard Preferences
- [ ] Set "Full Keyboard Access: All Controls" via Keyboard Preferences (Shortcuts tab)
- [ ] Disable the guest user
- [ ] [Allow Backblaze to run on Mojave](https://help.backblaze.com/hc/en-us/articles/360009644134-Upgrading-to-Mojave-Read-This-First-)
- [ ] Open LaunchBar and step through the first-run screens
- [ ] Copy `~/Library/Preferences/com.mizage.Divvy.plist`
- [ ] Allow Divvy to control the computer in Security & Privacy Preferences (Privacy tab, Accessibility section)
- [ ] Open 1Password and sign in
- [ ] Open Dropbox and sign in, let it sync
- [ ] Open Ulysses, enable iCloud, let it sync
- [ ] Copy `~/src`
- [ ] Copy `~/.gnupg`
- [ ] Copy fonts
- [ ] Copy aText snippets
- [ ] Copy Hazel rules

