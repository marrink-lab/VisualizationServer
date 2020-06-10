grubby --update-kernel=ALL --args="rd.driver.blacklist=nouveau nouveau.modeset=0"
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r).img.bak
echo "blacklist nouveau" > /etc/modprobe.d/nouveau-blacklist.conf
dracut /boot/initramfs-$(uname -r).img $(uname -r)
echo "reboot now"

