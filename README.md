# Pretty quickfix windows for vim

vim-pqf makes your quickfix and location list windows look nicer, thanks to a
combination of a custom `quickfixtextfunc` function and custom syntax rules for
quickfix/location list buffers.

## Features

- Better highlights for line and column numbers
- Item types use the same signs as vim's diagnostic signs
- Entries are left-aligned so they always start at the same column

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
* [nvim-pqf](https://gitlab.com/yorickpeterse/nvim-pqf)

## License

MIT
