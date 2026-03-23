#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  length: 0.3cm,
  (
    vertex("e1"),
    vertex("e2"),
    vertex("e3"),
    vertex("e4"),
    vertex("a", shape: "dot"),
    edge("e1", "a", type: "fermion"),
    edge("e2", "a", type: "antifermion"),
    edge("a", "b", type: "photon"),
    loop(
      (vertex("c"), (type: "fermion")),
      (vertex("b"), (type: "fermion")),
    ),
    vertex("d", shape: "dot"),
    edge("c", "d", type: "photon"),
    edge("d", "e3", type: "fermion"),
    edge("d", "e4", type: "antifermion"),
  ),
)
