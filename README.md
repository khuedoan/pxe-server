# PXE Server

Deprecated in favor of [PXE server Ansible role](https://github.com/khuedoan/homelab/tree/master/metal/roles/pxe-server)

**WORK IN PROGRESS**

PXE Server running in Docker containers

## Supported operating systems

- [x] CentOS (kickstart)
- [ ] Debian (preseed)
- [ ] Windows (Autounattend.xml)

## Usage

Download CentOS DVD image (you can use `curl` instead of `aria2`)

```sh
aria2c -d ./images -x 16 -s 16 "http://mirrors.nhanhoa.com/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-dvd1.iso"
```

Mount the image

```sh
sudo mount -t iso9660 images/CentOS-8.2.2004-x86_64-dvd1.iso $PWD/mnt -o loop,ro
```

Create kickstart config based on the template

```sh
cp ./kickstart/centos8.ks.tpl ./kickstart/centos8.ks
vim ./kickstart/centos8.ks # Replace {{ VARIABLE }} with your value
# Also replace the server IP
```

Start the server

```sh
docker-compose up --build
```

Then power on your clients.
