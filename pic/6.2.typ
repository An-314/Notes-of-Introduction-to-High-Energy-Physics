#set page(height: auto, width: auto, margin: 0.5cm)

// 1) 三角形插入图
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#set page(width: auto, height: auto, margin: 4mm)

#let L = 0.85cm

// 1) 三角 loop
#let diag1 = feynman(
  // layout: "tree",
  orientation: "horizontal",
  length: L,
  (
    vertex("Ain", label: $A$),
    vertex("v0", shape: "dot"),
    vertex("vt", shape: "dot"),
    vertex("vb", shape: "dot"),
    vertex("Bout", label: $B$),
    vertex("Cout", label: $C$),
    edge("Ain", "v0"),
    edge("v0", "vt", label: $C$),
    edge("v0", "vb", label: $B$),
    edge("vt", "vb", label: $A$),
    edge("vt", "Bout"),
    edge("vb", "Cout"),
  ),
)


// 2) A 线上 bubble，再分裂成 B, C
#let diag2 = feynman(
  length: L,
  (
    vertex("ein", label: $A$),
    edge("ein", "a"),
    loop(
      (vertex("a"), (label: $B$)),
      (vertex("b"), (label: $C$)),
    ),
    vertex("v"),
    vertex("eB", label: $B$),
    vertex("eC", label: $C$),
    edge("b", "v", label: $A$),
    edge("v", "eB"),
    edge("v", "eC"),
  ),
)

// 3) C 支路上有 bubble
#let diag3 = feynman(
  length: L,
  (
    vertex("ein", label: $A$),
    vertex("v"),
    vertex("eB", label: $B$),
    vertex("eC", label: $C$),
    edge("ein", "v"),
    edge("v", "eB"),
    edge("v", "a", label: $C$),
    loop(
      (vertex("a"), (label: $A$)),
      (vertex("b"), (label: $B$)),
    ),
    edge("b", "eC"),
  ),
)

// 4) B 支路上有 bubble
#let diag4 = feynman(
  length: L,
  (
    vertex("ein", label: $A$),
    vertex("v"),
    vertex("eB", label: $B$),
    vertex("eC", label: $C$),
    edge("ein", "v"),
    edge("v", "eC"),
    edge("v", "a", label: $B$),
    loop(
      (vertex("a"), (label: $A$)),
      (vertex("b"), (label: $C$)),
    ),
    edge("b", "eB"),
  ),
)

#stack(
  dir: ltr,
  spacing: 1cm,
  [#diag1],
  [#diag2],
  [#diag3],
  [#diag4],
)
