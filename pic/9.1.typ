#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.52cm,
  (
    // 四条外腿
    vertex("tl", label: $nu_mu$),
    vertex("tr", label: $mu$),
    vertex("br", label: $nu_e$),
    vertex("bl", label: $e$),
    // 两个相互作用顶点
    vertex("vt", shape: "dot"),
    vertex("vb", shape: "dot"),
    // 上方外腿
    edge("tl", "vt", type: "fermion", momentum: $p_2$),
    edge("vt", "tr", type: "fermion", momentum: $p_4$),
    // 下方外腿
    edge("bl", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "br", type: "fermion", momentum: $p_3$),
    // 中间 W 传播子
    edge("vb", "vt", type: "scalar", label: $W$, momentum: $q$),
  ),
)
