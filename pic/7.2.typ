#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.48cm,
  (
    // 外腿
    vertex("tl", label: $mu$),
    vertex("tr", label: $mu$),
    vertex("br", label: $e^-$),
    vertex("bl", label: $e^-$),
    // 两个相互作用顶点
    vertex("vt", shape: "dot", label: $alpha$),
    vertex("vb", shape: "dot", label: $alpha$),
    // 上面两条外腿
    edge("tl", "vt", type: "fermion", momentum: $p_2$),
    edge("vt", "tr", type: "fermion", momentum: $p_4$),
    // 下面两条外腿
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "br", type: "fermion", momentum: $p_3$),
    // 中间光子传播子
    edge("vb", "vt", type: "photon", label: $gamma$, momentum: $q$),
  ),
)
