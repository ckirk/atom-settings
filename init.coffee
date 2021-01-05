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



# If you worked with React and JSX you probably noticed that you can't use JS comments when inside JSX sections
# Add this to your Atom init script
# Then add 'ctrl-cmd-/': 'comment-jsx' to your keymap.cson
# Then when you are on a JS/JSX file, just press cmd+ctrl+/ to use JSX-style comments that work with JSX elements
# Is not the most efficient way, but it's the cleanest and reliable one

atom.commands.add 'atom-workspace', 'comment-jsx', ->
  atom.config.set('editor.commentStart', '{/*', {scopeSelector: '.source.js.jsx'})
  atom.config.set('editor.commentEnd', '*/}', {scopeSelector: '.source.js.jsx'})
  for selection in atom.workspace.getActiveTextEditor().selections
    selection.toggleLineComments()
  atom.config.unset('editor.commentStart', {scopeSelector: '.source.js.jsx'})
  atom.config.unset('editor.commentEnd', {scopeSelector: '.source.js.jsx'})
