#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("em_in", label: $e^-$),
    vertex("ep_in", label: $e^+$),
    vertex("v1", shape: "dot", label: $alpha$),
    vertex("v2", shape: "dot", label: $alpha$),
    vertex("g1", label: $gamma$),
    vertex("g2", label: $gamma$),
    edge("em_in", "v1", type: "fermion"),
    edge("ep_in", "v2", type: "antifermion"),
    edge("v1", "v2", type: "fermion", label: $e^-$),
    edge("v1", "g1", type: "photon"),
    edge("v2", "g2", type: "photon"),
  ),
)
