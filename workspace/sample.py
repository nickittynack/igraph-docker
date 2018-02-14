import igraph as ig
G = ig.Graph.Full(10)
ig.plot(G, bbox = (400,400), layout = G.layout('kk'))
