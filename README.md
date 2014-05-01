# vim-HTML2Slim

Vim plugin for convert HTML(erb) to Slim. 

![Main](https://raw.githubusercontent.com/davydovanton/vim-html2slim/master/html2slim_main.gif)

##Warning! 
This plugin use [`html2slim`](https://github.com/slim-template/html2slim) gem.

##Installation
First - install `html2slim` gem:
  `gem install html2slim`

Next - [download zip file](#) *(in future)*
and extract in ~/.vim or
[use](https://github.com/tpope/vim-pathogen)
[your](https://github.com/gmarik/vundle)
[favorite](https://github.com/junegunn/vim-plug)
[plugin](https://github.com/Shougo/neobundle.vim)
[manager](https://github.com/MarcWeber/vim-addon-manager).

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/davydovanton/vim-html2slim.git ~/.vim/bundle/vim-html2slim`
- [Vundle](https://github.com/gmarik/vundle)
  1. Add `Bundle 'davydovanton/vim-html2slim'` to .vimrc
  2. Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  1. Add `NeoBundle 'davydovanton/vim-html2slim'` to .vimrc
  2. Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'davydovanton/vim-html2slim'` to .vimrc
  2. Run `:PlugInstall`

##Usage

![Main](https://raw.githubusercontent.com/davydovanton/vim-html2slim/master/html2slim_div.gif)

Select your HTML or Erb code and call `:HTML2slim`

## Contributing

If you'd like to help improve plugin, clone the project with Git by running:

    $ git clone git://github.com/davydovanton/vim-html2slim

Work your magic and then submit a pull request. We love pull requests!

If you find the documentation lacking, help us out and update this README.md. If you don't have the time to work on Slim and use this plugin, but found something we should know about, please submit an issue.

## Self-Promotion

Like vim-html2slim? Follow the me on
[Twitter](http://twitter.com/anton_davydov) and
[GitHub](https://github.com/davydovanton/).

## License

Copyright (c) Anton Davydov.  Distributed under the same terms as Vim itself.

