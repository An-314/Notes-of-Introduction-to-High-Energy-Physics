#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let L = 0.48cm

// 左图：直接道
#let diag_left = feynman(
  orientation: "vertical",
  length: L,
  (
    // 四条外腿
    vertex("tl", label: $e^-$),
    vertex("tr", label: $e^-$),
    vertex("br", label: $e^-$),
    vertex("bl", label: $e^-$),
    // 两个顶点
    vertex("vt", shape: "dot", label: $alpha$),
    vertex("vb", shape: "dot", label: $alpha$),
    // 上面两条电子线
    edge("tl", "vt", type: "fermion", momentum: $p_2$),
    edge("vt", "tr", type: "fermion", momentum: $p_4$),
    // 下面两条电子线
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "br", type: "fermion", momentum: $p_3$),
    // 中间光子传播子
    edge("vb", "vt", type: "photon", label: $gamma$, momentum: $q$),
  ),
)

// 右图：交换道（末态交叉）
#let diag_right = feynman(
  orientation: "vertical",
  length: L,
  (
    // 四条外腿
    vertex("tl", label: $e^-$),
    vertex("tr", label: $e^-$),
    vertex("bl", label: $e^-$),
    vertex("br", label: $e^-$),
    // 两个顶点
    vertex("vt", shape: "dot", label: $alpha$),
    vertex("vb", shape: "dot", label: $alpha$),
    // 左边入射电子
    edge("tl", "vt", type: "fermion", momentum: $p_2$),
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    // 右边出射电子（交叉）
    edge("vb", "tr", type: "fermion", momentum: $p_4$),
    edge("vt", "br", type: "fermion", momentum: $p_3$),
    // 中间光子传播子
    edge("vb", "vt", type: "photon", label: $gamma$, momentum: $q$),
  ),
)

#grid(
  columns: 2,
  column-gutter: 1.2cm,
  [#diag_left], [#diag_right],
)
