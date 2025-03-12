FROM mcr.microsoft.com/mssql/server:2022-latest

# Instalação do SSH
RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && echo 'root:senha123' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Configuração do usuário SSH (substitua com suas credenciais)
RUN useradd -m -s /bin/bash admin \
    && echo 'admin:secreta' | chpasswd

# Portas expostas
EXPOSE 22 1433

# Script de inicialização combinado
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
