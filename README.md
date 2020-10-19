# PXE Server

**WORK IN PROGRESS**

PXE Server running in Docker containers

## Supported operating systems

- [x] CentOS (kickstart)
- [ ] Debian (preseed)
- [ ] Windows (Autounattend.xml)

## Usage

Download CentOS DVD image (you can use `curl` instead of `aria2`)

```sh
mkdir images
cd ./images
aria2c -x 16 -s 16 "http://mirrors.nhanhoa.com/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-dvd1.iso"
cd ..
```

Mount the image

```sh
mkdir mnt
sudo mount -t iso9660 images/CentOS-8.2.2004-x86_64-dvd1.iso $PWD/mnt -o loop,ro
```

Copy boot files

```sh
cp ./mnt/images/pxeboot/{initrd.img,vmlinuz} ./tftpboot
cp ./mnt/EFI/BOOT/grubx64.efi ./tftpboot
```

Create kickstart config based on the template

```sh
cp ./kickstart/centos8.cfg.tpl ./kickstart/centos8.cfg
vim ./kickstart/centos8.cfg # Replace {{ VARIABLE }} with your value
# Also replace the server IP
```

Start the server

```sh
docker-compose up --build
```

Then power on your clients.
