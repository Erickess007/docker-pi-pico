# Usar uma imagem base do Ubuntu
FROM ubuntu:22.04

# Instalar dependências
RUN apt-get update && apt-get install -y \
    cmake \
    gcc-arm-none-eabi \
    build-essential \
    git \
    python3 \
    python3-pip \
    python3-venv \
    libnewlib-arm-none-eabi \
    && apt-get clean

# Clonar o SDK do Pico
RUN git clone -b master https://github.com/raspberrypi/pico-sdk.git /opt/pico-sdk

# Adicionar o SDK ao PATH
ENV PICO_SDK_PATH=/opt/pico-sdk

# Criar diretório de trabalho
WORKDIR /workspace

# Expor a pasta para os usuários trabalharem
VOLUME /workspace

# Definir o ponto de entrada padrão
CMD ["/bin/bash"]
