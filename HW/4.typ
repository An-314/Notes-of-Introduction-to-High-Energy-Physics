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
    - 可能，电荷、重子数和轻子数守恒
    - 涉及电磁相互作用：释放$gamma$
  - $Sigma^0 -> Lambda + pi^0$
    - $Sigma^0:u d s, Lambda:u d s, pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 不可能，能量-动量守恒不允许
    - $m_(Sigma^0) < m_(Lambda) + m_(pi^0)$
  - $Sigma^- -> n + pi^-$
    - $Sigma^-:d d s, n:u d d, pi^-:d macron(u)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及弱相互作用：$s -> u$转变
  - $e^+ + e^- -> mu^+ + mu^-$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及电磁相互作用：经虚光子
  - $mu^- -> e^- + macron(nu)_e$
    - 不可能，$mu$轻子数不守恒
  - $Delta^+ -> p + pi^0$
    - $Delta^+:u u d, p:u u d, pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及强相互作用：$q macron(q)$对产生
  - $macron(nu)_e + p -> n + e^+$
    - $p:u u d, n:u d d$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及弱相互作用：有中微子参与，$u -> d$转变
  - $e + p -> nu_e + pi^0$
    - 不可能，重子数不守恒
    - $B_i = 1, B_f = 0$
  - $p + p -> Sigma^+ + n + K^0 + pi^+ + pi^0$
    - $p:u u d, Sigma^+:u u s, n:u d d, K^0:d macron(s), pi^+:u macron(d), pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及强相互作用
  - $p -> e^+ + gamma$
    - 不可能，重子数不守恒
    - $B_i = 1, B_f = 0$
  - $p + p -> p + p + p + macron(p)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及强相互作用
  - $n + macron(n) -> pi^+ + pi^- + pi^0$
    - $n:u d d, macron(n):u macron(d) macron(d), pi^+:u macron(d), pi^-:d macron(u), pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及强相互作用
  - $pi^+ + n -> pi^- + p$
    - $pi^+:u macron(d), n:u d d, pi^-:d macron(u), p:u u d$
    - 不可能，电荷不守恒
    - $Q_i = 1, Q_f = 0$
  - $K^- -> pi^- + pi^0$
    - $K^-:s macron(u), pi^-:d macron(u), pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及弱相互作用：$s -> u$转变
  - $Sigma^+ + n -> Sigma^- + p$
    - $Sigma^+:u u s, n:u d d, Sigma^-:d d s, p:u u d$
    - 不可能，电荷不守恒
    - $Q_i = 1, Q_f = 0$
  - $Sigma^0 -> Lambda + gamma$
    - $Sigma^0:u d s, Lambda:u d s$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及电磁相互作用：释放$gamma$
  - $Xi^- -> Lambda + pi^-$
    - $Xi^-:d s s, Lambda:u d s, pi^-:d macron(u)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及弱相互作用：$s -> d$转变
  - $Xi^0 -> p + pi^-$
    - $Xi^0:u s s, p:u u d, pi^-:d macron(u)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及弱相互作用：$s -> d$转变
  - $pi^- + p -> Lambda + K^0$
    - $pi^-:d macron(u), p:u u d, Lambda:u d s, K^0:d macron(s)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及强相互作用
  - $pi^0 -> gamma + gamma$
    - $pi^0:(u macron(u) - d macron(d))/sqrt(2)$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及电磁相互作用：释放两个$gamma$
  - $Sigma^- -> n + e + macron(nu)_e$
    - $Sigma^-:d d s, n:u d d$
    - 可能，电荷、重子数和轻子数守恒
    - 涉及弱相互作用：$s -> u$转变，伴随一个电子和一个反电子中微子产生

  最终结果如下表
  #three-line-table[
    | 过程 | 可能/不可能 | 负责的相互作用/守恒定律 |
    | --- | --- | --- |
    | $p + macron(p) -> pi^+ + pi^0$ | 不可能 | 电荷不守恒 |
    | $eta -> gamma + gamma$ | 可能 | 电磁相互作用 |
    | $Sigma^0 -> Lambda + pi^0$ | 不可能 | 能量-动量守恒不允许 |
    | $Sigma^- -> n + pi^-$ | 可能 | 弱相互作用 |
    | $e^+ + e^- -> mu^+ + mu^-$ | 可能 | 电磁相互作用 |
    | $mu^- -> e^- + macron(nu)_e$ | 不可能 | $mu$轻子数不守恒 |
    | $Delta^+ -> p + pi^0$ | 可能 | 强相互作用 |
    | $macron(nu)_e + p -> n + e^+$ | 可能 | 弱相互作用 |
    | $e + p -> nu_e + pi^0$ | 不可能 | 重子数不守恒 |
    | $p + p -> Sigma^+ + n + K^0 + pi^+ + pi^0$ | 可能 | 强相互作用 |
    | $p -> e^+ + gamma$ | 不可能 | 重子数不守恒 |
    | $p + p -> p + p + p + macron(p)$ | 可能 | 强相互作用 |
    | $n + macron(n) -> pi^+ + pi^- + pi^0$ | 可能 | 强相互作用 |
    | $pi^+ + n -> pi^- + p$ | 不可能 | 电荷不守恒 |
    | $K^- -> pi^- + pi^0$ | 可能 | 弱相互作用 |
    | $Sigma^+ + n -> Sigma^- + p$ | 不可能 | 电荷不守恒 |
    | $Sigma^0 -> Lambda + gamma$ | 可能 | 电磁相互作用 |
    | $Xi^- -> Lambda + pi^-$ | 可能 | 弱相互作用 |
    | $Xi^0 -> p + pi^-$ | 可能 | 弱相互作用 |
    | $pi^- + p -> Lambda + K^0$ | 可能 | 强相互作用 |
    | $pi^0 -> gamma + gamma$ | 可能 | 电磁相互作用 |
    | $Sigma^- -> n + e + macron(nu)_e$ | 可能 | 弱相互作用 |
  ]
]

#exercise(subname: [2.8])[
  有些衰变涉及两种(或甚至三种)不同的力。对下列过程画出可能的Feynman图:

  + $
      mu -> e + e + e^- + nu_mu + macron(nu)_e
    $
  + $
      Sigma^+ -> p + gamma
    $
  它们涉及了什么相互作用？(顺便说一下，这两个衰变都被观测到了)
]

#solution[
  + $mu -> e + e + e^- + nu_mu + macron(nu)_e$
    - 其中可能是$mu -> W^- + nu_mu$，之后$W^-$衰变成$e^- + macron(nu)_e$，同时伴随一个虚拟的$gamma$产生一个$e^+ e^-$对。这个过程涉及弱相互作用和电磁相互作用。
    #feynman(
      layout: "layered",
      length: 0.4cm,
      (
        vertex("i", label: $mu$),
        vertex("v1"),
        vertex("v2"),
        vertex("v3"),
        vertex("v4"),
        vertex("f1", label: $nu_mu$),
        vertex("f2", label: $e^+$),
        vertex("f3", label: $e^-$),
        vertex("f4", label: $e^-$),
        vertex("f5", label: $macron(nu)_e$),
        edge("i", "v1", type: "fermion"),
        edge("v1", "f1", type: "fermion"),
        edge("v1", "v2", type: "charged-scalar", label: $W$),
        edge("v2", "v3", type: "photon", label: $gamma$),
        edge("v3", "f2", type: "antifermion"),
        edge("v3", "f3", type: "fermion"),
        edge("v2", "v4", type: "charged-scalar", label: $W$),
        edge("v4", "f4", type: "fermion"),
        edge("v4", "f5", type: "antifermion"),
      ),
    )
  + $Sigma^+ -> p + gamma$
    - 其中$Sigma^+: u u s, p:u u d$
    - 可能的图是$Sigma^+$的$s$夸克通过一个虚拟的$W^+$转变成一个$u$夸克，之后再通过一个虚拟的$W^-$转变成一个$d$夸克，同时释放一个$gamma$。这个过程涉及弱相互作用和电磁相互作用。
    #feynman(
      length: 0.4cm,
      (
        vertex("i", label: $s$),
        vertex("v1"),
        vertex("v3"),
        vertex("v2"),
        vertex("o1", label: $gamma$),
        vertex("o2", label: $d$),
        edge("i", "v1", type: "fermion"),
        edge("v1", "v2", type: "fermion", label: $u$),
        edge("v1", "v3", type: "charged-scalar", label: $W$),
        edge("v3", "v2", type: "charged-scalar"),
        edge("v3", "o1", type: "photon"),
        edge("v2", "o2", type: "fermion"),
      ),
    )

]

#exercise(subname: [2.12])[
  $W^-$是1983年在CERN利用质子/反质子散射时被发现的 :
  $
    p + macron(p) -> W^- + X
  $
  其中$X$代表一个或多个粒子。对这个过程最可能的$X$是什么？画出你的反应的Feynman图，解释为什么你的$X$比其他的更可能。
]

#solution[

  $p$中的$u,d$和$macron(p)$中的$macron(u), macron(d)$进行作用，其中另外的$u$和$macron(u)$旁观。

  $d$通过一个$W^-$转变成一个$u$，同时释放一个$W^-$。这个$W^-$是我们要寻找的粒子。之后，$u$和$macron(u)$通过一个虚拟的$g$相互作用，这个虚$g$与$macron(d)$相互作用，产生一个$macron(d)$。

  这个$u macron(d)$就是我们寻找的$X$，也就是$pi^+$。

  #feynman(
    layout: "layered",
    // layout: "tree",
    length: 0.4cm,
    (
      vertex("i2", label: $d$),
      vertex("v2"),
      vertex("o1", label: $W^-$),
      vertex("o2", label: $u$),
      edge("i2", "v2", type: "fermion"),
      edge("v2", "o1", type: "charged-scalar"),
      edge("v2", "o2", type: "fermion"),
    ),
  )
  #feynman(
    layout: "layered",
    // layout: "tree",
    length: 0.4cm,
    (
      vertex("i1", label: $u$),
      vertex("i3", label: $macron(u)$),
      vertex("i4", label: $macron(d)$),
      vertex("v1"),
      vertex("v3"),
      vertex("o3", label: $macron(d)$),
      edge("i1", "v1", type: "fermion"),
      edge("i3", "v1", type: "antifermion"),
      edge("i4", "v3", type: "antifermion"),
      edge("v1", "v3", type: "gluon"),
      edge("v3", "o3", type: "antifermion"),
    ),
  )

  可能性比较大的原因是只有一个弱顶点，并且通过虚胶子交换，OZI规则允许。
]
