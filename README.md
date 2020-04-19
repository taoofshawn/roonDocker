# roonDocker
run a roon core in a docker container

Modified and simplified from [this post](https://community.roonlabs.com/t/docker-images-for-roon/13040/67).


## Note
This is run on a NAS with no local audio device so the alsa driver is not configured.  See the original post for the alsa configuration  

I use raspberry pi's for remote output devices (USB connected to DAC/Preamps)



## Usage
 - Change the "-v" volume paths to something appropriate for your environment.  
 - The /data and /backups should initially be empty directories so roon can populate them
 - Remove the ":ro" from the end of the music directories if you would like roon to be able to delete music files

```
docker run -d \
    --name=roon \
    -e TZ=America/New_York \
    -v /<path-to-roon-datadir>:/data \
    -v /<path-to-music>:/music:ro \
    -v /<path-to-backup-dir>:/backups \
    taoofshawn/roon
```


Or use docker-compose.yml:
```yaml
version: '3'
services:
  roon:
      image: taoofshawn/roon
      container_name: roon
      restart: unless-stopped
      network_mode: "host"
      environment:
        - TZ=America/New_York
      volumes:
        - /<path-to-roon-datadir>:/data
        - /<path-to-music>:/music:ro
        - /<path-to-backup-dir>:/backups
```