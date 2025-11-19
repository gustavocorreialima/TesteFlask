# API Gerador de PPTX

API Flask para gerar apresentações PPTX a partir de dados JSON.

## 🚀 Como rodar com Docker Compose

### Pré-requisitos
- Docker Desktop instalado

### Passos

1. Clone o repositório:
```bash
git clone [URL-DO-SEU-REPOSITORIO]
cd TesteFlask
```

2. Inicie o container:
```bash
docker-compose up -d
```

3. Verifique se está rodando:
```bash
curl http://localhost:5000/health
```

4. Teste a geração de PPTX:
```bash
python teste.py
```

## 📝 Como usar

### Endpoint: `/gerar-pptx`

**Método:** POST  
**Content-Type:** application/json

### Exemplo de requisição:
```python
import requests
import json

with open('dados.json', 'r', encoding='utf-8') as f:
    dados = json.load(f)

response = requests.post('http://localhost:5000/gerar-pptx', json=dados)

if response.status_code == 200:
    with open('resultado.pptx', 'wb') as f:
        f.write(response.content)
    print("✓ Arquivo gerado com sucesso!")
```

## 🛠️ Comandos úteis
```bash
# Ver logs em tempo real
docker-compose logs -f

# Parar o container
docker-compose down

# Reconstruir a imagem
docker-compose up -d --build

# Reiniciar o container
docker-compose restart
```

## 📁 Estrutura do projeto
```
TesteFlask/
├── app.py                    # Aplicação Flask
├── dados.json                # Exemplo de dados
├── template.pptx             # Template do PPTX
├── teste.py                  # Script de teste
├── Dockerfile                # Configuração Docker
├── docker-compose.yml        # Orquestração Docker
└── requirements.txt          # Dependências Python
```

## 🐛 Troubleshooting

**Container não inicia:**
```bash
docker-compose logs
```

**Porta 5000 em uso:**
- Edite `docker-compose.yml` e mude `"5000:5000"` para `"5001:5000"`
- Acesse `http://localhost:5001`

**Reconstruir do zero:**
```bash
docker-compose down
docker-compose up -d --build
```
```

---

## Resumo visual:

Todos os 4 arquivos novos vão **na raiz** (pasta TESTEFLASK), no **mesmo nível** do `app.py`:
```
TESTEFLASK/
├── .gitignore           ⭐ NOVO
├── .dockerignore        ⭐ NOVO  
├── docker-compose.yml   ⭐ NOVO
├── README.md            ⭐ NOVO
├── app.py               ✓ já existe
├── Dockerfile           ✓ já existe
└── ...