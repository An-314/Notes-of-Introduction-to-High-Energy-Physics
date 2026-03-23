#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("nui", label: $nu$),
    vertex("ei", label: $e$),
    vertex("v1"),
    vertex("v2"),
    vertex("nuf", label: $nu$),
    vertex("ef", label: $e$),
    edge("nui", "v1", type: "fermion"),
    edge("ei", "v2", type: "fermion"),
    edge("v1", "v2", type: "scalar", label: $Z$),
    edge("v1", "nuf", type: "fermion"),
    edge("v2", "ef", type: "fermion"),
  ),
)
