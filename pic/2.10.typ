#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("i2", label: $macron(q)$),
    vertex("i1", label: $q$),
    vertex("v1", shape: "dot", label: $alpha_s$),
    vertex("v2", shape: "dot", label: $alpha_s$),
    vertex("f2", label: $macron(q)$),
    vertex("f1", label: $q$),
    edge("i1", "v1", type: "fermion"),
    edge("i2", "v2", type: "antifermion"),
    edge("v1", "v2", type: "gluon", label: $g$),
    edge("v1", "f1", type: "fermion"),
    edge("v2", "f2", type: "antifermion"),
  ),
)
