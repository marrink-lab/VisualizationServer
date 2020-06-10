get rlm package from: https://reprisesoftware.com/admin/software-licensing-download,v11.3.php
groupadd -r rlm
useradd -r -g rlm -d "/opt/nice/rlm" -s /sbin/nologin -c "RLM License Server" rlm
mkdir -p /opt/nice/rlm/license
tar xvf x64_l1.admin.tar.gz -C /opt/nice/rlm/ --strip-components 1
chown -R rlm:rlm /opt/nice/rlm
add the license to /opt/nice/rlm/license/

copy dcv-rlm to /etc/init.d
chmod +x /etc/init.d/dcv-rlm
chkconfig --add dcv-rlm
service dcv-rlm start

