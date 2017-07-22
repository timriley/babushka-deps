# Tim’s Babushka Deps

[Babushka](http://babushka.me) deps for building my standard computing environment.

## Installation

On a fresh copy of macOS, install Xcode from the Mac App Store, then agree to the Xcode license:

```
sudo xcodebuild -license
```

Make `/usr/local` writeable:

```
sudo chown `whoami`:wheel /usr/local
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
