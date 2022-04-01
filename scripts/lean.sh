#!/bin/bash

rm -rf ./feeds/packages/utils/runc/Makefile
svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile

# fix netdata
rm -rf ./feeds/packages/admin/netdata
svn co https://github.com/DHDAXCW/packages/branches/ok/admin/netdata ./feeds/packages/admin/netdata

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../../customfeeds/luci/applications/luci-app-kodexplorer
rm -rf openwrt-package/verysync
rm -rf openwrt-package/luci-app-verysync

# Add luci-app-ssr-plus
git clone --depth=1 https://github.com/fw876/helloworld.git

# Add luci-app-unblockneteasemusic
rm -rf ../../customfeeds/luci/applications/luci-app-unblockmusic
git clone --depth=1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-app-netdata
rm -rf ../../feeds/luci/applications/luci-app-netdata
git clone --depth=1 https://github.com/sirpdboy/luci-app-netdata

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add luci-app-bypass
# git clone --depth=1 https://github.com/garypang13/luci-app-bypass.git

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
svn co https://github.com/Lienol/openwrt-package/branches/other/luci-app-adguardhome

# Add ddnsto & linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease
svn co https://github.com/linkease/nas-packages/trunk/network/services/ddnsto
svn co https://github.com/linkease/nas-packages/trunk/network/services/linkease

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash
# git clone https://github.com/DHDAXCW/OpenClash

# Add luci-app-diskman
# git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
# mkdir parted
# cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-ikoolproxy (godproxy)
git clone --depth=1 https://github.com/iwrt/luci-app-ikoolproxy.git

# Add luci-app-serverchan (serverchan)
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add luci-app-pushbot (pushbot)
git clone --depth=1 https://github.com/zzsj0928/luci-app-pushbot

# Add luci-app-dockerman
rm -rf ../../customfeeds/luci/collections/luci-lib-docker
rm -rf ../../customfeeds/luci/applications/luci-app-docker
rm -rf ../../customfeeds/luci/applications/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-app-poweroff
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../../customfeeds/luci/themes/luci-theme-argon
rm -rf ./luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp -f $GITHUB_WORKSPACE/data/bg1.jpg luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-app-smartdns & smartdns
svn co https://github.com/281677160/openwrt-package/trunk/luci-app-smartdns

# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk

# Add luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udp2raw
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udpspeeder

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add luci-aliyundrive-webdav
rm -rf ../../customfeeds/luci/applications/luci-app-aliyundrive-webdav 
rm -rf ../../customfeeds/luci/applications/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav

# Add cpufreq
rm -rf ../../customfeeds/luci/applications/luci-app-cpufreq
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-cpufreq
sed -i 's,1608,1800,g' luci-app-cpufreq/root/etc/uci-defaults/cpufreq
sed -i 's,2016,2208,g' luci-app-cpufreq/root/etc/uci-defaults/cpufreq
sed -i 's,1512,1608,g' luci-app-cpufreq/root/etc/uci-defaults/cpufreq
popd

# 动态DNS
git clone --depth 1 https://github.com/small-5/ddns-scripts-dnspod package/lean/ddns-scripts_dnspod
git clone --depth 1 https://github.com/small-5/ddns-scripts-aliyun package/lean/ddns-scripts_aliyun
svn co https://github.com/QiuSimons/OpenWrt_luci-app/trunk/luci-app-tencentddns package/lean/luci-app-tencentddns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliddns feeds/luci/applications/luci-app-aliddns
ln -sf ./feeds/luci/applications/luci-app-aliddns ./package/feeds/luci/luci-app-aliddns

# Add Pandownload
pushd package/lean
svn co https://github.com/immortalwrt/packages/trunk/net/pandownload-fake-server
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
sed -i '/18.06/d' zzz-default-settings
export orig_version=$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
export date_version=$(date -d "$(rdate -n -4 -p ntp.aliyun.com)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version} (${date_version})/g" zzz-default-settings
popd

# Fix libssh
pushd feeds/packages/libs
rm -rf libssh
svn co https://github.com/openwrt/packages/trunk/libs/libssh
popd

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Add po2lmo
git clone --depth=1 https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/bin\/bash/g' package/base-files/files/etc/passwd

# add default ssh 
mkdir package/base-files/files/etc/dropbear/ -p
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAqbw4e0dvw+EpgRG5ycjHGBR57uPYYtt7mS7YR5Nt0dmgtB/g2YKUBBJ23Qx/MKva8IRg9SE+8kgRC+lVSQ62BPNlB8AxMCa525ezqIJc0+xq/PyQn/Z+Z6bqFiG2pK7JMx8UyN51Dz0CACFjEgnQo4sTWoRtTlYePFVO8hK1q1Znkpdw+NVOqlIqejnIX/rhIr3tCUPbI+xq9CBcoCwNrwyCZSWhN2znvuI/SqeIENdbIDLewKjgahb09ZNOSdo/ZLF0LM0AugkT9XN9LfFlbAOtKfpIwXWHW/aEfiOWt4I7hrvf8a1bUCwQ4dj3RTLOVUzyP0OPO0ZRa9JQvg/Ihw== ^_^' > package/base-files/files/etc/dropbear/authorized_keys
chmod 600 package/base-files/files/etc/dropbear/authorized_keys

# add cpuwd
cat >> package/lean/autocore/files/x86/sbin/cpuwd << kkidsEOF
#!/bin/sh

Anet=5
Aip=192.168.5.254

Bnet=6
Bip=192.168.6.4

ipnetmask=\`ifconfig  | grep "inet addr" | grep 192.168 | awk -F ":" '{print \$2}' | awk -F "." '{print \$3}' | head -n 1\`

if [ \$ipnetmask -eq \${Anet} ]
    then
        pve_host=\${Aip}
    elif [ \$ipnetmask -eq \${Bnet}  ]
        then
            pve_host=\${Bip}
    else
        exit 0
fi
pve_port=22

# TEMP=\`sensors 2>/dev/null | grep 'Core 0' | cut -c15-22\` 
TEMP=\`sensors 2>/dev/null | grep 'Core 0' | cut -c12-  | awk  -F '°' '{print \$1}' \` || TEMP=0
if [ ! -z TEMP ] 
  then
   TEMP=\`ssh -i /root/.ssh/id_rsa root@\${pve_host} -p \${pve_port} sensors 2>/dev/null|grep ..C|sed -nr 's#^.*:.*\+(.*)..C .*#\1#gp'|sort -nr|head -n1\`
fi

printf "%-10s %-10s\n" [PVE虚拟机] \$TEMP

#echo \`(ssh -i /root/.ssh/id_rsa root@\${pve_host} sensors) | grep 'Core' | tr -s ' '| cut -d ' ' -f1,2,3\`
#echo \`(ssh -i /root/.ssh/id_rsa root@\${pve_host} sensors) | grep 'Core' | tr -s ' '| cut -d ' ' -f1,2,3 | sed 's/°C/°C |/g'\`
#echo \`(ssh -i ~/.ssh/id_rsa root@\${pve_host} -p \${pve_port} sensors 2>/dev/null|grep °C|sed -nr 's#^.*:.*\+(.*)°C .*#\1#gp'|sort -nr|head -n1)\`°C
#exit 0
kkidsEOF
chmod +x package/lean/autocore/files/x86/sbin/cpuwd

# modify default index.html
cat >> index.htm.diff << EOF
54a55,61
> 		local cpu_wd = (luci.sys.exec("cpuwd")) .. "°C"
> 			if  cpu_wd == "0°C" or cpu_wd == "°C"   then
> 				cpu_wd= "0°C （无温控或虚拟机）"
> 			end
> 
> 		local ram_size = luci.sys.exec("free -m | grep Mem | awk '{print $2/1024}'")
> 		
61a69,70
> 			cpuwd      = cpu_wd,
> 			ramsize    = ram_size,
678a688,693
>         	        if (e = document.getElementById('cpuwd'))
> 	                        e.innerHTML = info.cpuwd;
> 
> 	               if (e = document.getElementById('ramsize'))
>                                 e.innerHTML =  String.format('%.0f', info.ramsize)+ " <%:MB%>";
> 
729a745,746
> 		<tr><td width="33%"><%:内核温度%></td><td id="cpuwd">-</td></tr>
> 		<tr><td width="33%"><%:RAM Size%></td><td id="ramsize">-</td></tr>
733a751
> 		<tr><td width="33%"><%:Telegram %></td><td><a href="https://t.me/DHDAXCW"><%:电报交流群%></a></td></tr>
EOF
patch /package/lean/autocore/files/x86/index.htm < index.htm.diff

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i '/uci commit system/i\uci set system.@system[0].hostname='FusionWrt'' package/lean/default-settings/files/zzz-default-settings
sed -i "s/OpenWrt /Kkids @ FusionWrt /g" package/lean/default-settings/files/zzz-default-settings

# Test kernel 5.10
# sed -i 's/5.4/5.10/g' target/linux/x86/Makefile

echo -e " Kkids's FusionWrt built on "$(date +%Y.%m.%d)"\n -----------------------------------------------------" >> package/base-files/files/etc/banner
echo 'net.bridge.bridge-nf-call-iptables=0' >> package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-ip6tables=0' >> package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-arptables=0' >> package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-filter-vlan-tagged=0' >> package/base-files/files/etc/sysctl.conf
