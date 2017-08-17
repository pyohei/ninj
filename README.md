# Simple Window control Vim Plugin

## About

Create clone window plugin.  
The word `bunshin` is one of the technique using ninja. --> [Bunshin-no-Jutsu](http://www.ninjaencyclopedia.com/techniques/bunshin.html)



## Usage

After you download this repository like Dein or Pathogen, you can use this command.

```vim
:Bunshin
```

If you want to close this window, you can close the below command.

```vim
:BunshinEnd
```

## Options

The default window column size is 80.  
If you want to change default size, you can set in your `.vimrc` like this.  

```vim
g:BUNSHIN_COLUMN  " Your basic window column size.(default: 80)
g:BUNSHIN_MAX     " Your window max size.(default: 3)
```

## Licence
* MIT
  * see [LICENSE](https://github.com/pyohei/vim-hipchat/blob/master/LICENSE)
