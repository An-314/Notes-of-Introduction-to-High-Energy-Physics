#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  // orientation: "vertical",
  layout: "tree",
  length: 0.4cm,
  (
    vertex("mu-", label: $mu^-$),
    vertex("v1"),
    vertex("v2"),
    vertex("nu-mu", label: $nu_mu$),
    vertex("nu-bar-e", label: $macron(nu)_e$),
    vertex("e-", label: $e^-$),
    edge("mu-", "v1", type: "fermion"),
    edge("v1", "v2", type: "charged-scalar", label: $W$),
    edge("v1", "nu-mu", type: "fermion"),
    edge("v2", "nu-bar-e", type: "antifermion"),
    edge("v2", "e-", type: "fermion"),
  ),
)
