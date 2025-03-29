# Cálculo para Identificar Componentes Fortemente Conexos

Este projeto apresenta um script em Python que utiliza a biblioteca **NetworkX** para manipulação e análise de grafos direcionados. O objetivo principal do script é ler um grafo a partir de uma lista de arestas armazenada em um arquivo e identificar os **componentes fortemente conexos** utilizando o **Algoritmo de Tarjan**.

---

## Tecnologias Utilizadas

Para a execução deste script, foram utilizadas as seguintes ferramentas:

- **Python**: Linguagem de programação utilizada para a implementação do algoritmo.
- **Algoritmo de Tarjan**: Utilizado para encontrar componentes fortemente conexos de um grafo.
- **Biblioteca NetworkX**: Responsável pela manipulação e análise do grafo.

---
## Estrutura do Script

### 1. Importação de Biblioteca
A biblioteca **NetworkX** é importada para permitir a criação e manipulação do grafo de maneira eficiente.

```python
import networkx as nx
```

### 2. Leitura do Grafo
A função **nx.read_edgelist** é utilizada para ler uma lista de arestas a partir de um arquivo de texto:

```python
g = nx.read_edgelist("entrada.txt", create_using=nx.DiGraph())
```

- **"entrada.txt"**: Nome do arquivo contendo a lista de arestas.
- **create_using=nx.DiGraph()**: Especifica que o grafo será direcionado.

### 3. Inicialização de Variáveis Globais

- **visita**: Contador global que rastreia a ordem de visita dos nós.
- **visitados**: Lista que armazena os nós visitados (pilha).
- **indices**: Dicionário que armazena o índice de cada nó (ordem de visita).
- **ultimos**: Dicionário que armazena o menor índice acessível a partir de cada nó.
- **componentes_fortemente_conexos**: Lista de listas que armazenam os componentes fortemente conexos identificados.

### 4. Implementação do Algoritmo de Tarjan
A função **tarjan(no)** é responsável por aplicar o algoritmo de Tarjan:

```python
def tarjan(no):
    global visita
    indices[no] = ultimos[no] = visita
    visita += 1
    visitados.append(no)
    
    for vizinho in g.neighbors(no):
        if vizinho not in indices:
            tarjan(vizinho)
            ultimos[no] = min(ultimos[no], ultimos[vizinho])
        elif vizinho in visitados:
            ultimos[no] = min(ultimos[no], indices[vizinho])
    
    if indices[no] == ultimos[no]:
        componente_atual = []
        while True:
            v = visitados.pop()
            componente_atual.append(v)
            if v == no:
                break
        componentes_fortemente_conexos.append(componente_atual)
```

### 5. Execução do Algoritmo para Cada Nó

```python
for no in g:
    if no not in indices:
        tarjan(no)
```

### 6. Exibição dos Resultados
Os componentes fortemente conexos são exibidos na saída do terminal:

```python
for i, componente in enumerate(componentes_fortemente_conexos):
    print(f"Componente {i + 1}: {componente}")
```

---

## Explicação do Algoritmo de Tarjan

O **Algoritmo de Tarjan** é um algoritmo baseado em **Busca em Profundidade (DFS)** para encontrar **Componentes Fortemente Conexos (CFCs)** em um grafo direcionado. Ele opera da seguinte maneira:

1. Cada nó recebe um **índice de visitação** e um **valor baixo** (menor índice acessível).
2. Os nós são armazenados em uma **pilha** conforme são visitados.
3. Quando um **ciclo é detectado**, os nós correspondentes são removidos da pilha e armazenados como um **componente fortemente conexo**.
4. O algoritmo tem **complexidade O(V + E)**, onde **V** é o número de vértices e **E** o número de arestas.

---

## Como Executar o Script

1. Certifique-se de ter o **Python** instalado.
2. Instale a biblioteca **NetworkX**, caso ainda não tenha:
   ```bash
   pip install networkx
   ```
3. Prepare um arquivo **entrada.txt** com a lista de arestas do grafo. Exemplo:
   ```
   A B
   B C
   C A
   C D
   D E
   ```
4. Execute o script:
   ```bash
   python script.py
   ```

---

## Exemplo de Saída

Para um grafo com as seguintes arestas:
```
A B
B C
C A
C D
D E
```
O script retorna:
```
Componente 1: ['A', 'B', 'C']
Componente 2: ['D']
Componente 3: ['E']
```

---

## Contribuição

Contribuições são bem-vindas! Para sugerir melhorias:
- Fork este repositório
- Crie uma branch para sua modificação (`git checkout -b minha-modificacao`)
- Commit suas mudanças (`git commit -m "Minha modificação"`)
- Envie um push para a branch (`git push origin minha-modificacao`)
- Abra um Pull Request

---

## Licença

Este projeto está sob a licença MIT - consulte o arquivo **LICENSE** para mais detalhes.

