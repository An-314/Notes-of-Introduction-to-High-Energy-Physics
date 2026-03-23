#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.4cm,
  (
    vertex("nui", label: $nu$),
    vertex("di", label: $d$),
    vertex("v1"),
    vertex("v2"),
    vertex("nuf", label: $nu$),
    vertex("df", label: $d$),
    edge("nui", "v1", type: "fermion"),
    edge("di", "v2", type: "fermion", momentum: [ \ \ $u$ \ $u$]),
    edge("v1", "v2", type: "scalar", label: $Z$),
    edge("v1", "nuf", type: "fermion"),
    edge("v2", "df", type: "fermion", momentum: []),
  ),
)
