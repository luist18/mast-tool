FROM ubuntu:20.10

LABEL maintainer="luistavares10@outlook.pt"
LABEL description="Ubuntu 20.10 image ready to execute automatic AOCO sub-routine code correction tool"
LABEL version="1.0"

SHELL ["/bin/bash", "-c"]

WORKDIR /usr/tool

# Dependencies directory (system wide and Python py_requirements.txt)
COPY requirements /requirements

# Tool source code
COPY src /src

# Ensure packages are up to date
RUN apt-get update

# Install
RUN sh /requirements/system_requirements.sh
RUN pip3 install -U -r $DIR/requirements/py_requirements.txt

RUN echo 'alias code-correction="python3 /src/main.py"' >> ~/.bashrc

# Default command
CMD /bin/bash
