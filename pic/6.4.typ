#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let L = 0.55cm

#let diag_u = feynman(
  length: L,
  (
    vertex("Ain", label: $A$),
    vertex("Bin", label: $B$),
    vertex("Bout", label: $B$),
    vertex("Aout", label: $A$),
    vertex("v1", shape: "dot"),
    vertex("v2", shape: "dot"),
    edge("Ain", "v1"),
    edge("Bin", "v2"),
    edge("v1", "Bout"),
    edge("v2", "Aout"),
    edge("v1", "v2", label: $C$),
  ),
  orientation: "vertical",
)

#let diag_t = feynman(
  length: L,
  (
    vertex("Bin", label: $B$),
    vertex("Ain", label: $A$),
    vertex("Aout", label: $A$),
    vertex("Bout", label: $B$),
    vertex("v1", shape: "dot"),
    vertex("v2", shape: "dot"),
    edge("Ain", "v1"),
    edge("Bin", "v1"),
    edge("v2", "Aout"),
    edge("v2", "Bout"),
    edge("v1", "v2", label: $C$),
  ),
  orientation: "horizontal",
)

#stack(dir: ltr)[
  #diag_u
][
  #diag_t
]
