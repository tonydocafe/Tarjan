# Cálculo para identificar componentes fortemente conexos 

Este script em Python utiliza a biblioteca NetworkX para manipulação e análise de grafos direcionados. 
A estrutura do script está organizada de forma a ler um grafo a partir de uma lista de arestas, armazenada no arquivo "entrada.txt",
e identificar os componentes fortemente conexos desse grafo.

#### foram utilizados:
- Python
- Algoritmo de Tarjan
- Bibiloteca Networkx

## Estrutura 

#### Importação de Biblioteca:

A biblioteca NetworkX é importada para facilitar a manipulação do grafo que é uma biblioteca em Python para criação, manipulação 
e estudo da estrutura, dinâmica e funções de grafos complexos.

#### Leitura do Grafo

A função nx.read_edgelist lê uma lista de arestas a partir de um arquivo de texto, os seus parâmetros sendo 
"entrada.txt" que é o nome do arquivo de texto que contém a lista de arestas e
create_using=nx.DiGraph() que indica que o grafo a ser criado é direcionado (DiGraph).

#### Inicialização de Variáveis Globais

- visita é o contador global que rastreia a ordem em que os nós são visitados.
- visitados é a lista que armazena os nós à medida que são visitados, funcionando como uma pilha.
- indices é o dicionário que armazena o índice de cada nó, indicando a ordem de visita.
- ultimosé o dicionário que armazena o menor índice acessível a partir de cada nó.
- componentes_fortmente_conexos é a lista de listas que armazena os componentes fortemente conexos identificados no grafo.

#### Definição da Função Principal

- funcao(no) é a função recursiva que implementa o algoritmo de Tarjan para encontrar componentes fortemente conexos.
- global visita é a declaração para permitir a modificação da variável global visita dentro da função.
- indices[no] e ultimos[no] inicializam o índice e o valor baixo do nó com o valor atual de visita.
- visita += 1 incrementa o contador global visita após cada visita.
- visitados.append(no) adiciona o nó à lista de nós visitados.

#### Exploração dos Vizinhos

- g.neighbors(no) retorna uma lista de nós vizinhos do nó atual.
- o condicional if vizinho not in indices verifica se o vizinho ainda não foi visitado.
- a chamada recursiva funcao(vizinho) é chamada para explorar o vizinho.
- ultimos[no] é atualizado com o menor valor entre ultimos[no] e ultimos[vizinho].
- a condicional elif vizinho in visitados verifica se o vizinho está na lista de nós visitados.
- ultimos[no] é atualizado com o menor valor entre ultimos[no] e indices[vizinho].

#### Identificação de Componentes Fortemente Conexos

- a condicional if indices[no] == ultimos[no] verifica se o nó é a raiz de um componente fortemente conexo.
- comp_fconexos_atual = []: Inicializa uma lista para armazenar os nós do componente atual.
- v = visitados.pop() remove e obtém o último nó da lista visitados.
- comp_fconexos_atual.append(v) adiciona o nó à lista do componente atual.
- a condicional if v == no interrompe o laço quando o nó inicial é alcançado.
- componentes_fortmente_conexos.append(comp_fconexos_atual) adiciona o componente atual à lista de componentes fortemente conexos.

#### Execução da Função para Cada Nó no Grafo

- laço for no in g itera sobre cada nó no grafo.
- a condicional if no not in indices verifica se o nó ainda não foi visitado.
- a chamada funcao(no) inicia a busca em profundidade a partir do nó não visitado.

####  Exibição dos Resultados

- laço for i, componente in enumerate(componentes_fortmente_conexos) itera sobre cada componente fortemente conexo identificado.
- print(f"Componente f-conexo {i + 1} sendo:\n{componente}") imprime o índice e os nós de cada componente.
- laço for (node_from, node_to) in g.edges() itera sobre cada aresta do grafo.
- print(node_from, node_to) imprime as arestas do grafo.


#### Algoritmo de Torjan 

O algoritmo de Tarjan encontra componentes fortemente conexos (CFCs) em grafos direcionados usando uma busca em profundidade (DFS). Ele rastreia os nós visitados com uma pilha, mantém um índice para a ordem de visita e um valor baixo para o menor índice acessível. Quando o índice de um nó é igual ao seu valor baixo, ele identifica a raiz de um CFC e remove os nós da pilha até voltar à raiz, formando o CFC. O processo é repetido para todos os nós, e o algoritmo tem complexidade linear O(V + E), onde V é o número de vértices e E é o número de arestas.
