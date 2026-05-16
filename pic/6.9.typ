#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.42cm,
  (
    // 外腿
    vertex("tR", label: $B$),
    vertex("tL", label: $A$),
    vertex("bL", label: $A$),
    vertex("bR", label: $B$),
    // 上下两个三点顶角
    vertex("vt"),
    vertex("vb"),
    // 上下外腿
    edge("vt", "tR", momentum: $p_4$),
    edge("tL", "vt", momentum: $p_2$),
    edge("bL", "vb", momentum: $p_1$),
    edge("vb", "bR", momentum: $p_3$),
    // 上方传播子 C
    edge("mR", "vt", label: $C$, momentum: $q_4$),
    // 中间 loop / bubble
    loop(
      (vertex("mL", label: $A$), (type: "fermion", momentum: $q_2$)),
      (vertex("mR", label: $B$), (type: "fermion", momentum: $q_3$)),
    ),
    // 下方传播子 C
    edge("vb", "mL", label: $C$, momentum: $q_1$),
  ),
)
