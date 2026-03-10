#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [高能物理导论],
  info: [第二次作业],
  author: "Anzreww",
  time: "2026年3月",
)

#show figure: set block(breakable: true)

#exercise(subname: [1.4])[
  Gell-Mann-Okubo质量公式将重子八重态成员的质量相互联 系起来（忽略$p$和$n$；$Sigma^+$, $Sigma^0$和$Sigma^-$；$Xi^0$和$Xi^-$的小质量差）：
  $
    2(m_N + m_Xi) = 3 m_Lambda + m_Sigma
  $
  利用这个公式，结合一个核子$N$的质量（利用$p$和$n$的平均），$Sigma$（同样，用平均），还有$Xi$（同前），“预言”$Lambda$的质量。你得到的距离观测值有多近？
]

#solution[
  $
    m_Lambda = 1/3 (2(m_N + m_Xi) - m_Sigma)
  $
  其中$m_N = 938.9 "MeV"\/c^2$，$m_Sigma = 1190.5 "MeV"\/c^2$，$m_Xi = 1318.1 "MeV"\/c^2$。将这些数值代入上式，得到
  $
    m_Lambda = 1/3 (2(938.9 + 1318.1) - 1190.5) "MeV"\/c^2 = 1107.8 "MeV"\/c^2
  $
  测量值是$m_Lambda = 1115.7 "MeV"\/c^2$，所以预言与观测值相差约$7.9 "MeV"\/c^2$，相对误差约为$0.7 %$。
]

#exercise(subname: [1.5])[
  同样的公式用于介子（把$Sigma -> pi$，$Lambda -> eta$，等等），除了在这个情形下，由于保持某些秘密的原因，你必须改用质量的平方。利用它 “预言”$eta$的质量。你得到的结果有多靠近？
]

#solution[
  新的公式是
  $
    2(m_K^2 + m_K^2) = 3 m_eta^2 + m_pi^2
  $
  则有
  $
    m_eta^2 = 1/3 (4 m_K^2 - m_pi^2)
  $
  其中$m_K = 493.67 "MeV"\/c^2$，$m_pi = 135.04 "MeV"\/c^2$。将这些数值代入上式，得到
  $
    m_eta = sqrt(1/3 (4 times 493.67^2 - 135.04^2)) "MeV"\/c^2 = 566.8 "MeV"\/c^2
  $
  测量值是$m_eta = 547.3 "MeV"\/c^2$，所以预言与观测值相差约$19.5 "MeV"\/c^2$，相对误差约为$3.5 %$。
]

#exercise(subname: [1.6])[
  对十重态质量公式相当简单——列间隔相等：
  $
    m_Delta - m_(Sigma^*) = m_(Sigma^*) - m_(Xi^*) = m_(Xi^*) - m_Omega
  $
  利用这个公式（就像Gell-Mann做的那样）预言$Omega^-$的质量。（利用头两个间隔的平均估计第三个）你的预言与观测值有多靠近？
]

#solution[
  有质量差
  $
    m_Delta - m_(Sigma^*) = 1232 - 1385 = -153 "MeV"\/c^2
  $
  $
    m_(Sigma^*) - m_(Xi^*) = 1385 - 1533 = -148 "MeV"\/c^2
  $
  得到
  $
    m_Omega = m_(Xi^*) + (153 + 148)/2 "MeV"\/c^2 = 1533 + 150.5 "MeV"\/c^2 = 1684 "MeV"\/c^2
  $
  测量值是$m_Omega = 1672 "MeV"\/c^2$，所以预言与观测值相差约$12 "MeV"\/c^2$，相对误差约为$0.7 %$。
]

#exercise(subname: [1.8])[
  + 分析$Omega^-$的可能衰变模式，就像你对$Delta$、$Sigma^*$和$Xi^*$所做的那样。发现问题了吗？Gell-Mann预言$Omega^-$将是“亚稳定的”（即，远比十重态其他成员生存期更长）精确地是这个原因。（$Omega^-$确实会衰变，但是由于非常慢的弱作用，它的奇异数不守恒）
  + 从气泡云室照片（见 @omega-decay ），测量$Omega^-$的径迹长度，利用它估算$Omega^-$的寿命。（当然，你不知道它飞行多快，但速度小于光速是一个安全的赌博；假如我们说它是$0.1c$。还有，你不知道再生是放大还是缩小了标度，但不要紧：这些吹毛求疵就是一个因子$2$或$5$，或可能$10$。重要之处是寿命乃很多量级长过所有十重态成员的特征寿命$10^(-23)$s）
]

#figure(
  image("pic/2026-03-10-11-44-24.png", width: 80%),
  caption: [$Lambda^-$发现的气泡云室径迹线图],
)<omega-decay>

#solution[
  + 所有重子八重态有
    #figure(
      three-line-table[
        | Particle | quark content | $Q$ | $S$ |
        | --- | --- | --- | --- |
        | $p$ | $u u d$ | $+1$ | $0$ |
        | $n$ | $u d d$ | $0$ | $0$ |
        | $Lambda$ | $u d s$ | $0$ | $-1$ |
        | $Sigma^+$ | $u u s$ | $+1$ | $-1$ |
        | $Sigma^0$ | $u d s$ | $0$ | $-1$ |
        | $Sigma^-$ | $d d s$ | $-1$ | $-1$ |
        | $Xi^0$ | $u s s$ | $0$ | $-2$ |
        | $Xi^-$ | $d s s$ | $-1$ | $-2$ |
      ],
      caption: [重子八重态成员的量子数],
    )
    所有介子八重态有
    #figure(
      three-line-table[
        | Particle | quark content | $Q$ | $S$ |
        | --- | --- | --- | --- |
        | $pi^+$ | $u macron(d)$ | $+1$ | $0$ |
        | $pi^0$ | $(u macron(u) - d macron(d))/sqrt(2)$ | $0$ | $0$ |
        | $pi^-$ | $d macron(u)$ | $-1$ | $0$ |
        | $K^+$ | $u macron(s)$ | $+1$ | $-1$ |
        | $K^0$ | $d macron(s)$ | $0$ | $-1$ |
        | $macron(K^0)$ | $s macron(d)$ | $0$ | $+1$ |
        | $K^-$ | $s macron(u)$ | $-1$ | $+1$ |
        | $eta$ | $(u macron(u) + d macron(d) - 2 s macron(s))/sqrt(6)$ | $0$ | $0$ |
      ],
      caption: [介子八重态成员的量子数],
    )
    $omega^-$的量子数是$Q = -1$和$S = -3$，考虑它衰变成：一个轻重子（来自重子八重态），一个介子（来自赝标介子八重态）
    - 若末态重子$S=0$，$p,n$
      - 介子需要$S=-3$，没有这样的介子
    - 若末态重子$S=-1$，$Lambda, Sigma^0, Sigma^+, Sigma^-$
      - 介子需要$S=-2$，没有这样的介子
    - 若末态重子$S=-2$，$Xi^0, Xi^-$
      - 介子需要$S=-1$，有$K^-$和$macron(K^0)$两种选择
    根据$Q$守恒得到量子数允许的强衰变模式只有两种
    $
      Omega^- -> Xi^0 + K^-
    $
    $
      Omega^- -> Xi^- + macron(K^0)
    $
    现在继续分析$Xi^0$和$Xi^-$的衰变模式的质量阈值
    #figure(
      three-line-table[
        | Particle | $Omega^-$ | $Xi^0$ | $Xi^-$ | $K^-$ | $macron(K^0)$ |
        | --- | --- | --- | --- | --- | --- |
        | Mass (MeV/$c^2$) | 1672 | 1315 | 1322 | 494 | 498 |
      ],
      caption: [相关粒子的质量],
    )
    - $Omega^- -> Xi^0 + K^-$的质量阈值是$1315 + 494 = 1809 "MeV"\/c^2$，高于$Omega^-$的质量，所以这个衰变模式被禁止
    - $Omega^- -> Xi^- + macron(K^0)$的质量阈值是$1322 + 498 = 1820 "MeV"\/c^2$，同样高于$Omega^-$的质量，所以这个衰变模式也被禁止
    从而$Omega^-$没有强衰变模式，必须通过弱作用衰变，这就是它的寿命远长于十重态其他成员的原因。

  + $Omega^-$的轨迹非常短，大约是cm量级，不妨取$1$cm。假设它的速度是$0.1c$，则它的寿命
    $
      tau = L / v = (1 "cm") / (0.1 times 3 times 10^10 "cm/s") = 3.3 times 10^(-10) "s"
    $
    实际上
    $
      tau_(Omega^-) = 0.8 times 10^(-10) "s"
    $
    这个估算与实际值在同一个数量级，说明$Omega^-$的寿命确实远长于十重态其他成员的特征寿命$10^(-23)$s。
]

#exercise(subname: [1.12])[
  分别用1、2、3、4、5或6种不同的夸克味道，你可以构造多少种不同的介子组合？对$n$味的一般公式是什么？
]

#solution[
  每个介子由一个夸克和一个反夸克组成。

  对于$n$种不同的夸克味道，可以选择一个夸克和一个反夸克来构成一个介子。从而有$n$种选择夸克和$n$种选择反夸克的方式，总共有$n^2$种不同的介子组合。

  所以，对$n$味的介子组合数为：
  - $n = 1$: $1^2 = 1$种
  - $n = 2$: $2^2 = 4$种
  - $n = 3$: $3^2 = 9$种
  - $n = 4$: $4^2 = 16$种
  - $n = 5$: $5^2 = 25$种
  - $n = 6$: $6^2 = 36$种
]

#exercise(subname: [1.13])[
  分别用1、2、3、4、5或6种不同的夸克味道，你可以构造多少种不同的重子组合？对$n$味的一般公式是什么？
]

#solution[
  每个重子由三个夸克组成。

  对于$n$种不同的夸克味道，可以选择三个夸克来构成一个重子。由于重子中的夸克是不可区分的，需要计算组合数。

  从$n$种不同的夸克中选择3个（允许重复）来构成一个重子：
  $
    binom(n, 1) + 2 times binom(n, 2) + binom(n, 3) = binom(n + 1, 2) + binom(n + 1, 3) = binom(n + 2, 3) = ((n + 2)(n + 1)n) / 6
  $
  所以，对$n$味的重子组合数为：
  - $n = 1$: $binom(3, 3) = 1$种
  - $n = 2$: $binom(4, 3) = 4$种
  - $n = 3$: $binom(5, 3) = 10$种
  - $n = 4$: $binom(6, 3) = 20$种
  - $n = 5$: $binom(7, 3) = 35$种
  - $n = 6$: $binom(8, 3) = 56$种
]

#exercise(subname: [1.14], lab: "1.14")[
  利用四夸克($u$、$d$、$s$和$c$)，构造一个所有可能的重子种类表。有多少种携带粲数$+1$的组合？又有多少种携带粲数$+2$，还有$+3$？
]

#solution[
  使用四种夸克$u$、$d$、$s$和$c$，我们可以构造的重子组合数为：
  $
    binom(6, 3) = 20
  $
  其中
  - 没有携带粲数的组合有$binom(5, 3) = 10$种
    - $u u u$, $u u d$, $u u s$, $u d d$, $u d s$, $u s s$, $d d d$, $d d s$, $d s s$, $s s s$
  - 携带粲数$+1$的组合有$binom(4, 2) = 6$种
    - $u u underline(c)$, $u d underline(c)$, $u s underline(c)$, $d d underline(c)$, $d s underline(c)$, $s s underline(c)$
  - 携带粲数$+2$的组合有$binom(3, 1) = 3$种
    - $u underline(c) underline(c)$, $d underline(c) underline(c)$, $s underline(c) underline(c)$
  - 携带粲数$+3$的组合有$binom(3, 0) = 1$种
    - $underline(c) underline(c) underline(c)$
]

#exercise(subname: [1.15])[
  与 @1.14 同样的问题，这次是对介子。
]

#solution[
  使用四种夸克$u$、$d$、$s$和$c$，我们可以构造的介子组合数为：
  $
    n^2 = 4^2 = 16
  $
  其中
  - 携带粲数$0$的组合有$3^2 + 1 = 10$种
    - $u macron(u)$, $u macron(d)$, $u macron(s)$, $d macron(u)$, $d macron(d)$, $d macron(s)$, $s macron(u)$, $s macron(d)$, $s macron(s)$
    - $underline(c) macron(underline(c))$
  - 携带粲数$+1$的组合有$3$种
    - $u macron(underline(c))$, $d macron(underline(c))$, $s macron(underline(c))$
  - 携带粲数$-1$的组合有$3$种
    - $underline(c) macron(u)$, $underline(c) macron(d)$, $underline(c) macron(s)$
]

#exercise(subname: [1.16])[
  假定顶夸克太短寿无法形成束缚态（“真” 介子和重子），请列出15种明显的$q macron(q)$介子组合（不计反粒子）的介子和35种明显的$q q q$重子组合。从粒子物理手册和/或其他来源，确定哪些已经被实验所发现了。给出它们的名字、质量和发现年代（每种情形只考虑最轻的）。例如，一个重子应该是
  - $s s s: Omega^-$，$1672.3 "MeV"\/c^2$，1964
  所有强子都可能是这50种夸克组合的各种激发。
]

#solution[
  #figure(
    three-line-table[
      | Quark content $q macron(q)$ | Meson | Mass (MeV/$c^2$) | Year | Experiment / Discoverers |
      |---|---|---|---|---|
      | $u macron(u)$ | $pi^0$ | 134.98 | 1950 | Powell group (cosmic-ray emulsions) |
      | $u macron(d)$ | $pi^+$ | 139.57 | 1947 | Powell–Occhialini–Lattes |
      | $u macron(s)$ | $K^+$ | 493.68 | 1947 | Rochester & Butler |
      | $u macron(c)$ | $D^0$ | 1864.8 | 1976 | Mark I (SLAC) |
      | $u macron(b)$ | $B^+$ | 5279.3 | 1983 | CLEO |
      | $d macron(d)$ | $pi^0$ | 134.98 | 1950 | Powell group |
      | $d macron(s)$ | $K^0$ | 497.61 | 1947 | Rochester & Butler |
      | $d macron(c)$ | $D^+$ | 1869.7 | 1976 | Mark I (SLAC) |
      | $d macron(b)$ | $B^0$ | 5279.6 | 1983 | CLEO |
      | $s macron(s)$ | $eta, phi(1020)$ | 1019.46 | 1962 | Brookhaven bubble chamber |
      | $s macron(c)$ | $D_s^+$ | 1968.3 | 1983 | CLEO |
      | $s macron(b)$ | $B_s^0$ | 5366.9 | 1987 | UA1 (CERN) |
      | $c macron(c)$ | $eta_c (1S)$ | 2983.9 | 1980 | Crystal Ball (SLAC) |
      | $c macron(b)$ | $B_c^+$ | 6274.5 | 1998 | CDF (Fermilab) |
      | $b macron(b)$ | $Upsilon(1S), eta_b (1S)$ | 9398.7 | 2008 | Bamacron |
    ],
    caption: [15种明显的介子组合],
  )

  #figure(
    three-line-table[
      | Quark content $q q q$ | Baryon | Mass (MeV/$c^2$) | Year | Experiment / Discoverers |
      |---|---|---|---|---|
      | $u u u$ | $Delta^(++)$ | 1232 | 1955 | Berkeley bubble chamber |
      | $u u d$ | $p$ | 938.27 | 1919 | Rutherford |
      | $u u s$ | $Sigma^+$ | 1189.4 | 1950 | cosmic-ray experiments |
      | $u d d$ | $n$ | 939.57 | 1932 | Chadwick |
      | $u d s$ | $Lambda^0$ | 1115.7 | 1950 | Brookhaven bubble chamber |
      | $u s s$ | $Xi^0$ | 1314.9 | 1959 | bubble chamber |
      | $d d d$ | $Delta^-$ | 1232 | 1955 | Berkeley |
      | $d d s$ | $Sigma^-$ | 1197.4 | 1950 | cosmic rays |
      | $d s s$ | $Xi^-$ | 1321.7 | 1952 | cosmic rays |
      | $s s s$ | $Omega^-$ | 1672.3 | 1964 | Brookhaven (Barnes et al.) |
      | $u u c$ | $Sigma_c^(++)$ | 2454 | 1976 | SLAC |
      | $u d c$ | $Lambda_c^+$ | 2286.5 | 1975 | SLAC (SPEAR) |
      | $u s c$ | $Xi_c^+$ | 2468 | 1983 | CLEO |
      | $d d c$ | $Sigma_c^0$ | 2453.7 | 1976 | SLAC |
      | $d s c$ | $Xi_c^0$ | 2471 | 1989 | ARGUS |
      | $s s c$ | $Omega_c^0$ | 2695 | 1985 | CERN WA62 |
      | $u c c$ | $Xi_(c c)^(++)$ | 3621 | 2017 | LHCb |
      | $d c c$ | $Xi_(c c)^(+)$ | not observed  | not observed | not observed  |
      | $s c c$ | $Omega_(c c)^(+)$ | not observed  | not observed | not observed  |
      | $c c c$ | $Omega_(c c c)^(++)$ | not observed  | not observed | not observed  |
      | $u u b$ | $Sigma_b^+$ | 5808 | 2006 | CDF |
      | $u d b$ | $Lambda_b^0$ | 5619.6 | 1991 | UA1 |
      | $u s b$ | $Xi_b^0$ | 5792 | 2011 | CDF |
      | $d d b$ | $Sigma_b^-$ | 5816 | 2006 | CDF |
      | $d s b$ | $Xi_b^-$ | 5797 | 2007 | D0 |
      | $s s b$ | $Omega_b^-$ | 6046 | 2009 | D0 |
      | $u b b$ | $Xi_(b b)^0$ | not observed  | not observed | not observed  |
      | $d b b$ | $Xi_(b b)^-$ | not observed  | not observed | not observed  |
      | $s b b$ | $Omega_(b b)^-$ | not observed  | not observed | not observed  |
      | $b b b$ | $Omega_(b b b)^-$ | not observed  | not observed | not observed  |
      | $u c b$ | $Xi_(c b)^+$ | not observed  | not observed | not observed  |
      | $d c b$ | $Xi_(c b)^0$ | not observed  | not observed | not observed  |
      | $s c b$ | $Omega_(c b)^0$ | not observed  | not observed | not observed  |
      | $c c b$ | $Omega_(c c b)^+$ | not observed  | not observed | not observed  |
      | $c b b$ | $Omega_(c b b)^0$ | not observed  | not observed | not observed  |
    ],
    caption: [35种明显的重子组合],
  )

  粒子质量与发现信息主要参考 Particle Data Group (PDG)：https://pdg.lbl.gov
]
