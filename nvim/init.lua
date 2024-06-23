if vim.g.vscode then
  require("config.vscode")
else
  require("config.editor")
  require("config.keybindings")
  require("plugins")
  require("config.colours")
end
