import org.jgrapht.Graph;
import org.jgrapht.Graphs;
import org.jgrapht.graph.DefaultDirectedGraph;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.io.*;

import java.io.File;
import java.util.*;

public class TarjanSCC {
    private static int visita = 0;
    private static Stack<String> pilha = new Stack<>();
    private static Map<String, Integer> indices = new HashMap<>();
    private static Map<String, Integer> ultimos = new HashMap<>();
    private static List<List<String>> componentes = new ArrayList<>();
    private static Set<String> noNaPilha = new HashSet<>();

    public static void main(String[] args) throws Exception {
        Graph<String, DefaultEdge> g = new DefaultDirectedGraph<>(DefaultEdge.class);

        // Lê o arquivo de arestas
        ComponentNameProvider<String> vertexIdProvider = v -> v;
        ComponentNameProvider<String> vertexLabelProvider = v -> v;
        CSVImporter<String, DefaultEdge> importer = new CSVImporter<>((label, attributes) -> label,
                CSVFormat.EDGE_LIST, ',');
        importer.importGraph(g, new File("entrada.txt"));

        // Executa o algoritmo de Tarjan
        for (String no : g.vertexSet()) {
            if (!indices.containsKey(no)) {
                funcao(no, g);
            }
        }

        // Imprime os componentes fortemente conexos
        for (int i = 0; i < componentes.size(); i++) {
            System.out.println("Componente f-conexo " + (i + 1) + " sendo:\n" + componentes.get(i));
        }

        // Imprime todas as arestas do grafo
        System.out.println("do grafo:");
        for (DefaultEdge edge : g.edgeSet()) {
            System.out.println(g.getEdgeSource(edge) + " " + g.getEdgeTarget(edge));
        }
    }

    private static void funcao(String no, Graph<String, DefaultEdge> g) {
        indices.put(no, visita);
        ultimos.put(no, visita);
        visita++;
        pilha.push(no);
        noNaPilha.add(no);

        for (String vizinho : Graphs.successorListOf(g, no)) {
            if (!indices.containsKey(vizinho)) {
                funcao(vizinho, g);
                ultimos.put(no, Math.min(ultimos.get(no), ultimos.get(vizinho)));
            } else if (noNaPilha.contains(vizinho)) {
                ultimos.put(no, Math.min(ultimos.get(no), indices.get(vizinho)));
            }
        }

        if (indices.get(no).equals(ultimos.get(no))) {
            List<String> componenteAtual = new ArrayList<>();
            String v;
            do {
                v = pilha.pop();
                noNaPilha.remove(v);
                componenteAtual.add(v);
            } while (!v.equals(no));
            componentes.add(componenteAtual);
        }
    }
}

