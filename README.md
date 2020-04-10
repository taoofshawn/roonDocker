# roonDocker
run a roon core in a docker container

Modified and simplified from [this post](https://community.roonlabs.com/t/docker-images-for-roon/13040/67).


## Note
This is run on a NAS with no local audio device so the alsa driver is not configured.  See the original post for the alsa configuration  

I use raspberry pi's for remote output devices (USB connected to DAC/Preamps)



## Usage
Modify the volume paths in the docker-compose.yml:

```
volumes:
  - /<empty dir for roon data>:/data
  - /<path to music>:/music:ro  # Set to rw to allow roon to delete music
  - /<path to db backup dir>:/backups

```

build and run:
```
docker-compose build
docker-compose up -d
```


## Todo
host on docker hub and update instructions
