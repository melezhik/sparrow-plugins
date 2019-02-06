docker_name=$(config docker.name)
docker_backuper=$(config docker.backuper)
destination=$(config destination)

backup_name=gogs-backup-$(date +%s).zip
backuper_dir=$(dirname $docker_backuper)

docker exec -t $docker_name bash -c "export USER=git && cd $backuper_dir && ./gogs backup --archive-name $backup_name" || exit 11

echo "Copying archive to $destination..."
docker cp $docker_name:$backuper_dir/$backup_name $destination || exit 12
echo "Done"
