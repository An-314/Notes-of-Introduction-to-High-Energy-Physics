#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("u", label: $u$),
    vertex("ubar", label: $macron(u)$),
    vertex("v1", shape: "dot", label: $alpha$),
    vertex("v2", shape: "dot", label: $alpha$),
    vertex("g1", label: $gamma$),
    vertex("g2", label: $gamma$),
    edge("u", "v1", type: "fermion"),
    edge("ubar", "v2", type: "antifermion"),
    edge("v1", "v2", type: "fermion", label: $u$),
    edge("v1", "g1", type: "photon"),
    edge("v2", "g2", type: "photon"),
  ),
)
