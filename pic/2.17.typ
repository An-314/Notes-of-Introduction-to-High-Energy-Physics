#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#stack(dir: ltr)[
  #feynman(
    length: 0.3cm,
    (
      vertex("e1"),
      vertex("e2"),
      vertex("e3"),
      vertex("e4"),
      vertex("a", shape: "dot"),
      edge("e1", "a", type: "g"),
      edge("e2", "a", type: "g"),
      edge("a", "b", type: "gluon"),
      loop(
        (vertex("c"), (type: "gluon")),
        (vertex("b"), (type: "gluon")),
      ),
      vertex("d", shape: "dot"),
      edge("c", "d", type: "gluon"),
      edge("d", "e3", type: "g"),
      edge("d", "e4", type: "g"),
    ),
  )][
  #feynman(
    length: 0.3cm,
    (
      vertex("e1"),
      vertex("e2"),
      vertex("a", shape: "dot"),
      vertex("b", shape: "dot"),
      vertex("c", shape: "dot"),
      vertex("e3"),
      vertex("e4"),
      edge("e1", "a", type: "g"),
      edge("e2", "a", type: "g"),
      edge("a", "b", type: "gluon"),
      loop(
        (vertex("b"), (type: "gluon")),
      ),
      edge("b", "c", type: "gluon"),
      edge("c", "e3", type: "g"),
      edge("c", "e4", type: "g"),
    ),
  )]
