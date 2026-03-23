#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#stack(dir: ltr)[
  #feynman(
    length: 0.4cm,
    (
      vertex("f-", label: $f^-$),
      vertex("nu-bar", label: $macron(nu)_f$),
      vertex("v"),
      vertex("W-", label: $W^-$),
      edge("f-", "v", type: "fermion"),
      edge("nu-bar", "v", type: "antifermion"),
      edge("v", "W-", type: "charged-scalar"),
    ),
  )
][
  #feynman(
    length: 0.4cm,
    (
      vertex("f+", label: $f^+$),
      vertex("nu", label: $nu_f$),
      vertex("v"),
      vertex("W+", label: $W^+$),
      edge("f+", "v", type: "fermion"),
      edge("nu", "v", type: "antifermion"),
      edge("v", "W+", type: "anti-charged-scalar"),
    ),
  )
]
