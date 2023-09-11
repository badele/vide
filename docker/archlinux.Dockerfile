FROM archlinux/archlinux:base-devel-20230908.0.177571

# Install nix
RUN pacman -Sy --noconfirm && pacman -S --noconfirm git nix

# Cache some requirements in /nix/store
WORKDIR /tmp
COPY flake.nix flake.nix
COPY flake.lock flake.lock
RUN echo "extra-experimental-features = nix-command flakes" >> /etc/nix/nix.conf
RUN nix develop

# Nvim start at the vide project
WORKDIR /root/.config/nvim
CMD nix develop

