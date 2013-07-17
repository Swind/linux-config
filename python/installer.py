import platform
import sys

sys.path.append("./ucltip_src")
import ucltip

system_os = platform.system()
print "OS is " + system_os

#Initialize installer command
if system_os == "FreeBSD":
    installer = ucltip.Cmd('pkg_add')
    installer.conf.dry_run = True
    installer.opts(r=True)
else:
    print "Now the " + system_os + " is not supported"
    


