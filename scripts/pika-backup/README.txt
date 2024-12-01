Indicator Extension
Command: /home/giorgos/dotfiles/scripts/pika-backup/pika-backup-indicator-status.sh
Icon name: backup-symbolic
Disabled icon name: final_activity-symbolic

PikaBackup Hooks
Pre-Backup: OUTCOME="RUNNING" /home/giorgos/dotfiles/scripts/pika-backup/pika-backup-start-script.sh
Post-Backup: /home/giorgos/dotfiles/scripts/pika-backup/pika-backup-start-script.sh
