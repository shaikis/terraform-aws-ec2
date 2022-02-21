#cloudConfig
runcmd:
  - LOCAL_IPV4=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
  - echo $LOCAL_IPV4 " " ${instance_hostname} >> /etc/hosts
  - sed -i "s/HOSTNAME=.*/HOSTNAME=${instance_hostname}/" /etc/sysconfig/network
  - /etc/init.d/network restart
  - hostname ${instance_hostname}