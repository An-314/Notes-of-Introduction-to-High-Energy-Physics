#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#stack(dir: ltr)[
  #feynman(
    orientation: "vertical",
    length: 0.5cm,
    (
      vertex("ep_in", label: $e^+$),
      vertex("ep_out", label: $e^-$),
      vertex("v1", shape: "dot", label: $alpha$),
      vertex("v2", shape: "dot", label: $alpha$),
      vertex("em_in", label: $e^+$),
      vertex("em_out", label: $e^-$),
      edge("ep_in", "v1", type: "antifermion"),
      edge("em_in", "v1", type: "fermion"),
      edge("v1", "v2", type: "photon", label: $gamma$),
      edge("v2", "ep_out", type: "antifermion"),
      edge("v2", "em_out", type: "fermion"),
    ),
  )][
  #feynman(orientation: "horizontal", length: 0.5cm, (
    vertex("ep_in", label: $e^+$),
    vertex("em_in", label: $e^-$),
    vertex("v1", shape: "dot", label: $alpha$),
    vertex("v2", shape: "dot", label: $alpha$),
    vertex("em_out", label: $e^-$),
    vertex("ep_out", label: $e^+$),
    edge("em_in", "v1", type: "fermion"),
    edge("ep_in", "v1", type: "antifermion"),
    edge("v2", "em_out", type: "fermion"),
    edge("v2", "ep_out", type: "antifermion"),
    edge("v1", "v2", type: "photon", label: $gamma$),
  ))
]
