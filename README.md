# invader-linux
Invader compilation scripts and tricks for other Linux distros

# How to...
Be sure to have [Docker](https://www.docker.com) installed and follow the commands from below:
```sh
git clone https://github.com/Sledmine/invader-docker
cd invader-docker
docker build -t invader-linux ./ubuntu # Or any other distro Dockerfile available to use
```

Note that Arch compilation will allow you to use invader directly from the docker image so just have
to map your folder volumes and run commands on it:
```bash
docker run \
-v /my/host/folder/data:/home/invader/data \
-v my/host/folder/tags:/home/invader/tags \
-v my/host/folder/maps:/home/invader/maps \
invader-linux \
invader-build -g gbx-custom -H "levels/test/bloodgulch/bloodgulch"
```
Ubuntu compilation does not directly allow you to use binaries it is more oriented to create
binaries that can be distributed later, you can substract binaries after building with:
```sh
docker run -v $PWD/build:/build -it invader-linux bash -c "zip /build/invader.zip invader/build/*"
```
This will create a zip file with all the build files in a zip file in the current directory under
a folder called "build" ready to be used.

# Community!

Join the official [Invader Discord](https://discord.gg/RCX3nvw) server!

Take a look to our [Shadowmods Discord](https://discord.shadowmods.net) server, here we showcase and
give support with modding for Halo Custom Edition!

Other Halo related servers:

- [The Halo Archive](https://discord.gg/9MXmuPPbUG)
- [Halo Mods](https://discord.com/invite/WuurKwr)
- [MCC Project HUB](https://discord.com/invite/q4f7nTt)
- [Official Halo Discord Server](https://discord.com/invite/q4f7nTt)
- [Halo: CE Refined](https://discord.gg/QzSR2xNGzp)