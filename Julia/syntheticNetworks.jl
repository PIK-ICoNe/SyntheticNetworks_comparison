using SyntheticNetworks
using EmbeddedGraphs
using LightGraphs
using SimpleTraits
using Statistics

# defining parameters for graph initialization


n = 20
n0 = 10
p = 0.2
q = 0.3
r = 1. / 3.
s = 0.1
u = 0.0 # currently not supported

function synthetic_network(n, n0, p, q, r, s, u)
    RPG = RandomPowerGrid(n, n0, p, q, r, s, u)
    network = generate_graph(RPG) # network is an EmbeddedGraph object
    return network.graph
end

g = synthetic_network(n, n0, p, q, r, s, u)

## statistics

# average node degree
function average_node_degree(g::SimpleGraph)
    sum(degree(g))/nv(g)
end

average_node_degree(g)

# global clustering coefficient
global_clustering_coefficient(g)

# average shortest path length
mean(floyd_warshall_shortest_paths(g).dists)

## assortativity

function assortativity(g::AbstractGraph{T}) where T
    P = promote_type(Int64, T) # at least Int64 to reduce risk of overflow
    nue  = ne(g)
    sjk = sj = sk = sjs = sks = zero(P)
    for d in edges(g)
        j = P(outdegree(g, src(d)) - 1)
        k = P(indegree(g, dst(d)) - 1)
        sjk += j*k
        sj  += j
        sk  += k
        sjs += j^2
        sks += k^2
    end
    return assortativity_coefficient(g, sjk, sj, sk, sjs, sks, nue)
end

#=
assortativity coefficient for directed graphs:
see equation (21) in M. E. J. Newman: Mixing patterns in networks, Phys. Rev. E 67, 026126 (2003),
http://arxiv.org/abs/cond-mat/0209450
=#
@traitfn function assortativity_coefficient(g::::IsDirected, sjk, sj, sk, sjs, sks, nue)
    return (sjk - sj*sk/nue) / sqrt((sjs - sj^2/nue)*(sks - sk^2/nue))
end

#=
assortativity coefficient for undirected graphs:
see equation (4) in M. E. J. Newman: Assortative mixing in networks, Phys. Rev. Lett. 89, 208701 (2002),
http://arxiv.org/abs/cond-mat/0205405/
=#
@traitfn function assortativity_coefficient(g::::(!IsDirected), sjk, sj, sk, sjs, sks, nue)
    return (sjk/nue - ((sj + sk)/(2*nue))^2) / ((sjs + sks)/(2*nue) - ((sj + sk)/(2*nue))^2)
end


assortativity(g)

# end
##

# for plotting

open("synthetic_networks/julia_networks.txt", "a") do io
    for i in 1:1000
        graph = synthetic_network(n, n0, p, q, r, s, u)
        node_degree = average_node_degree(graph)
        assortativity_value = assortativity(graph)
        average_shortes_path_length = mean(floyd_warshall_shortest_paths(graph).dists)
        clust_coefficient = global_clustering_coefficient(graph)
        write(io, string(node_degree), "\t", string(assortativity_value), "\t", string(average_shortes_path_length), "\t", string(clust_coefficient), "\n")
        #write(io, string(i))
    end
end
