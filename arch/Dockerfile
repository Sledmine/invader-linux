FROM archlinux:latest
WORKDIR /invader

# Prepare a build specific user, needed for makepkg
RUN useradd --create-home --shell=/bin/false build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install build tools
RUN pacman -Sy && \
    pacman -S sudo git base-devel fakeroot go --noconfirm && \
    git clone http://aur.archlinux.org/yay-git.git && \
    chmod a+rw yay-git

# Install yay
USER build
RUN cd yay-git && \
    makepkg -si --noconfirm

# Install specific libsquish version prior to invader (has some fixes for building bitmaps)    
RUN yay -S libsquish-fixed-tables --noconfirm

# Install invader
RUN yay -S invader-git --noconfirm
