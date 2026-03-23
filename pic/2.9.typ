#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  layout: "tree",
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("v", shape: "dot", label: $alpha_s$),
    vertex("q", label: $q$),
    vertex("q_bar", label: $macron(q)$),
    vertex("g", label: $g$),
    edge("v", "q", type: "fermion"),
    edge("q_bar", "v", type: "fermion"),
    edge("v", "g", type: "gluon"),
  ),
)
