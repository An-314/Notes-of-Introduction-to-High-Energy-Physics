#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  // orientation: "vertical",
  layout: "tree",
  length: 0.4cm,
  (
    vertex("d", label: [$Delta^0 (d d u)$ \ $d$]),
    vertex("v1"),
    vertex("v2"),
    vertex("u", label: [$u$ $p(u d u)$]),
    vertex("nu-bar-e", label: $u$),
    vertex("e-", label: $d$),
    edge("d", "v1", type: "fermion"),
    edge("v1", "v2", type: "charged-scalar", label: $W^-$),
    edge("v1", "u", type: "fermion"),
    edge("v2", "nu-bar-e", type: "antifermion"),
    edge("v2", "e-", type: "fermion"),
  ),
)
