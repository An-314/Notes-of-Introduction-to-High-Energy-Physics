#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#grid(columns: (1fr, 1fr))[
  #feynman(length: 0.3cm, (
    vertex("e1", label: $d$),
    vertex("e2", label: $d$),
    vertex("v1", shape: "dot", label: $alpha$),
    vertex("v2", shape: "dot", label: $alpha$),
    vertex("e3", label: $u$),
    vertex("e4", label: $u$),
    edge("e1", "v1", type: "antifermion"),
    edge("e2", "v1", type: "fermion"),
    edge("v1", "v2", type: "photon", label: $gamma$),
    edge("v2", "e3", type: "fermion"),
    edge("v2", "e4", type: "antifermion"),
  ))
  - 只要粒子带电，就可以与光子耦合，因此不仅电子，其他夸克也一样可以画类似的 QED 顶角
  - 电磁顶角对单个Fermion的味道是守恒的
  - 光子不改变夸克的味道，只耦合到它们的电荷
][
  #feynman(length: 0.3cm, (
    vertex("e1", label: $mu^+$),
    vertex("e2", label: $gamma$),
    vertex("v1", shape: "dot", label: $alpha$),
    vertex("v2", shape: "dot", label: $alpha$),
    vertex("e3", label: $mu^+$),
    vertex("e4", label: $gamma$),
    edge("e1", "v1", type: "fermion"),
    edge("e2", "v1", type: "photon"),
    edge("v1", "v2", type: "fermion", label: $mu^+$),
    edge("v2", "e3", type: "fermion"),
    edge("v2", "e4", type: "photon"),
  ))
  - $mu$子、$tau$子也都可以和光子耦合，也都遵循QED顶角结构
]
