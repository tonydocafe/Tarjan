require 'rgl/adjacency'
require 'rgl/traversal'

g = RGL::DirectedAdjacencyGraph.new

# Lê as arestas do arquivo "entrada.txt"
File.readlines("entrada.txt").each do |linha|
  de, para = linha.strip.split
  g.add_edge(de, para)
end

@visita = 0
@visitados = []
@indices = {}
@ultimos = {}
@componentes_fortemente_conexos = []
