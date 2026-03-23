#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#stack(dir: ltr)[
  #feynman(
    orientation: "horizontal",
    length: 0.5cm,
    (
      vertex("g_in", label: $gamma$),
      vertex("em_in", label: $e^-$),
      vertex("v1", shape: "dot", label: $alpha$),
      vertex("v2", shape: "dot", label: $alpha$),
      vertex("g_out", label: $gamma$),
      vertex("em_out", label: $e^-$),
      edge("em_in", "v1", type: "fermion"),
      edge("v1", "v2", type: "fermion", label: $e^-$),
      edge("v2", "em_out", type: "fermion"),
      edge("g_in", "v1", type: "photon"),
      edge("v2", "g_out", type: "photon"),
    ),
  )
][
  #feynman(
    orientation: "vertical",
    length: 0.5cm,
    (
      vertex("em_in", label: $e^-$),
      vertex("g_in", label: $gamma$),
      vertex("v1", shape: "dot", label: $alpha$),
      vertex("v2", shape: "dot", label: $alpha$),
      vertex("g_out", label: $gamma$),
      vertex("em_out", label: $e^-$),
      edge("em_in", "v1", type: "fermion"),
      edge("v1", "v2", type: "fermion", label: $e^-$),
      edge("v2", "em_out", type: "fermion"),
      edge("g_in", "v2", type: "photon"),
      edge("v1", "g_out", type: "photon"),
    ),
  )
]
