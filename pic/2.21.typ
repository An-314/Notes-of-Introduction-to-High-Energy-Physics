#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  // orientation: "vertical",
  length: 0.4cm,
  (
    vertex("fbar", label: $macron(f)$),
    vertex("f", label: $f$),
    vertex("v"),
    vertex("Z", label: $Z$),
    edge("f", "v", type: "fermion"),
    edge("fbar", "v", type: "antifermion"),
    edge("v", "Z", type: "boson"),
  ),
)
