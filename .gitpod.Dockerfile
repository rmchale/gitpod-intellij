FROM eu.gcr.io/gitpod-core-dev/dev/dev-environment@sha256:4a35541a2ae1792026aac84029b02e19097d88c953a2a04e33a6ca6aa96c51e8
#FROM gitpod/workspace-full
SHELL ["/bin/zsh", "-c"]

RUN sudo apt-get -qq update
# Install required libraries for Projector + PhpStorm
RUN sudo apt-get -qq install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6
# Install Projector
RUN pip3 install projector-installer
# Install IDEA
RUN mkdir -p ~/.projector/configs  # Prevents projector install from asking for the license acceptance
# RUN projector ide install 'IntelliJ IDEA Ultimate 2020.3.2' --no-auto-run
RUN printf "2\nY\n3\n" | projector install --no-auto-run

RUN brew install fd
RUN brew install fzf
RUN brew install ripgrep
