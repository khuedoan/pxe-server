# PXE Server

PXE Server running in Docker containers

**WORK IN PROGRESS, DO NOT USE**

## Usage

Download CentOS DVD image (you can use `curl` instead of `aria2`)

```sh
mkdir images
cd ./images
aria2c -x 16 -s 16 "http://mirrors.nhanhoa.com/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-dvd1.iso"
```

Mount the image

```sh
mkdir mnt
sudo mount -t iso9660 images/CentOS-8.2.2004-x86_64-dvd1.iso $PWD/mnt -o loop,ro
```

Get `shim` and `grub`

```sh
mkdir tftp/tftpboot
cp -pr ./mnt/BaseOS/Packages/shim-x64-15-11.el8.x86_64.rpm ./tftp/tftpboot
cp -pr ./mnt/BaseOS/Packages/grub2-efi-x64-2.02-81.el8.x86_64.rpm ./tftp/tftpboot/
```

```sh
docker-compose up --build
docker-compose exec cobbler sync
```
