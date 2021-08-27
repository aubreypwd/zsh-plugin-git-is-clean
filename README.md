# `git-is-clean`

This function will return `true` or `false` depending on if it finds out your repo
is dirty or not.

## Usage

```bash
git-is-clean "path/to/repo" || echo "path/to/repo is dirty!"
```

In this example, if `path/to/repo` is dirty it will `echo` _path/to/repo is dirty!_

## Install

Using [antigen](https://github.com/zsh-users/antigen):

```bash
antigen bundle aubreypwd/zsh-plugin-git-is-clean@1.0.0
```

## Development

Install the package on `master`:

```bash
antigen bundle ssh://git@github.com/aubreypwd/zsh-plugin-git-is-clean
```

...and contribute upstream by working in `$HOME/.antigen/bundles/aubreypwd/zsh-plugin-git-is-clean`.

---

## Changelog

## 1.0.0

- First version of what I've used for years.
