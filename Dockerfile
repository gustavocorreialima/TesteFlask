# Usa Python 3.12 como base
FROM python:3.12-slim

# Define o diretório de trabalho
WORKDIR /app

# Instala dependências do sistema necessárias para python-pptx
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copia o arquivo de dependências
COPY requirements.txt .

# Instala as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos os arquivos do projeto
COPY . .

# Cria a pasta temp para arquivos temporários
RUN mkdir -p temp

# Expõe a porta 5000
EXPOSE 5000

# Comando para rodar a aplicação
CMD ["python", "app.py"]