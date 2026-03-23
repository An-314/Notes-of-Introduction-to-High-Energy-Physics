#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let t-r(it) = text(fill: red)[#it]
#let t-g(it) = text(fill: green)[#it]
#let t-b(it) = text(fill: blue)[#it]
#let t-r-inv(it) = text(fill: rgb(0%, 100%, 100%))[#it]
#let t-g-inv(it) = text(fill: rgb(100%, 0%, 100%))[#it]
#let t-b-inv(it) = text(fill: rgb(100%, 100%, 0%))[#it]

#feynman(
  length: 0.4cm,
  (
    vertex("i", label: $q(#t-b($b$))$),
    vertex("v", shape: "dot", label: $alpha_s$),
    vertex("f2"),
    vertex("f1", label: $q(#t-r($r$))$),
    edge("i", "v", type: "fermion"),
    edge("v", "f1", type: "fermion"),
    edge("v", "f2", type: "gluon", momentum: $g(#t-b($b$)#t-r-inv($macron(r)$))$),
  ),
)
