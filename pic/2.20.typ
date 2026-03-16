#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  // layout: "layered",
  length: 0.5cm,
  (
    vertex("u1", label: $u$),
    vertex("d1", label: $d$),
    vertex("a", shape: "dot"),
    vertex("b", shape: "dot"),
    vertex("c", shape: "dot"),
    vertex("d", shape: "dot"),
    vertex("u2", label: $u$),
    vertex("d2", label: $d$),
    edge("u1", "a", type: "fermion"),
    edge("d1", "b", type: "fermion"),
    edge("a", "d", type: "fermion", label: $u$, label-anchor: "west", label-dist: 0.4cm),
    edge("b", "c", type: "antifermion", label: $macron(d)$, label-anchor: "east", label-dist: 0.4cm),
    edge("a", "c", type: "gluon"),
    edge("b", "d", type: "gluon"),
    edge("c", "d2", type: "fermion"),
    edge("d", "u2", type: "fermion"),
  ),
)

// #feynman(
//   layout: "layered",
//   orientation: "horizontal",
//   length: 0.5cm,
//   (
//     // 左侧六条外腿：u d u d d u
//     vertex("L1", label: $u$),
//     vertex("L2", label: $d$),
//     vertex("L3", label: $u$),
//     vertex("L4", label: $d$),
//     vertex("L5", label: $d$),
//     vertex("L6", label: $u$),

//     // 中间四个相互作用点
//     vertex("A1", shape: "dot"), // 左上
//     vertex("A2", shape: "dot"), // 左下
//     vertex("B1", shape: "dot"), // 右上
//     vertex("B2", shape: "dot"), // 右下

//     // 右侧六条外腿：u d d u d u
//     vertex("R1", label: $u$),
//     vertex("R2", label: $d$),
//     vertex("R3", label: $d$),
//     vertex("R4", label: $u$),
//     vertex("R5", label: $d$),
//     vertex("R6", label: $u$),

//     // 四条“直通”的夸克线
//     edge("L1", "R1", type: "fermion"),
//     edge("L2", "R2", type: "fermion"),
//     edge("L5", "R5", type: "fermion"),
//     edge("L6", "R6", type: "fermion"),

//     // 左边进入中间的两条夸克线
//     edge("L3", "A1", type: "fermion"),
//     edge("L4", "A2", type: "fermion"),

//     // 上下两条胶子束缚线
//     edge("A1", "B1", type: "gluon"),
//     edge("A2", "B2", type: "gluon"),

//     // 中间交叉的两条夸克线（对应 π+ 的 q qbar 图像）
//     edge("A1", "B2", type: "fermion"),
//     edge("A2", "B1", type: "fermion"),

//     // 右边流出
//     edge("B1", "R3", type: "fermion"),
//     edge("B2", "R4", type: "fermion"),
//   ),
// )
