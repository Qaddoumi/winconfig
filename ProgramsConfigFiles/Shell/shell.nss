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

menu(mode="multiple" title="Pin/Unpin" image=icon.pin)
{
}

menu(mode="multiple" title=title.more_options image=icon.more_options)
{
}

import 'imports/terminal.nss'
import 'imports/file-manage.nss'
import 'imports/develop.nss'
import 'imports/goto.nss'
import 'imports/taskbar.nss'

item(title='Browser' image='%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe' cmd='%LocalAppData%\BraveSoftware\Brave-Browser\Application\brave.exe' args='https://www.duckduckgo.com/'){}
item(title='Calculator' image='%ProgramFiles%\Nilesoft Shell\images\Windows-10-Calculator.png' cmd='calc'){}
item(title='Open folder with code' image='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' cmd='%LocalAppData%\Programs\Microsoft VS Code\Code.exe' args='.'){}
