import requests
import json

with open('dados.json', 'r', encoding='utf-8') as f:
    dados = json.load(f)

response = requests.post('http://127.0.0.1:5000/gerar-pptx', json=dados)

if response.status_code == 200:
    with open('resultado.pptx', 'wb') as f:
        f.write(response.content)
    print("✓ PPTX gerado com sucesso!")
else:
    print(f"Erro: {response.json()}")