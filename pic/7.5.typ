#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let L = 0.5cm

// 左图：竖着的那张
#let diag_left = feynman(
  orientation: "vertical",
  length: L,
  (
    // 外腿
    vertex("tl"), // 左上：光子
    vertex("tr", label: $e^-$), // 右上：电子
    vertex("br"), // 右下：光子
    vertex("bl", label: $e^-$), // 左下：电子
    // 两个顶点
    vertex("vt", shape: "dot", label: $alpha$),
    vertex("vb", shape: "dot", label: $alpha$),
    // 外线
    edge("tl", "vt", type: "photon", momentum: $p_2$),
    edge("vt", "tr", type: "fermion", momentum: $p_4$),
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "br", type: "photon", momentum: $p_3$),
    // 中间电子传播子
    edge("vb", "vt", type: "fermion", momentum: $q$),
  ),
)

// 右图：横着的那张
#let diag_right = feynman(
  orientation: "horizontal",
  length: L,
  (
    // 外腿
    vertex("lb", label: $e^-$), // 左下：电子
    vertex("lt"), // 左上：光子
    vertex("rt", label: $e^-$), // 右上：电子
    vertex("rb"), // 右下：光子
    // 两个顶点
    vertex("vl", shape: "dot", label: $alpha$),
    vertex("vr", shape: "dot", label: $alpha$),
    // 左边入射
    edge("lt", "vl", type: "photon", momentum: $p_2$),
    edge("lb", "vl", type: "fermion", momentum: $p_1$),
    // 中间电子传播子
    edge("vl", "vr", type: "fermion", momentum: $q$),
    // 右边出射
    edge("vr", "rt", type: "fermion", momentum: $p_4$),
    edge("vr", "rb", type: "photon", momentum: $p_3$),
  ),
)

#grid(
  columns: 2,
  column-gutter: 1.5cm,
  [#diag_left], [#diag_right],
)
