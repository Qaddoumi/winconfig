settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}

import 'imports/theme.nss'
import 'imports/images.nss'

import 'imports/modify.nss'

// winget in taskbar
$ico_winget = icon.res(path.combine(sys.bin, 'shell32.dll'), 122)
menu(title="winget" type='Taskbar' where=sys.version.build>=1809 image=ico_winget)
{
	item(title='Qaddoumi winconfig' image=image.glyph(\uE142) sep='after'
		admin cmd='powershell.exe' args='irm https://raw.githubusercontent.com/Qaddoumi/winconfig/main/Download | iex')
	item(title='VSCode' image=ico_winget
		where=( key.shift() or not(path.exists('@user.localappdata\Programs\Microsoft VS Code')))
		cmd='powershell.exe' args='winget install --id=Microsoft.VisualStudioCode -e')
	item(title='.NET SDK' image=ico_winget
		where=( key.shift() or not(path.exists(path.combine(sys.prog ,'dotnet'))))
		cmd='powershell.exe' args='winget install --id=Microsoft.dotnet -e')
	item(title='.NET SDK Preview' image=ico_winget
		where=( key.shift() or not(path.exists(path.combine(sys.prog ,'dotnet'))))
		cmd='powershell.exe' args='winget install --id=Microsoft.dotnetPreview -e')
	item(title='GIT' image=ico_winget
		where=( key.shift() or not(path.exists(path.combine(sys.prog ,'Git'))))
		cmd='powershell.exe' args='winget install --id=Git.Git -e')
	separator()
	item(title='Everything...' image=ico_winget
		where=( key.shift() or not(path.exists(path.combine(sys.prog ,'Everything'))))
		cmd='powershell.exe' args='winget install --id=voidtools.Everything -e')
	item(title='Notepad++' image=ico_winget
		where=( key.shift() or not(path.exists(path.combine(sys.prog ,'Notepad++'))))	
		cmd='powershell.exe' args='winget install --id=Notepad++.Notepad++ -e')
	item(title='WinRAR' image=ico_winget
		where=(key.shift() or not(path.exists(path.combine(sys.prog, 'WinRar'))))
		cmd='powershell.exe' args='winget install --id=RARLab.WinRAR -e')
	item(title='7-Zip' image=ico_winget
		where=(key.shift() or not(path.exists(path.combine(sys.prog, '7-Zip'))))
		cmd='powershell.exe' args='winget install --id=7zip.7zip -e')
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

item(title='Browser' image='%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe' cmd='%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe' args='https://www.duckduckgo.com/'){}
item(title='Calculator' image='%ProgramFiles%\Nilesoft Shell\images\Windows-10-Calculator.png' cmd='calc'){}
item(title='Open folder with code' image='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' cmd='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' args='.'){}
