#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let L = 0.48cm

// 左图：s-channel
#let diag_s = feynman(
  orientation: "vertical",
  length: L,
  (
    // 外腿
    vertex("tl", label: $e^+$),
    vertex("tr", label: $e^+$),
    vertex("br", label: $e^-$),
    vertex("bl", label: $e^-$),
    // 两个顶点
    vertex("vt", shape: "dot", label: $alpha$),
    vertex("vb", shape: "dot", label: $alpha$),
    // 上方正电子
    edge("tl", "vt", type: "antifermion", momentum: $p_2$),
    edge("vt", "tr", type: "antifermion", momentum: $p_4$),
    // 下方电子
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "br", type: "fermion", momentum: $p_3$),
    // 中间光子
    edge("vb", "vt", type: "photon", label: $gamma$),
  ),
)

// 右图：t-channel
#let diag_t = feynman(
  orientation: "horizontal",
  length: L,
  (
    // 外腿
    vertex("lb", label: $e^-$),
    vertex("lt", label: $e^+$),
    vertex("rt", label: $e^+$),
    vertex("rb", label: $e^-$),
    // 两个顶点
    vertex("vl", shape: "dot", label: $alpha$),
    vertex("vr", shape: "dot", label: $alpha$),
    // 左边入射
    edge("lt", "vl", type: "antifermion", momentum: $p_2$),
    edge("lb", "vl", type: "fermion", momentum: $p_1$),
    // 右边出射
    edge("vr", "rt", type: "antifermion", momentum: $p_4$),
    edge("vr", "rb", type: "fermion", momentum: $p_3$),
    // 中间光子
    edge("vl", "vr", type: "photon", label: $gamma$),
  ),
)

#grid(
  columns: 2,
  column-gutter: 1.4cm,
  [#diag_s], [#diag_t],
)
