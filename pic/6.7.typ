#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let L = 0.55cm

// 1) 上面的图：A + A -> B + B，s-channel
#let diag_s = feynman(
  length: L,
  (
    vertex("A1", label: $A$),
    vertex("A2", label: $A$),
    vertex("B1", label: $B$),
    vertex("B2", label: $B$),
    vertex("v1", shape: "dot"),
    vertex("v2", shape: "dot"),
    edge("A1", "v1", momentum: $p_2$),
    edge("A2", "v2", momentum: $p_1$),
    edge("v1", "B1", momentum: $p_4$),
    edge("v2", "B2", momentum: $p_3$),
    edge("v2", "v1", label: $C$, momentum: $q$),
  ),
  orientation: "vertical",
)

#diag_s
