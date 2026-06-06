#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#feynman(
  orientation: "vertical",
  length: 0.52cm,
  (
    // 外腿
    vertex("muin", label: $mu$),
    vertex("numu", label: $nu_mu$),
    vertex("nuebar", label: $macron(nu)_e$),
    vertex("eout", label: $e$),
    // 两个顶点
    vertex("vb", shape: "dot"),
    vertex("vt", shape: "dot"),
    // 下方：mu -> nu_mu + W
    edge("muin", "vb", type: "fermion", momentum: $p_1$),
    edge("vb", "numu", type: "fermion", momentum: $p_3$),
    // 中间 W
    // 这里用 photon 只是为了画波浪线样式
    edge("vb", "vt", type: "scalar", label: $W$, momentum: $q$),
    // 上方：W -> e + anti-nu_e
    edge("vt", "eout", type: "fermion", momentum: $p_4$),
    edge("vt", "nuebar", type: "antifermion", momentum: $p_2$),
  ),
)
