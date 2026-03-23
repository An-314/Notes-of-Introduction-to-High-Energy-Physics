#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  length: 0.5cm,
  (
    vertex("p1", label: $s$),
    vertex("p2", label: $macron(u)$),
    vertex("a", shape: "dot"),
    vertex("b", shape: "dot"),
    vertex("p3", label: $macron(nu)_mu$),
    vertex("p4", label: $mu^-$),
    edge("p1", "a", type: "fermion"),
    edge("a", "p2", type: "fermion"),
    edge("p3", "b", type: "fermion"),
    edge("b", "p4", type: "fermion"),
    edge("a", "b", type: "charged-scalar", label: $W^-$),
  ),
)
