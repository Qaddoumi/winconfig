settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}
// Cheatsheet:
	// Types: file|dir|drive|usb|dvd|fixed|vhd|removable|remote|back|desktop|namespace|computer|recyclebin|taskbar	
		// remove... mod etc
			// multiple 			remove (find="view|sort|paste")
			// all not equal to 	remove(where=this.name!="shit")
			// type is file only	remove (type="file" find="run as admin")
			// modify( find = value [property = value [...] ])
		//
	// Validation Properties - Mode, Type, Where

import 'imports/theme.nss'
import 'imports/images.nss'

import 'imports/modify.nss'

// winget in taskbar
$ico_winget = icon.res(path.combine(sys.bin, 'shell32.dll'), 122)
menu(title="winget" type='Taskbar' where=sys.version.build>=1809 image=ico_winget)
{
	item(title='Download winconfig' image=image.glyph(\uE142) sep='after'
		admin cmd='powershell.exe' args='Invoke-RestMethod https://raw.githubusercontent.com/Qaddoumi/winconfig/main/Download | Invoke-Expression')
	separator()
	item(title='winstall.app' image=image.glyph(\uE11F) cmd='https://winstall.app/')
	item(title='winget.run' image=image.glyph(\uE11F) cmd='https://winget.run/')
}

menu(mode="multiple" title="Pin/Unpin" image=icon.pin)
{
}

menu(mode="multiple" title=title.more_options image=icon.more_options)
{
}
// [Menu] TitleBar Context Menu
item(title='&Fullscreen' keys='F11' where=wnd.is_titlebar type='*' tip='legacy' pos=indexof('close') image=\uE1B1
	cmd=key.send(key.F11))
menu(title=title.windows where=wnd.is_titlebar type='*' pos=indexof('close') sep='both' image=\uE1FB)
{
	item(title=title.cascade_windows cmd=command.cascade_windows)
	item(title=title.Show_windows_stacked cmd=command.Show_windows_stacked)
	item(title=title.Show_windows_side_by_side cmd=command.Show_windows_side_by_side)
	sep
	item(title=title.minimize_all_windows keys='Win+M' cmd=command.minimize_all_windows)
	item(title=title.restore_all_windows keys='Win+Shift+M' cmd=command.restore_all_windows)
}

import 'imports/terminal.nss'
import 'imports/file-manage.nss'
import 'imports/develop.nss'
import 'imports/goto.nss'
import 'imports/taskbar.nss'

item(title='Browser' type='Back' image='%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe' cmd='%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe' args='https://www.duckduckgo.com/')
item(title='Calculator' type='Back' image='%ProgramFiles%\Nilesoft Shell\images\Windows-10-Calculator.png' cmd='calc')
sep
item(title='Open with VS-Code' type='Back' image='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' cmd='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' args='.')
item(title='Open with VS-Code' type='dir' image='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' cmd='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' args='"@sel.path"')
item(title='Open with Visual Studio 2022' type='Back' image='%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe' cmd='%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe' args='.')
item(title='Open with Visual Studio 2022' type='dir' image='%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe' cmd='%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe' args='"@sel.path"')

menu(mode="single" type='file' title='Edit with' pos=1 image=\uE17A sep=bottom){
	item(title='Notepad' image='%ProgramFiles%\Nilesoft Shell\images\notepad.png' cmd='notepad' arg='"@sel.file.name"')
	item(title='VS-Code' image=[\uE272, #22A7F2] cmd='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' arg='"@sel.file.name"')
	item(title='Visual Studio 2022' image='%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe' cmd='%ProgramFiles%\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe' arg='"@sel.file.name"')
}

remove(find="Open Git GUI here|Open Git Bash here|Browse in Adobe Bridge 2024")
remove(find='OneDrive|Sync or Backup')
remove(find='Add to Favorites')
remove(find='Open with Visual Studio')
remove(find='Edit in Notepad')
remove(find='Edit')
remove(find="Always keep on this device|Free up space|Version history")
