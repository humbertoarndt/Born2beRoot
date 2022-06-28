#bin/bash

ARCH=$(uname -a)
PCPU=$(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
VCPU=$(grep 'processor' /proc/cpuinfo | uniq | wc -l)
FULLRAM=$(free -m | grep 'Mem.:' | awk '{print $2}')
USEDRAM=$(free -m | grep 'Mem.:' | awk '{print $3}')
PCTRAM=$(free -m | grep 'Mem.:' | awk 'printf ("%.2f"), $3/$2*100}')
FULLDISK=$(df -Bg | grep /dev/ | grep -v /boot | awk '{fd += $2} END {print fd}')
USEDDISK=$(df -Bm | grep /dev/ | grep -v /boot | awk '{ud += $3} END {print ud}')
PCTDISK=$(df -Bm | grep /dev/ | grep -v /boot | awk '{ud += $3} {fd += $2} END {printf("%d"), ud/fd*100}')
CPU=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')
LASTBOOT=$(who -b | awk '{print $4 " " $5}')
LVM=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
TCP=$(cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}')
TCPMSSG=$(if [ ${TCP} -eq 0 ]; then echo NOT ESTABLISHED; else echo ESTABLISHED; fi)
USERLOG=$(users | wc -1)
IP=$(hostname -I | awk '{print $1'})
MAC=$(ip link show | awk '$1 == "link/ether" {print $2}')
SUDO=$(grep -c 'COMMAND' /var/log/sudo/sudo.log)

wall "
    #Architecture: ${ARCH}
    #CPU physical: ${PCPU}
    #vCPU: ${VCPU}
    #Memory Usage: ${USEDRAM}/ ${FULLRAM}MB (${PCTRAM}%)
    #Disk Usage: ${USEDDISK}/${FULLDISK}MB (${PCTDISK}%)
    #CPU load: ${CPU}
    #Last boot: ${LASTBOOT}
    #LVM use: ${LVM}
    #Connection TCP: ${TCP} ${TCPMSSG}
    #User log: ${USERLOG}
    #Network: ${IP} (${MAC})
    #Sudo: ${SUDO} cmd
"