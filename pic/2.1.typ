#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  layout: "tree",
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("v", shape: "dot", label: $alpha$),
    vertex("e-", label: $e^-$),
    vertex("e+", label: $e^+$),
    vertex("g", label: $gamma$),
    edge("v", "e-", type: "fermion"),
    edge("e+", "v", type: "fermion"),
    edge("v", "g", type: "photon"),
  ),
)
