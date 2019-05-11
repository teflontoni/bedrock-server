# MineCraft Bedrock Server

This is a docker container to launch and run the Official [Minecraft Bedrock Edition Server](https://minecraft.net/en-us/download/server/bedrock/) released my Microsoft and Mojang. It's vanilla and contains no add-ons or special server tools.

Getting started (TLDR):

Simply download the file minecraft_launcher.sh, edit the "base_dir" to where you'd like your server info stored, and the run it:

```
sudo ./minecraft_launcher.sh <server name>
```

Then on your server navigate to where ever you pointed the base_dir to and you'll see a folder named after your games and your cofig files in it. You can then do:

```
sudo docker ps
```

to get the container name, which should be your server name and then do:

```
sudo docker stop <container name>
```

Edit your config files and then start the server back up with:

```
sudo docker start <container name>
```

## Upgrading to a newer version:
First stop the container

```
sudo docker stop <container name>
```
Now backup your ```/var/games/<servername>``` folder and its contents on the host machine, because all server/game data is stored in a
bind mount on the host, and will be overwritten by an update of the bedrock dedicated server.

```
sudo mkdir /var/games/mybackup
sudo cp -r /var/games/<servername> /var/games/mybackup
```

You'll need remove your old container image.

```
sudo docker stop <container name>
sudo docker container rm <container name>
sudo docker image rm <image name>
```

now run the launcher script using the same server name as before. When the container starts up, it will already find the existing game folder with world, level, and config files. If your previous server was named "Billy", then y ou would do the follwoing:

```
./minecraft_launcher.sh <servername>
```
