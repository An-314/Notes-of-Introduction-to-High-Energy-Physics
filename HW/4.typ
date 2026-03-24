#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第四次作业],
  author: "Anzreww",
  time: "2026年3月",
)

#exercise(subname: [2.6])[
  画出对
  $
    e^+ + e^- -> W^+ + W^-
  $
  过程有贡献的所有最低阶图。(一个涉及$Z$到$W$的直  接耦合，另一个涉及$gamma$到$W$的耦合，因此当LEP(在CERN的电子-正电子对撞机)达到足够的能量去产生两个$W$时，1996 年，这些例外的过程就能被实验所研究了。见 B. Schwarzschild, Physics Today(September 1996), p21)
]

#solution[
  考虑二阶图，有两个顶点：
  - 如果$e^-, e^+$在同一个顶点，那么它们必须通过一个$Z$或$gamma$连接到另一个顶点，产生一对$W$
  - 如果$e^-, e^+$在不同的顶点，定点要求他们由一个虚拟的$nu_e$连接，在每个顶点上分别产生一个$W$
  因此有三个图：
  #stack(dir: ltr)[
    #feynman(
      orientation: "vertical",
      length: 0.4cm,
      (
        vertex("e1", label: $e^+$),
        vertex("e2", label: $e^-$),
        vertex("v1"),
        vertex("v2"),
        vertex("w1", label: $W^+$),
        vertex("w2", label: $W^-$),
        edge("e1", "v1", type: "antifermion"),
        edge("e2", "v2", type: "fermion"),
        edge("v2", "v1", type: "fermion"),
        edge("v1", "w1", type: "anti-charged-scalar"),
        edge("v2", "w2", type: "charged-scalar"),
      ),
    )
  ][
    #feynman(
      length: 0.4cm,
      (
        vertex("e1", label: $e^+$),
        vertex("e2", label: $e^-$),
        vertex("v1"),
        vertex("v2"),
        vertex("w1", label: $W^+$),
        vertex("w2", label: $W^-$),
        edge("e1", "v1", type: "antifermion"),
        edge("e2", "v1", type: "fermion"),
        edge("v1", "v2", type: "scalar", label: $Z$),
        edge("v2", "w1", type: "anti-charged-scalar"),
        edge("v2", "w2", type: "charged-scalar"),
      ),
    )
  ][
    #feynman(
      length: 0.4cm,
      (
        vertex("e1", label: $e^+$),
        vertex("e2", label: $e^-$),
        vertex("v1"),
        vertex("v2"),
        vertex("w1", label: $W^+$),
        vertex("w2", label: $W^-$),
        edge("e1", "v1", type: "antifermion"),
        edge("e2", "v1", type: "fermion"),
        edge("v1", "v2", type: "photon", label: $gamma$),
        edge("v2", "w1", type: "anti-charged-scalar"),
        edge("v2", "w2", type: "charged-scalar"),
      ),
    )
  ]
]

#exercise(subname: [2.7])[
  检验如下过程，对每一个按标准模型(不包括大统一及其可能的轻子数和重子数守恒的破坏)说明它是否是可能或不可能的。

  对前者，说明所负责的相互作用——强、电磁或弱；对后者，引用禁戒它发生的守恒定律。(按照通常的习惯，当无含混时我将不会指明电荷，因此$gamma, Lambda$和$n$是中性的，$p$是正的，$e$是负的，等等)
  - $p + macron(p) -> pi^+ + pi^0$
  - $eta -> gamma + gamma$
  - $Sigma^0 -> Lambda + pi^0$
  - $Sigma^- -> n + pi^-$
  - $e^+ + e^- -> mu^+ + mu^-$
  - $mu^- -> e^- + macron(nu)_e$
  - $Delta^+ -> p + pi^0$
  - $macron(nu)_e + p -> n + e^+$
  - $e + p -> nu_e + pi^0$
  - $p + p -> Sigma^+ + n + K^0 + pi^+ + pi^0$
  - $p -> e^+ + gamma$
  - $p + p -> p + p + p + macron(p)$
  - $n + macron(n) -> pi^+ + pi^- + pi^0$
  - $pi^+ + n -> pi^- + p$
  - $K^- -> pi^- + pi^0$
  - $Sigma^+ + n -> Sigma^- + p$
  - $Sigma^0 -> Lambda + gamma$
  - $Xi^- -> Lambda + pi^-$
  - $Xi^0 -> p + pi^-$
  - $pi^- + p -> Lambda + K^0$
  - $pi^0 -> gamma + gamma$
  - $Sigma^- -> n + e + macron(nu)_e$
]

#solution[
  - $p + macron(p) -> pi^+ + pi^0$
    - 不可能，电荷不守恒
  - $eta -> gamma + gamma$
    - 可能，电荷、强子数和轻子数守恒
    - 涉及电磁相互作用：释放$gamma$
  - $Sigma^0 -> Lambda + pi^0$
    - $Sigma^0:u d s, Lambda:u d s, pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 不可能，能量-动量守恒不允许
    - $m_(Sigma^0) < m_(Lambda) + m_(pi^0)$
  - $Sigma^- -> n + pi^-$
    - $Sigma^-:d d s, n:u d d, pi^-:d macron(u)$
    - 可能，电荷、强子数和轻子数守恒
    - 涉及弱相互作用：$s -> u$转变
  - $e^+ + e^- -> mu^+ + mu^-$
    - 可能，电荷、强子数和轻子数守恒
    - 涉及电磁相互作用：经虚光子
  - $mu^- -> e^- + macron(nu)_e$
    - 不可能，$mu$轻子数不守恒
  - $Delta^+ -> p + pi^0$
    - $Delta^+:u u d, p:u u d, pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 可能，电荷、强子数和轻子数守恒
    - 涉及强相互作用：$q macron(q)$对产生
  - $macron(nu)_e + p -> n + e^+$
    - $p:u u d, n:u d d$
    - 可能，电荷、强子数和轻子数守恒
    - 涉及弱相互作用：有中微子参与，$u -> d$转变
  - $e + p -> nu_e + pi^0$
]

#exercise(subname: [2.8])[
  有些衰变涉及两种(或甚至三种)不同的力。对下列过程画出可能的Feynman图:

  + $
      mu -> e + e + e^- + nu_mu + macron(nu)_e
    $
  + $
      Sigma^+ -> p + gamma
    $
  它们涉及了什冬相互作用？(顺便说一下，这两个衰变都被观测到了)
]

#exercise(subname: [2.12])[
  $W^-$是1983年在CERN利用质子/反质子散射时被发现的 :
  $
    p + macron(p) -> W^- + X
  $
  其中$X$代表一个或多个粒子。对这个过程最可能的$X$是什么？画出你的反应的Feynman图，解释为什么你的$X$比其他的更可能。
]
