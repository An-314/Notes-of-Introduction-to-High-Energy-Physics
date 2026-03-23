#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.5cm,
  (
    vertex("g1", label: $gamma$),
    vertex("g2", label: $gamma$),
    vertex("v1", shape: "dot", label: $alpha$),
    vertex("v2", shape: "dot", label: $alpha$),
    vertex("ep_out", label: $e^+$),
    vertex("em_out", label: $e^-$),
    edge("g1", "v1", type: "photon"),
    edge("g2", "v2", type: "photon"),
    edge("v1", "v2", type: "fermion", label: $e^-$),
    edge("v1", "ep_out", type: "antifermion"),
    edge("v2", "em_out", type: "fermion"),
  ),
)
