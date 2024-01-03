import networkx as nx


g = nx.read_edgelist("entrada.txt", create_using=nx.DiGraph())


visita = 0 #variável para rastrear a ordem de visita dos nós
visitados = []#lista para manter os nós visitados
indices = {}#dicionário para rastrear os índices dos nós
ultimos = {}#dicionário para rastrear os ultimos valores visitados dos nós
componentes_fortmente_conexos = []#lista para armazenar os componentes fortemente conexos


def funcao(no):
    global visita
    indices[no] = visita
    ultimos[no] = visita
    visita += 1
    visitados.append(no)#.append adiciona o no em visitados. 

    for vizinho in g.neighbors(no):#(neighbors traduzido é vizinhos)é um metodo da biblioteca networkx
        if vizinho not in indices:
            funcao(vizinho)
            ultimos[no] = min(ultimos[no], ultimos[vizinho])
        elif vizinho in visitados:
            ultimos[no] = min(ultimos[no], indices[vizinho])

    if indices[no] == ultimos[no]:
        comp_fconexos_atual = []
        while True:
            v = visitados.pop()#.pop remove ultimo elemento de visitados, armazena o ultimo elemento em v. 
            comp_fconexos_atual.append(v)
            if v == no:
                break
        componentes_fortmente_conexos.append(comp_fconexos_atual)


for no in g:
    if no not in indices:
        funcao(no)

for i, componente in enumerate(componentes_fortmente_conexos):
    print(f"Componente f-conexo {i + 1} sendo:\n{componente}")

print("do grafo:")
for(node_from,node_to)in g.edges():
    print(node_from,node_to)
