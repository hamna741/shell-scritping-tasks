#!/bin/bash
mkdir /home/hamna/backup
echo "enter name of directory"
read directory
cd /home/hamna
cd ~/$directory
cp * /home/hamna/backup
cd * /home/hamna/backup
tar -czvf backup_compressed.tar.gz /home/hamna/backup


