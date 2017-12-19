``` shell
timedatectl set-ntp true
fdisk /dev/sda
mkswap /dev/sda1 #2097152+2048=2099200
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt

vi /etc/pacman.d/mirrorlist
pacman -Syy

pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

vim /etc/locale.conf # LANG=en_US.UTF-8
vim /etc/locale.gen # en_US.UTF-8 UTf-8,zh_CN.GBK GBK,zh_CN.UTF-8 UTF-8,zh_CN GB2312
locale-gen

vim /etc/hostname
passwd

pacman -S net-tools dnsutils inetutils iproute2

mkinitcpio -p linux

pacman -S grub os-prober

grub-install --target=i386-pc --recheck /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

# boot

sytemctl enable dhcpcd

pacman -S xorg-xclock xterm xorg-xinit xorg-server

#pacman -S xf86-video-ati     AMD

#pacman -S xf86-video-nouveau     N

#pacman -S xf86-video-vesa     other

#pacman -S xf86-video-vmware     vmware

pacman -S gnome gnome-extra

vim .xinitrc # exec gnome-session

# chinese
pacman -S wqy-microhei
fc-cache -fv

# zsh
pacman -S zsh git curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# yaourt
vim /etc/pacman.conf

[archlinux]
Server=https://mirrors.ustc.edu.cn/archlinuxcn/$arch

pacman -Sy
pacman -S yaourt fakeroot archlinuxcn-keyring

```