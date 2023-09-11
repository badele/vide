FROM debian:bookworm-slim

# Install nix
RUN apt-get update -y && apt-get install -y git nix

# Cache some requirements in /nix/store
WORKDIR /tmp
COPY flake.nix flake.nix
COPY flake.lock flake.lock
RUN echo "extra-experimental-features = nix-command flakes" >> /etc/nix/nix.conf
RUN nix develop

# Nvim start at the vide project
WORKDIR /root/.config/nvim
CMD nix develop
