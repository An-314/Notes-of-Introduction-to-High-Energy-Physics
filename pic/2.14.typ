#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  length: 0.4cm,
  (
    vertex("i1"),
    vertex("v"),
    vertex("i2"),
    vertex("i3"),
    edge("i1", "v", type: "gluon"),
    edge("i2", "v", type: "gluon"),
    edge("i3", "v", type: "gluon"),
  ),
)
