# obsidian opener
Simple neovim plugin to open files in obsidian
https://github.com/Love-Pengy/obsidianopener.nvim/assets/132213413/b7773f2c-ca6c-4210-90d3-2b8851e8ae28

In order to have the function properly you have to use the `setup()` function

## Installation 

You can use whatever package manager you like, but personally I use lazy: 

```lua
    'Love-Pengy/obsidianOpener.nvim'  
```

## Setup

Very simple you just need to call the setup function with the name of the vault that you would like to use

```lua 
    require('obsidianOpener').setup("MyObsidianVault") 
```
