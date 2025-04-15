# 🚀 Cálculo de Componentes Fortemente Conexos — Edição Python & Ruby 🧠💎

Você curte algoritmos de grafos e quer descobrir os segredos mais profundos (ou fortemente conexos 😄) de um grafo? Então senta aí, pega um café e vem curtir esse projetinho com a gente!

Este projeto traz **duas versões** do lendário **Algoritmo de Tarjan**, uma em **Python** com a poderosa `NetworkX`, e outra em **Ruby**, com a simpática `rgl`. Ambas buscam descobrir os **componentes fortemente conexos (CFCs)** de um grafo dirigido.

---

## 💪 Tecnologias Utilizadas

### Python Edition
- 🐍 **Python**
- 🔍 **Algoritmo de Tarjan**
- 🧠 **NetworkX** — a biblioteca ninja dos grafos

### Ruby Edition
- 💎 **Ruby**
- 🔍 **Algoritmo de Tarjan**
- 🧠 **RGL (Ruby Graph Library)** — pequena, mas poderosa!

---

## 🧹 Estrutura do Script

### 1. 📦 Importação da Biblioteca

**Python:**
```python
import networkx as nx
```

**Ruby:**
```ruby
require 'rgl/adjacency'
require 'rgl/traversal'
```

---

### 2. 📂 Leitura do Grafo

**Python:**
```python
g = nx.read_edgelist("entrada.txt", create_using=nx.DiGraph())
```

**Ruby:**
```ruby
g = RGL::DirectedAdjacencyGraph.new
File.readlines("entrada.txt").each do |linha|
  de, para = linha.strip.split
  g.add_edge(de, para)
end
```

---

### 3. ⚡ Inicialização das Variáveis

Ambas as versões utilizam variáveis globais ou de instância para rastrear:
- Ordem de visita
- Pilha de nós visitados
- Índices e menores alcançáveis
- CFCs encontrados

---

### 4. 🧠 O Coração da Coisa — Algoritmo de Tarjan

A lógica é a mesma nas duas linguagens: um DFS com rastreamento esperto pra achar os ciclos e formar os componentes fortemente conectados!

```python
def tarjan(no):
    ...
```

```ruby
def funcao(g, no)
    ...
end
```

---

### 5. 🎮 Execução do Algoritmo

**Python:**
```python
for no in g:
    if no not in indices:
        tarjan(no)
```

**Ruby:**
```ruby
g.each_vertex do |no|
  funcao(g, no) unless @indices.key?(no)
end
```

---

## 💡 Como Executar

### Python 🐍
1. Tenha Python instalado.
2. Instale a NetworkX:
   ```bash
   pip install networkx
   ```
3. Prepare um `entrada.txt` com as arestas:
   ```
   A B
   B C
   C A
   D E
   ```
4. Execute:
   ```bash
   python script.py
   ```

### Ruby 💎
1. Tenha Ruby instalado.
2. Instale a RGL:
   ```bash
   gem install rgl
   ```
3. Prepare o mesmo `entrada.txt`.
4. Execute:
   ```bash
   ruby grafo_tarjan.rb
   ```

---

## 🎉 Exemplo de Saída

Para o grafo:
```
A B
B C
C A
D E
```

Você verá algo assim:
```
Componente f-conexo 1 sendo:
["A", "B", "C"]
Componente f-conexo 2 sendo:
["E"]
Componente f-conexo 3 sendo:
["D"]
```

---

## 🤝 Contribuições

Quer brincar com a lógica ou deixar o código mais fofo ainda? Então:
- Dê um fork 🍴
- Crie sua branch: `git checkout -b feat/nova-feature`
- Faça o commit do amor: `git commit -m "feat: adicionei mágica"`
- Envie pro seu repositório: `git push origin feat/nova-feature`
- Abra um Pull Request! ✨

---

## 📄 Licença

MIT, livre como os caminhos de um grafo! 🧽  
Veja o arquivo **LICENSE** para detalhes.

