# Welcome to my dotfiles!

##### Here are some things you may want...

#### Find a file from anywhere:
### FZF - Fuzzy file search - https://github.com/junegunn/fzf

`brew install fzf`
#### To install useful key bindings and fuzzy completion:
`$(brew --prefix)/opt/fzf/install`

###### Add to zshrc:
```
export FZF_COMPLETION_OPTS='+c -x'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
```
#### Find a string inside current dir:
### Ripgrep - Faster than grep
`brew install ripgrep`
- alias case insensitivity
- surrounding lines to display
### If this is a new machine install git anyways to avoid future headaches:
`brew install git`


### Vim tooling

#### Markdown support:
- https://github.com/iamcco/markdown-preview.nvim
-  Use `:MarkdownPreview` to open up vim markdown in Google Chrome after installing (see vimrc).
- To shortcut this command to something like ':md', add the following to your vimrc:
	- `:ca md MarkdownPreview`

##### VimWiki
My vimwiki is not yet hosted but will be soon. I'll have to first add functionality which converts markdown to html in my vimwiki folder
