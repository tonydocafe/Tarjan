require 'rgl/adjacency'
require 'rgl/traversal'

class TarjanSCC
  def initialize(grafo)
    @grafo = grafo
    @visita = 0
    @visitados = []
    @indices = {}
    @ultimos = {}
    @componentes = []
  end

  def encontrar_componentes
    @grafo.each_vertex do |no|
      dfs(no) unless @indices.key?(no)
    end
    @componentes
  end

  private

  def dfs(no)
    @indices[no] = @visita
    @ultimos[no] = @visita
    @visita += 1
    @visitados << no

    @grafo.adjacent_vertices(no).each do |vizinho|
      if !@indices.key?(vizinho)
        dfs(vizinho)
        @ultimos[no] = [@ultimos[no], @ultimos[vizinho]].min
      elsif @visitados.include?(vizinho)
        @ultimos[no] = [@ultimos[no], @indices[vizinho]].min
      end
    end

    if @indices[no] == @ultimos[no]
      componente = []
      loop do
        v = @visitados.pop
        componente << v
        break if v == no
      end
      @componentes << componente
    end
  end
end

g = RGL::DirectedAdjacencyGraph.new
File.readlines("entrada.txt").each do |linha|
  de, para = linha.strip.split
  g.add_edge(de, para)
end

tarjan = TarjanSCC.new(g)
tarjan.encontrar_componentes.each_with_index do |comp, i|
  puts "Componente #{i + 1}: #{comp.join(', ')}"
end
