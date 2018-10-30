#!/bin/bash
#Script to backup a few dirs to /dev/sdb1
tar -cvpzf /mnt/old/backup-home.tar.gz /home/deanpalmer/
tar -cvpzf /mnt/old/backup-root.tar.gz /root/
