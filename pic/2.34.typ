#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#stack(dir: ltr, spacing: 10pt)[
  #feynman(
    length: 0.5cm,
    (
      vertex("i1"),
      vertex("i2"),
      vertex("a"),
      vertex("f"),
      edge("i1", "a", type: "anti-charged-scalar", label: $W$),
      edge("i2", "a", type: "charged-scalar", label: $W$),
      edge("a", "f", type: "scalar", label: $Z$),
    ),
  )
][
  #feynman(
    length: 0.5cm,
    (
      vertex("i1"),
      vertex("i2"),
      vertex("f1"),
      vertex("f2"),
      vertex("a"),
      edge("i1", "a", type: "anti-charged-scalar", label: $W$),
      edge("i2", "a", type: "charged-scalar", label: $W$),
      edge("a", "f1", type: "charged-scalar", label: $W$),
      edge("a", "f2", type: "anti-charged-scalar", label: $W$),
    ),
  )
][
  #feynman(
    length: 0.5cm,
    (
      vertex("i1"),
      vertex("i2"),
      vertex("f1"),
      vertex("f2"),
      vertex("a"),
      edge("i1", "a", type: "anti-charged-scalar", label: $W$),
      edge("i2", "a", type: "charged-scalar", label: $W$),
      edge("a", "f1", type: "scalar", label: $Z$),
      edge("a", "f2", type: "scalar", label: $Z$),
    ),
  )
]


#stack(dir: ltr, spacing: 10pt)[
  #feynman(
    length: 0.5cm,
    (
      vertex("i1"),
      vertex("i2"),
      vertex("a"),
      vertex("f"),
      edge("i1", "a", type: "anti-charged-scalar", label: $W$),
      edge("i2", "a", type: "charged-scalar", label: $W$),
      edge("a", "f", type: "photon", label: $gamma$),
    ),
  )
][
  #feynman(
    length: 0.5cm,
    (
      vertex("i1"),
      vertex("i2"),
      vertex("f1"),
      vertex("f2"),
      vertex("a"),
      edge("i1", "a", type: "anti-charged-scalar", label: $W$),
      edge("i2", "a", type: "charged-scalar", label: $W$),
      edge("a", "f1", type: "photon", label: $gamma$),
      edge("a", "f2", type: "photon", label: $gamma$),
    ),
  )
][
  #feynman(
    length: 0.5cm,
    (
      vertex("i1"),
      vertex("i2"),
      vertex("f1"),
      vertex("f2"),
      vertex("a"),
      edge("i1", "a", type: "anti-charged-scalar", label: $W$),
      edge("i2", "a", type: "charged-scalar", label: $W$),
      edge("a", "f1", type: "photon", label: $gamma$),
      edge("a", "f2", type: "photon", label: $gamma$),
    ),
  )
]
