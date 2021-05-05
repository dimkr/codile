#!/bin/sh -xe

d=`pwd`/out-$CODILE_ARCH
mkdir -p $d
cp -r cli.sh daemon.sh extra $d
install -D -m 644 /codile.png $d/extra/usr/share/pixmaps/codile.png

builtins=
for i in cpp css docker go html java javascript json make markdown python rust shellscript typescript xml yaml git
do
    builtins="\"vscode-builtin-$i\": `curl -s https://open-vsx.org/api/vscode/$i | jq  .files.download`,$builtins"
done

jq "setpath([\"node_deb\",\"architecture\"]; \"$CODILE_ARCH\") | setpath([\"theiaPlugins\"]; {$builtins})" package.json > $d/package.json

cd /node
./configure --ninja --prefix=/opt/codile --cross-compiling --without-npm --without-inspector --without-intl
make
make DESTDIR=$d/extra install
rm -rf $d/extra/opt/codile/include $d/extra/opt/codile/share/{doc,man}

find $d -type f | while read x
do
    $STRIP -s $x > /dev/null 2>&1 || :
done

cd $d

yarn --pure-lockfile 
NODE_OPTIONS="--max_old_space_size=4096" yarn theia build 
yarn theia download:plugins 
yarn --production 
yarn autoclean --init 
echo *.ts >> .yarnclean 
echo *.ts.map >> .yarnclean 
echo *.spec.* >> .yarnclean 
yarn autoclean --force 
yarn cache clean

npm run build-deb