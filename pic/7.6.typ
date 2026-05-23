#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let L = 0.50cm

// 左图：树级图
#let diag_tree = feynman(
  orientation: "vertical",
  length: L,
  (
    // 外腿
    vertex("tl", label: $mu$),
    vertex("tr", label: $mu$),
    vertex("br", label: $e^-$),
    vertex("bl", label: $e^-$),
    // 两个顶点
    vertex("vt", shape: "dot", label: $alpha$),
    vertex("vb", shape: "dot", label: $alpha$),
    // 外线
    edge("tl", "vt", type: "fermion", momentum: $p_2$),
    edge("vt", "tr", type: "fermion", momentum: $p_4$),
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "br", type: "fermion", momentum: $p_3$),
    // 中间光子
    edge("vb", "vt", type: "photon", label: $gamma$, momentum: $q$),
  ),
)

// 右图：中间传播子上一圈修正
#let diag_loop = feynman(
  orientation: "vertical",
  length: L,
  (
    // 外腿
    vertex("tr", label: $mu$),
    vertex("tl", label: $mu$),
    vertex("br", label: $e^-$),
    vertex("bl", label: $e^-$),
    // 外部两个顶点
    vertex("vt", shape: "dot", label: $alpha$),
    vertex("vb", shape: "dot", label: $alpha$),
    // loop 上下两个连接点
    vertex("u", shape: "dot", label: $alpha$),
    vertex("d", shape: "dot", label: $alpha$),
    // 外线
    edge("tl", "vt", type: "fermion", momentum: $p_2$),
    edge("vt", "tr", type: "fermion", momentum: $p_4$),
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "br", type: "fermion", momentum: $p_3$),
    // 上下两段光子传播子
    edge("u", "vt", type: "photon", label: $gamma$, momentum: $q_4$),
    edge("vb", "d", type: "photon", label: $gamma$, momentum: $q_1$),
    // 中间 loop
    loop(
      (vertex("u"), (momentum: $q_2$)),
      (vertex("d"), (momentum: $q_3$)),
    ),
  ),
)

#grid(
  columns: 2,
  column-gutter: 1.6cm,
  [#diag_tree], [#diag_loop],
)
