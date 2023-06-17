#!/bin/bash

### Variables ###

# Architecture and Kernel version
arch=$(uname -a)
# arch=$(uname -rm) # flag -r (Arch), flarg -m (Kernel)

# CPU Physical
pcpu=$(lscpu | grep 'Socket(s):' | awk '{print $2}')

# CPU Virtual
cpuv=$(grep "^processor" /proc/cpuinfo | wc -l)
# cpuv=$(nproc)

# RAM
tram=$(free --mega | awk '$1 == "Mem:" {print $2}')
uram=$(free --mega | awk '$1 == "Mem:" {print $3}')
pram=$(free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}')

# Disk
tdisk=$(df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_t += $2} END {printf"%.0fGb\n", m_t/1024}')
udisk=$(df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_u += $3} END {print m_u}')
pdisk=$(df -m | grep "/dev/" | grep -v "/boot/" | awk '{u += $3} {t += $2} END {printf"(%d%%)\n", u/t*100}')

# CPU Load
cpul=$(top -bn1 | grep "^%Cpu(s):" | awk '{printf("%.1f%%\n", $2 + $4)}')

# Time last Reboot
treboot=$(who -b | awk '$1 == "system" {print $3 " " $4}')
# treboot=$(uptime -s)

# LVM status
slvm=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo "yes"; else echo "no"; fi)

# TCP status (number of actives)
natcp=$(ss -ta | grep "ESTAB" | wc -l)

# Number of users
nuser=$(users | wc -w)

# IP and MAC Address
maca=$(ip link | grep "link/ether" | awk '{print $2}')
ipa=$(hostname -I)

# Command SUDO
ncsudo=$(journalctl _COMM=sudo | grep "COMMAND" | wc -l)

### Script ###

wall "Architecture: $arch
      CPU physical: $pcpu
      vCPU: $cpuv
      Memory Usage: $uram/${tram}MB $pram
      Disk Usage: $udisk/${tdisk} $pdisk
      CPU load: $cpul
      Last boot: $treboot
      LVM use: $slvm
      Connections TCP: $natcp ESTABLISHED
      User log: $nuser
      Network: IP $ipa ($maca)
      Sudo: $ncsudo cmd"
