Base = default Peregrine Node

Added:
Nvidia driver
sh NVIDIA-Linux-x86_64-440.82.run

install gnome desktop
yum groupinstall "gnome-desktop"

Make gui default
systemctl set-default graphical

Disable screen lock global:

# cat /etc/dconf/db/local.d/00-screensaver
[org/gnome/desktop/session]
idle-delay=uint32 0

[org/gnome/desktop/screensaver]
lock-enabled=false
lock-delay=uint32 300

# cat /etc/dconf/db/local.d/locks/screensaver
/org/gnome/desktop/session/idle-delay
/org/gnome/desktop/screensaver/lock-enabled
/org/gnome/desktop/screensaver/lock-delay

Afterwards run the command below to apply the settings:

# dconf update

Note: The file in /etc/dconf/db/local.d/locks/ makes the settings mandatory.


disable nouveau driver (not sure if this is really needed)
run included disable_nouveau.sh

Replace /etc/X11/xorg.conf with included xorg.conf

reboot

install glxinfo
yum install glx-utils

verify opengl

DISPLAY=:0 XAUTHORITY=$(ps aux | grep "X.*\-auth" | grep -v grep | sed -n 's/.*-auth
 \([^ ]\+\).*/\1/p') glxinfo | grep -i "opengl.*version"

Example output:
OpenGL core profile version string: 4.6.0 NVIDIA 440.82
OpenGL core profile shading language version string: 4.60 NVIDIA
OpenGL version string: 4.6.0 NVIDIA 440.82
OpenGL shading language version string: 4.60 NVIDIA
OpenGL ES profile version string: OpenGL ES 3.2 NVIDIA 440.82
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20


isntall nice dcv
https://d1uj6qtbmh3dt5.cloudfront.net/2020.0/Servers/nice-dcv-2020.0-8428-el7.tgz
https://docs.aws.amazon.com/dcv/latest/adminguide/dcv-ag.pdf

yum install nice-dcv-server-2020.0.8428-1.el7.x86_64.rpm
yum install nice-xdcv-2020.0.296-1.el7.x86_64.rpm
yum install nice-dcv-gl-2020.0.759-1.el7.x86_64.rpm
yum install nice-dcv-simple-external-authenticator-2020.0.87-1.el7.x86_64.rpm

copy dcv.conf to /etc/dcv.conf
Enable dcv services

systemctl enable dcvsimpleextauth.service
systemctl enable dcvsessionlauncher.service
systemctl enable dcvserver.service

To verify that the dcv user can access the X server
Run the following command:
$ sudo DISPLAY=:0 XAUTHORITY=$(ps aux | grep "X.*\-auth" | grep -v grep | sed -n 's/.*-auth
 \([^ ]\+\).*/\1/p') xhost | grep "SI:localuser:dcv$"
If the command returns SI:localuser:dcv, the dcv user can access the X server.
If the command does not return SI:localuser:dcv, the dcv user does not have access to the X server.

To verify that local users can access the X server
Run the following command:
$ sudo DISPLAY=:0 XAUTHORITY=$(ps aux | grep "X.*\-auth" | grep -v grep | sed -n 's/.*-auth
 \([^ ]\+\).*/\1/p') xhost | grep "LOCAL:$"
If the command returns LOCAL:, local users can access the X server

Verify That DCV GL Is Properly Installed
The dcvgldiag utility is automatically installed when you install the DCV GL package. You can use this
utility to check that the Linux server configuration meets the DCV GL requirements.
To run the dcvgldiag utility
Use the following command:
$ sudo dcvgldiag

