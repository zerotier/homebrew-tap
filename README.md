# ZeroTier Homebrew Tap

## What is Homebrew?

A package manager for macOS (or Linux). See more: https://brew.sh

## What is a Tap?

A third-party repository providing installable packages (formulae) on macOS and Linux.

See more: https://docs.brew.sh/Taps

## How do I install packages?

```sh
brew install zerotier/tap/name
```

You can also only add the tap which makes formulae within it
available in search results (`brew search` output):

```sh
brew tap zerotier/tap
```

While you may search across taps, it is necessary to always use
fully qualified name (incl. the `zerotier/tap/` prefix)
when referring to formulae in external taps such as this one
outside of search.

## What packages are available?

With the following commands, you can install the latest version of each product:

```sh
brew install zerotier/tap/libzt
brew install zerotier/tap/zeronsd
```

## Why should I install packages from this tap?

Because software distributed via this tap is more likely to be up to date
than what is available in `homebrew-core` or `homebrew cask`.
