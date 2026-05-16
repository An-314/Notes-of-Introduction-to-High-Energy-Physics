#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  layout: "tree",
  // orientation: "vertical",
  length: 0.4cm,
  (
    vertex("A", label: $A$),
    vertex("B", label: $B$),
    vertex("v", shape: "dot"),
    vertex("C", label: $C$),
    edge("A", "v", type: "fermion", momentum: $p_1$),
    edge("v", "B", type: "fermion", momentum: $p_2$),
    edge("v", "C", type: "fermion", momentum: $p_3$),
  ),
)
