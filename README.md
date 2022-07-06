# Pretty quickfix for vim

vim-pqf makes your quickfix and location list windows look nicer, thanks to a
combination of a custom `quickfixtextfunc` function and custom syntax rules for
quickfix/location list buffers.

The goal of this fork is to improve upon [prettier_qf](https://github.com/xuanduc987/prettier_qf) while remaining compatible with vim8 & neovim.

## Features

* Better highlights for line and column numbers
* Highlights for the item type (error, warning, etc)
* Entries are left-aligned so they always start at the same column

## Installation

Install the plugin using your plugin manager of choice

    Plug 'https://github.com/gee19/vim-pqf'

## Configuring signs

Each item in the quickfix list starts with a sign that indicates the type of
item, if this information is available. For example, when displaying diagnostics
an item may start with `E` for an error, and `W` for a warning.

If you want the quickfix window to use its own signs, you can configure them
like so:

```vim
let g:pqf_signs = {
  \ 'E': 'E',
  \ 'W': 'W',
  \ 'H': 'H',
  \ 'I': 'I'
  \ }
```

## Credits
* [yorickpeterse](https://gitlab.com/yorickpeterse)
* [xuanduc987](https://github.com/xuanduc987)

## License

MIT
