FROM fedora:37

# Install nix
RUN dnf install --assumeyes git xz && curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes

# Cache some requirements in /nix/store
WORKDIR /tmp
COPY flake.nix flake.nix
COPY flake.lock flake.lock
RUN echo "extra-experimental-features = nix-command flakes" >> /etc/nix/nix.conf
RUN source /etc/bashrc && nix develop

# Nvim start at the vide project
WORKDIR /root/.config/nvim
CMD source /etc/bashrc && nix develop

