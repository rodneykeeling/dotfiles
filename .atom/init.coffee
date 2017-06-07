# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'atom-text-editor',
  'user:toggle-vim-mode': (event) ->
    if atom.packages.isPackageDisabled("vim-mode")
      atom.packages.enablePackage("vim-mode")
    else
      atom.packages.disablePackage("vim-mode")

atom.workspace.observeTextEditors (editor) ->
    atom.contextMenu.add {
        'atom-text-editor': [
            {label: 'Fold at level 1', command: 'editor:fold-at-indent-level-1'},
            {label: 'Fold at level 2', command: 'editor:fold-at-indent-level-2'},
            {label: 'Unfold All', command: 'editor:unfold-all'},
            {label: 'Toggle Vim Mode', command: 'user:toggle-vim-mode'},
        ]
    }
