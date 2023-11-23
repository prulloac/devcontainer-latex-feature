#!/bin/sh
set -e


SCHEME=${SCHEME:-"medium"}

apt update
apt install -y wget perl-modules libfontconfig1 fontconfig

cd /tmp # working directory of your choice
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz # or curl instead of wget
zcat < install-tl-unx.tar.gz | tar xf -
cd $(ls -d */ | grep install-tl-)
perl ./install-tl --no-interaction --scheme=$SCHEME
TEXLIVE_DIR=$(ls -d /usr/local/texlive/* | grep 20)
TEXLIVE_EXECUTABLES_DIR="$(ls -d $TEXLIVE_DIR/bin/*)"
echo "PATH=\$PATH:$TEXLIVE_EXECUTABLES_DIR" >> /etc/profile