ale-twigcs - twig linter in ALE for Vim
==========================================

This plugin adds support for linting twig through
[ALE](https://github.com/w0rp/ale) using [friendsoftwig/twigcs](https://github.com/friendsoftwig/twigcs).

Installation
------------

- [ALE](https://github.com/w0rp/ale) and
- [twigcs](https://github.com/friendsoftwig/twigcs) must be installed.

### Installation with Pathogen

To install with [Pathogen](https://github.com/tpope/vim-pathogen):

```bash
cd ~/.vim/bundle
git clone https://github.com/dshumaker/ale_twigcs.git
```

### Installation with Vundle

To install using [Vundle](https://github.com/VundleVim/Vundle.vim):

```vim
Plugin 'dshumaker/ale_twigcs'
```

### Installation with Vim-Plug

To install with [Vim-Plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'dshumaker/ale_twigcs'
```

and running `:PlugInstall`.


Configuration
-------------

Set the path of the linter, it depends on where did you installed twigcs.

```vim
let g:ale_twig_twigcs_executable = 'vendor/bin/twigcs'
" Or on windows
let g:ale_twig_twigcs_executable = 'vendor\\bin\\twigcs.bat'
```

