#FROM gitpod/workspace-full
FROM eu.gcr.io/gitpod-core-dev/dev/dev-environment
SHELL ["/bin/bash", "-c"]

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
