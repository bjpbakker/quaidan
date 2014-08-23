#!/bin/bash

apt-add-repository -y ppa:ondrej/apache2
apt-get -y update
apt-get -y install apache2
ls /etc/apache2/mods-available
ln -s /etc/apache2/mods-available/proxy_balancer.conf /etc/apache2/mods-enabled/.
ln -s /etc/apache2/mods-available/proxy_balancer.load /etc/apache2/mods-enabled/.
ln -s /etc/apache2/mods-available/proxy.conf /etc/apache2/mods-enabled/.
ln -s /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/.
ln -s /etc/apache2/mods-available/slotmem_shm.load /etc/apache2/mods-enabled/.
ln -s /etc/apache2/mods-available/lbmethod_byrequests.load /etc/apache2/mods-enabled/.

cat >/etc/apache2/mods-available/proxy_balancer.conf <<EOL
<IfModule mod_proxy_balancer.c>
        <IfModule mod_status.c>
           <Location /balancer-manager>
                   SetHandler balancer-manager
           </Location>
        </IfModule>

        <Proxy balancer://cluster1>
                BalancerMember http://192.168.1.50:80
                BalancerMember http://192.168.1.51:8080
        </Proxy>

        <Proxy balancer://cluster2>
                BalancerMember http://192.168.1.52:80
                BalancerMember http://192.168.1.53:8080
        </Proxy>
</IfModule>
EOL

service apache2 restart
