default base os + slurm + lustre

install nginx & apache
yum install nginx
yum install httpd

systemctl enable httpd.service
systemctl enable nginx


Install enginframe
java -jar enginframe-2019.0.x.y.jar

Not default: spooler = /scratch/spoolers #probably not needed on shared fs, move at next maintence
	     sessions = /scratch/sessions
	     slurm = yes
	     Auth = pam

add mapping to /opt/nice/enginframe/conf/plugins/interactive/url.mapping.conf
# Priority   Server      Target Host          Target Port          Target WebUrlPath
1       pg-lab01        nice.hpc.rug.nl 3128    /dcv_node_1


systemctl enable enginframe
