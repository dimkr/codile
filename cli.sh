#!/bin/sh -e
systemctl --user start codile.service
systemctl --user enable codile.service
if [ -d /opt/google/cros-containers ]
then
	exec xdg-open http://penguin.linux.test:3000
else
	exec xdg-open http://127.0.0.1:3000
fi