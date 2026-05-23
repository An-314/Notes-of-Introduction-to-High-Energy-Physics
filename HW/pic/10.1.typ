#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#let L = 0.52cm

// (a) 右侧两条光子分别接在上、下两个顶点
#let diag_a = feynman(
  orientation: "vertical",
  length: L,
  (
    // 外腿
    vertex("in1"),
    vertex("in2"),
    vertex("out4"),
    vertex("out3"),
    // 内部顶点
    vertex("vt", shape: "dot"),
    vertex("vb", shape: "dot"),
    // 左边入射费米子
    edge("in2", "vt", type: "fermion", momentum: $p_2$),
    edge("in1", "vb", type: "fermion", momentum: $p_1$),
    // 中间内部费米子传播子
    edge("vb", "vt", type: "fermion", momentum: $q$),
    // 右边出射光子
    edge("vt", "out4", type: "photon", momentum: $p_4$),
    edge("vb", "out3", type: "photon", momentum: $p_3$),
  ),
)

// (b) 右侧两条光子交换连接顺序
#let diag_b = feynman(
  orientation: "vertical",
  length: L,
  (
    // 外腿
    vertex("in1"),
    vertex("in2"),
    vertex("out3"),
    vertex("out4"),
    // 内部顶点
    vertex("vt", shape: "dot"),
    vertex("vb", shape: "dot"),
    // 左边入射费米子
    edge("in2", "vt", type: "fermion", momentum: $p_2$),
    edge("in1", "vb", type: "fermion", momentum: $p_1$),
    // 中间内部费米子传播子
    edge("vb", "vt", type: "fermion", momentum: $q$),
    // 右边出射光子（交换）
    edge("vb", "out4", type: "photon", momentum: $p_4$),
    edge("vt", "out3", type: "photon", momentum: $p_3$),
  ),
)

#grid(
  columns: 2,
  column-gutter: 1.6cm,
  [
    #diag_a
  ],
  [
    #diag_b
  ],
)
