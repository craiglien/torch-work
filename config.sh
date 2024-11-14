IMAGE_NAME="torch-work"

USER_UID=$(id -u)
USER_GID=$(id -g)
DOCKER_USER=docker_user

PIP_TORCH="torch==2.4.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu"
PIP_HF="accelerate datasets transformers"
PIP_OTHER="pytest"
#PIP_PROJECT=
