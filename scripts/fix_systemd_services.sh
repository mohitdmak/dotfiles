#!/bin/bash

# stop timer service
systemctl --user stop autoBackup.timer

# start notifs service
systemctl --user start battNotif.serivce

# start mech service
systemctl --user start battMech.service

# start autoBackup service
systemctl --user start autoBackup.service
