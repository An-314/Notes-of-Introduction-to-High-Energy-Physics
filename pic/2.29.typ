#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#stack(dir: ltr)[
  #feynman(
    length: 0.4cm,
    (
      vertex("q1", label: $q^(-1/3)$),
      vertex("W-", label: $W^-$),
      vertex("v"),
      vertex("q2", label: $q^(+2/3)$),
      edge("q1", "v", type: "fermion"),
      edge("q2", "v", type: "antifermion"),
      edge("v", "W-", type: "charged-scalar"),
    ),
  )
][
  #feynman(
    length: 0.4cm,
    (
      vertex("q3", label: $q^(+2/3)$),
      vertex("W+", label: $W^+$),
      vertex("v"),
      vertex("q4", label: $q^(-1/3)$),
      edge("q3", "v", type: "fermion"),
      edge("q4", "v", type: "antifermion"),
      edge("v", "W+", type: "charged-scalar"),
    ),
  )
]
