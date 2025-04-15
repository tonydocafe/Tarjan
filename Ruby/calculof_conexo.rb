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

def funcao(g, no)
  @indices[no] = @visita
  @ultimos[no] = @visita
  @visita += 1
  @visitados << no

  g.adjacent_vertices(no).each do |vizinho|
    if !@indices.key?(vizinho)
      funcao(g, vizinho)
      @ultimos[no] = [@ultimos[no], @ultimos[vizinho]].min
    elsif @visitados.include?(vizinho)
      @ultimos[no] = [@ultimos[no], @indices[vizinho]].min
    end
  end
  
 if @indices[no] == @ultimos[no]
    componente_atual = []
    loop do
      v = @visitados.pop
      componente_atual << v
      break if v == no
    end
    @componentes_fortemente_conexos << componente_atual
  end
end
g.each_vertex do |no|
  funcao(g, no) unless @indices.key?(no)
end
