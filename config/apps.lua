local apps = {}

apps.terminal = 'wezterm'
apps.editor  = os.getenv('EDITOR') or 'nvim'
apps.editor_cmd =  apps.terminal .. " -e " .. apps.editor



require('menubar').utils.terminal = apps.terminal


return apps