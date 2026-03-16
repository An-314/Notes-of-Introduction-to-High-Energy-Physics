#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#grid(columns: (1fr,) * 2)[
  #feynman(
    orientation: "vertical",
    length: 0.5cm,
    (
      vertex("p1", label: $p$),
      vertex("n1", label: $n$),
      vertex("a", shape: "dot"),
      vertex("b", shape: "dot"),
      vertex("n2", label: $n$),
      vertex("p2", label: $p$),
      edge("p1", "a", type: "fermion"),
      edge("a", "n1", type: "fermion"),
      edge("n2", "b", type: "fermion"),
      edge("b", "p2", type: "fermion"),
      edge("a", "b", type: "charged-scalar", label: $pi^+$),
    ),
  )
][
  #feynman(
    orientation: "vertical",
    length: 0.5cm,
    (
      vertex("p1", label: $p$),
      vertex("p2", label: $p$),
      vertex("a", shape: "dot"),
      vertex("b", shape: "dot"),
      vertex("p3", label: $n$),
      vertex("p4", label: $n$),
      edge("p1", "a", type: "fermion"),
      edge("a", "p2", type: "fermion"),
      edge("p3", "b", type: "fermion"),
      edge("b", "p4", type: "fermion"),
      edge("a", "b", type: "charged-scalar", label: $pi^0$),
    ),
  )
]
