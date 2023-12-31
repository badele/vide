FROM nixos/nix

WORKDIR /root

COPY flake.nix flake.nix
COPY flake.lock flake.lock

# Cache some requirements in /nix/store
RUN echo "extra-experimental-features = nix-command flakes" >> /etc/nix/nix.conf
RUN nix develop

WORKDIR /root/.config/nvim
CMD nix develop
