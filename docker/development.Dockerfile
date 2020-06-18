FROM node:lts

# Create a non-root user.
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# See https://github.com/moby/moby/issues/5419 to understand why we need to call
# useradd with "-l". Otherwise, docker will create huge files inside the container.
RUN mkdir -p /home/$USERNAME/.vscode-server /home/$USERNAME/.vscode-server-insiders && \
    chown ${USER_UID}:${USER_GID} /home/$USERNAME/.vscode-server*

WORKDIR /code
COPY . /code/
RUN chown -R $USERNAME /code

USER $USERNAME
ENV HOME=/home/$USERNAME
