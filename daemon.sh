#!/bin/sh -e
cd /usr/share/codile/app
if [ -d /opt/google/cros-containers ]
then
	exec /opt/codile/bin/node src-gen/backend/main.js -h 0.0.0.0 --plugins=local-dir:plugins
else
	exec /opt/codile/bin/node src-gen/backend/main.js  --plugins=local-dir:plugins
fi