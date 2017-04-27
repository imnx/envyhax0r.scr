#!/bin/bash
sudo="/usr/bin/sudo"

cmdline="apt-get install -y sudo nano apt-utils psmisc dnsutils build-essential automake autoconf autotools-dev \
git subversion mercurial cvs *-6-multilib doxygen libtool intltool mc mc-data irssi irssi-scripts dialog pv \
libncurses5-dev libncursesw5-dev zenity software-properties-common aptitude apt apt-get cmake qt5-default \
intel-microcode amd64-microcode perl-base curl perl5 python python-pip python3 python3-pip python-serial \
python3-serial bison flex nasm yasm gawk vlc ffmpeg openssh-server samba cifs-utils"

cmdline2="${sudo} ${cmdline}"

${cmdline2}

if [[ ! ${cmdline2} ]]; then
  exit 1
else
  cd /usr/src
  git clone -b master --depth=1 http://github.com/imnx/envyhax0r.scr envyhax0r-scr/
  cd envyhax0r-scr/fonts/ohsnap-installer
  ./install.sh
  cd ../..
  cd fstab
  ./fstab_inject.sh
  cd ..
  exit 0
fi