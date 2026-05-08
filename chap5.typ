#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/chemformula:0.1.2": ch
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show figure: set block(breakable: true)

#let t-r(it) = text(fill: red)[#it]
#let t-g(it) = text(fill: green)[#it]
#let t-b(it) = text(fill: blue)[#it]
#let t-r-inv(it) = text(fill: rgb(0%, 100%, 100%))[#it]
#let t-g-inv(it) = text(fill: rgb(100%, 0%, 100%))[#it]
#let t-b-inv(it) = text(fill: rgb(100%, 100%, 0%))[#it]

= 束缚态

== Schrödinger方程和氢原子

=== Schrödinger

低速情形下能动量关系
$
  E = p^2/(2m)
$
对应的Schrödinger方程
$
  i hbar pdv(psi, t) = - hbar^2/(2m) laplacian psi
$
在一个力场中，有相应的势能
$
  i hbar pdv(psi, t) = - hbar^2/(2m) laplacian psi + U(vb(r)) psi
$

=== 氢原子

*氢原子结构*
- 氢原子：电子和氢原子核的组合
  - 氢原子核：质子，$m=1$GeV，$Q=+1$，$s=1/2$
  - 核外电子：$m=0.5$MeV，$Q=-1$，$s=1/2$
- 主量子数$n=1, 2...$，轨道角动量$L=0,...,n-1$
- Schrödinger方程的解
  $
    E_n = -alpha^2 m c^2 1/(2n^2)
  $
  关于$l$简并
*精细结构*
- 相对论修正：动能
  $
    T = p^2/(2m) - p^4/(8m^3 c^2) + ...
  $
- 自旋轨道耦合
  $
    Delta E = -alpha^4 m c^2 1/(4 n^4) ((2n)/(j+1/2) - 3/2)
  $
  电子自旋，与轨道角动量；能级劈裂，和$j=l+s$有关系，$alpha^4$
*超精细结构*
- 核自旋
  $
    Delta E = m/m_p alpha^4 m c^2 gamma_p/(2 n^3) (plus.minus)/((f + 1/2)(1 + 1/2)), f = j plus.minus 1/2
  $
  能级劈裂，和$j$有关系，$alpha^4$和$m/(m_p)$压低

== 正电子偶素 positronium

*与氢原子能级结构的差异*
- 氢原子：质子$m=1$GeV，电子$m=0.5$MeV
- 它可以看成“氢原子”的类比体系，但不是电子绕重质子运动，而是一个电子和一个正电子形成的束缚态
- *Bhor能级减小*：电离能6.8eV
  $
    E_n = -alpha^2 m c^2 1/(4 n^2)
  $
- *精细结构和超精细结构在正电子偶素中同阶重要*
- 能级劈裂
  $
    Delta E = alpha^4 m c^2 1/(2n^3) (11/(32n) - (1+1/2 epsilon)/(2l + 1))
  $
  有新量子数$epsilon$，$epsilon = 0$为单态、$epsilon = 1$为三重态；电子和正电子都是自旋$1/2$，两个自旋耦合有两种可能：
  - 自旋反平行、总自旋$S=0$，称为单态，记作$""^1S_0$
  - 自旋平行、总自旋$S=1$，称为三重态，记作$""^3S_1$
  $
    n^(2s + 1)L_j
  $

== 夸克偶素 quarkonium

*夸克之间的势能形式*
- 电荷之间的势能
  $
    V(r) = - s/r
  $
  是Coulomb势，来自电荷之间的单光子交换
- 夸克之间的势能形式为
  $
    V(r) = - 4/3 alpha_s / r + k r
  $
  前一项像Coulomb势，来自短距离的单胶子交换；后一项是线性禁闭势，距离越大势能越高，所以夸克不能被单独拉出来。

  这就是强相互作用和电磁相互作用束缚态的本质差别：电磁势随距离变远趋于零，而强相互作用势在远距离继续增长。
*粲偶素结构（较重夸克，c，b） charmonium*
- 粲偶素：两个charm夸克的组合（$c macron(c)$）
- 谱线中常用记号：
  $
    ""^(2s + 1)L_j
  $
  出两个重要量子数：
  $
    P = (-1)^L P_A P_B
  $
  $
    C = (-1)^(L + S)
  $
- 所以不同的$L,S,J$会对应不同的$J^(P C)$。例如：
  - $""^1S_0 : J^(P C) = 0^(-+)$
  - $""^3S_1 : J^(P C) = 1^(--)$
  - 这就是为什么图中$eta_c$和$J\/ψ$虽然都属于$1S$态，但量子数不同、质量也不同。
  #figure(
    image("pic/5.1.png", width: 50%),
    caption: [粲偶素谱线],
  )
*底偶素质量谱结构*
- 底偶素：两个botttom夸克的组合（$b macron(b)$）
- 粲偶素，底偶素的质量谱，自旋展示出了和氢原子能谱一致的结构：*存在主能级、轨道激发、自旋劈裂等结构*
  #figure(
    image("pic/5.2.png", width: 50%),
    caption: [底偶素谱线],
  )

*辐射跃迁*
- 如果一个束缚态处在激发态，它可以发射光子降到较低能级。例如粲偶素中
  $
    chi_(c 1) -> J\/ψ + gamma\
    chi_(c 0) -> J\/ψ + gamma\
  $
  这里$chi_(c 1)$和$chi_(c 0)$是较高的$P$波态，$J\/ψ$是较低的$S$波态，它们之间通过发射一个光子完成跃迁，和原子中电子从高能级跃迁到低能级发光非常类似
- 不仅介子有激发谱，重子也有类似的激发态结构
  $
    gamma + P -> Delta^+
  $

== 强子

=== 介子排列

- 考虑轻夸克$u,d,s$和对应反夸克
- 一个介子是九重态
  #figure(
    image("pic/builds/1.2.pdf", width: 80%),
    numbering: none,
  )
  左侧是$J^P = 0^-$赝标介子，右侧是$J^P = 1^-$矢量介子
- 左右两张图的区别主要来自夸克和反夸克自旋如何耦合
  - 所以同样的味道组合，比如$u macron(d)$，自旋反平行可以给出$pi^+$，自旋平行可以给出$rho^+$

=== 重子排列
- 考虑$u,d,s$三种夸克组成的重子
- 三个夸克全平行，总自旋$3/2$，十重态
  #figure(
    image("pic/builds/1.4.pdf", width: 80%),
    numbering: none,
  )
- 三个夸克总自旋$1/2$，八重态
  #figure(
    image("pic/builds/1.3.pdf", width: 80%),
    numbering: none,
  )

== 介子

=== 轻夸克介子——八重态和单态

*轻夸克$u,d$的$q macron(q)$形式的组合*
- 同位旋二重态
  $
    u = ket(1/2\, 1/2), d = ket(1/2\, -1/2)\
    macron(u) = ket(1/2\, -1/2), macron(d) = - ket(1/2\, 1/2)
  $
- 思路1：可以想象成两个自旋$1/2$的粒子的各种组合，两者自旋可以是平行的，也可以是反平行的
  - 两者自旋可以是平行的，总自旋$1$，在任意方向($z$)可以有三种状态，$+1,0,-1$
    $
      ket(1\, 1) &= - u macron(d) = - ket(1/2\, 1/2) ket(1/2\, -1/2)\
      ket(1\, 0) &= (u macron(u) - d macron(d))/sqrt(2) = (ket(1/2\, 1/2) ket(1/2\, -1/2) - ket(1/2\, -1/2) ket(1/2\, 1/2))/sqrt(2)\
      ket(1\, -1) &= d macron(u) = - ket(1/2\, -1/2) ket(1/2\, 1/2)\
    $
  - 两者是反平行的，总自旋$0$，$z$向也是$0$
    $
      ket(0\, 0) &= (u macron(u) + d macron(d))/sqrt(2) = (ket(1/2\, 1/2) ket(1/2\, -1/2) + ket(1/2\, -1/2) ket(1/2\, 1/2))/sqrt(2)
    $
- 思路2：群的直积分解，$2 times.o macron(2) = 3 plus.o 1$
  - 2重态2重态直乘可分解为三重态和单态的直和
- *轻介子，赝标介子，矢量介子*：再考虑两个夸克的自旋，
  - 平行（矢量介子，总自旋为$1$，并且$P=-1$）
    - 三重态$ket(1\, m)$为$rho^-, rho^0, rho^+$
  - 反平行（赝标介子，总自旋为$0$，并且$P=-1$）
    - 三重态$ket(1\, m)$为$pi^-, pi^0, pi^+$

*轻介子，$u,d,s$*
- 轻介子：$u,d,s$三种夸克和对应反夸克的组合
  $
    3 times.o macron(3) = 8 plus.o 1
  $
  *下面考虑$"SU"(3)$的不可约表示分解*
  $
    M = q macron(q) = mat(u macron(u), u macron(d), u macron(s); d macron(u), d macron(d), d macron(s); s macron(u), s macron(d), s macron(s))
  $
  唯一分解成
  $
    M = (M - 1/3 tr(M) I) + 1/3 tr(M) I
  $
  其中
  $
    M_8 = M - 1/3 tr(M) I, M_1 = 1/3 tr(M) I
  $
  - 单态：$M_1$
    $
      Tr(M) = u macron(u) + d macron(d) + s macron(s)
    $
    单态是
    $
      eta_1 = (u macron(u) + d macron(d) + s macron(s))/sqrt(3)
    $
    这个态对应单位矩阵方向
    $
      1/sqrt(3) mat(1, 0, 0; 0, 1, 0; 0, 0, 1)
    $
    它在$"SU"(3)$变换下不变
  - 八重态：$M_8$
    - 其中六个是非对角元
      $
               pi^+ & = u macron(d) \
               pi^- & = d macron(u) \
                K^+ & = u macron(s) \
                K^- & = s macron(u) \
                K^0 & = d macron(s) \
        macron(K)^0 & = s macron(d)
      $
    - 剩下两个八重态成员来自对角元
      - 三个对角方向中，一个已经被单态占掉：
        $
          eta_1 = (u macron(u) + d macron(d) + s macron(s))/sqrt(3) tilde I
        $
      - 所以还剩两个与它正交的方向。通常选为
        $
          pi^0 = (u macron(u) - d macron(d))/sqrt(2) tilde lambda_3
        $
        和
        $
          eta_8 = (u macron(u) + d macron(d) - 2 s macron(s))/sqrt(6) tilde lambda_8
        $
#note(subname: [$"SU"(3)$的基本表示])[
  $"SU"(3)$的生成元是Gell-Mann矩阵$T_a = lambda_a/2$，都是$3 times 3$的无迹Hermitian矩阵
  $
    lambda_1 = mat(0, 1, 0; 1, 0, 0; 0, 0, 0), lambda_2 = mat(0, -i, 0; i, 0, 0; 0, 0, 0), lambda_3 = mat(1, 0, 0; 0, -1, 0; 0, 0, 0)\
    lambda_4 = mat(0, 0, 1; 0, 0, 0; 1, 0, 0), lambda_5 = mat(0, 0, -i; 0, 0, 0; i, 0, 0)\
    lambda_6 = mat(0, 0, 0; 0, 0, 1; 0, 1, 0), lambda_7 = mat(0, 0, 0; 0, 0, -i; 0, i, 0)\ lambda_8 = 1/sqrt(3) mat(1, 0, 0; 0, 1, 0; 0, 0, -2)
  $
  $"SU"(3)$有两个对角生成元$lambda_3$和$lambda_8$，它们的本征值可以用来标记$"SU"(3)$的表示
  - $lambda_3$的本征值对应同位旋$I_3$
    $
      I_3 = lambda_3/2
    $
  - $lambda_8$的本征值对应超荷$Y$
    $
      Y = lambda_8/sqrt(3)
    $
  对应$"SU"(2)$的本征值是$J_3$，$"SU"(3)$的本征值是$I_3$和$Y$，它们可以用来标记$"SU"(3)$的表示

  $"SU"(2)$的权图是一维的
  $
    m = -j, -j + 1, ..., j
  $
  $"SU"(3)$的权图是二维的
  - 八重态的权图是一个六边形加一个中心点
  - 单态的权图是一个点

  $"SU"(3)$的基本表示是$3$维表示，作用在$3$维向量空间上；我们把$u,d,s$看成是这个空间的三个基矢量
  $
    u = mat(1; 0; 0), d = mat(0; 1; 0), s = mat(0; 0; 1)
  $
  有本征值关系
  $
    I_3 u = 1/2 u, I_3 d = -1/2 d, I_3 s = 0\
    Y u = 1/3 u, Y d = 1/3 d, Y s = -2/3 s
  $
  这给出了$u,d,s$的同位旋和超荷（权图）
  $
    u = (1/2, 1/3), d = (-1/2, 1/3), s = (0, -2/3)
  $
  介子八重态权图就由其中每个成员的$I_3$和$Y$坐标构成
  #figure(
    three-line-table[
      | 粒子         | ket       | 权 $(I_3,Y)$ |
      | ---------- | --------- | ----------- |
      | $pi^+$    | $u macron(d)$ | $(1,0)$       |
      | $pi^0$    | 组合        | $(0,0)$       |
      | $pi^-$    | $d macron(u)$ | $(-1,0)$      |
      | $K^+$      | $u macron(s)$ | $(1/2,1)$     |
      | $K^0$      | $d macron(s)$ | $(-1/2,1)$    |
      | $K^-$      | $s macron(u)$ | $(-1/2,-1)$   |
      | $macron(K)^0$ | $s macron(d)$ | $(1/2,-1)$    |
      | $eta_8$   | 组合        | $(0,0)$       |
    ],
    caption: [轻介子八重态的权图],
  )
  #figure(
    three-line-table[
      | 粒子         | ket       | 权 $(I_3,Y)$ |
      | ---------- | --------- | ----------- |
      | $eta_1$   | 对称组合        | $(0,0)$       |
    ],
    caption: [轻介子单态的权图],
  )
]

- 三个夸克，$s$的质量明显大于$u$的夸克，$"SU"(3)$的对称性并不完美
  - 赝标介子
    $
      eta = (u macron(u) + d macron(d) - 2 s macron(s))/sqrt(6)\
      eta' = (u macron(u) + d macron(d) + s macron(s))/sqrt(3)
    $
    它们是$"SU"(3)$的八重态和单态
  - 矢量介子
    $
      omega = (u macron(u) + d macron(d))/sqrt(2)\
      phi = s macron(s)
    $
    它们是$"SU"(3)$的八重态和单态的混合态
  #figure(
    image("pic/builds/1.2.pdf", width: 80%),
    numbering: none,
  )

=== 介子质量
$
  M = m_1 + m_2 + A'((vb(S)_1 dot vb(S)_2)/(m_1 m_2))
$
为夸克质量加上自旋自旋耦合部分，其中
$
  vb(S)_1 dot vb(S)_2 = 1/2 (S^2 - S_1^2 - S_2^2) = cases(
    1/4 hbar^2 \, & S = 1 "(vector meson)",
    - 3/4 hbar^2 \, & S = 0 "(pseudoscalar meson)"
  )
$
及组分质量
$
  m_u = m_d = 308 "MeV", m_s = 483 "MeV"
$
和常数
$
  A = ((2 m_u)/hbar)^2 159 "MeV"\/c^2
$

== 重子

=== 重子波函数——十重态、八重态和单态

*重子，三个全同Fermion组合*
- 介子是夸克-反夸克的组合，它们不是全同粒子，我们不考虑介子波函数交换对称性问题；重子是三个夸克为*全同粒子*
- 我们认为味道只是夸克的一个属性，尤其是轻夸克$u,d,s$，有$"SU"(3)$对称性
  - 我们认为颜色也是夸克的一个属性
  - 夸克还有自旋，上下两个属性
- 我们要考虑重子波函数的*交换对称性问题*；全同Fermion系统，交换反对称
- 我们把重子的波函数写成
  $
    psi = psi("space") psi("spin") psi("flavor") psi("color")
  $
  - 空间部分，对称的（基态：$L=0$，$L'=0$）
    #figure(
      image("pic/5.3.png", width: 50%),
      caption: [重子空间波函数],
    )
  - 考察自旋，味道，颜色，如何构成交换反对称性的波函数
*自旋部分*
- 三个夸克，每个都有$s=1/2$；总自旋，$S=3/2,1/2$
  $
    2 times.o 2 times.o 2 = 4 plus.o 2 plus.o 2
  $
- $S=3/2$，交换全对称，四个波函数
  $
    ket(3/2\, 3/2) &= ket(arrow.t arrow.t arrow.t)\
    ket(3/2\, 1/2) &= (ket(arrow.t arrow.t arrow.b) + ket(arrow.t arrow.b arrow.t) + ket(arrow.b arrow.t arrow.t))/sqrt(3)\
    ket(3/2\, -1/2) &= (ket(arrow.t arrow.b arrow.b) + ket(arrow.b arrow.t arrow.b) + ket(arrow.b arrow.b arrow.t))/sqrt(3)\
    ket(3/2\, -3/2) &= ket(arrow.b arrow.b arrow.b)
  $
- $S=1/2，$交换有混合对称性；第一，二个粒子交换有反对称性
  $
     ket(1/2\, 1/2)_(12) & = (ket(arrow.t arrow.t arrow.b) - ket(arrow.t arrow.b arrow.t))/sqrt(2) \
    ket(1/2\, -1/2)_(12) & = (ket(arrow.t arrow.b arrow.b) - ket(arrow.b arrow.t arrow.b))/sqrt(2)
  $
- $S=1/2$，交换有混合对称性；第二，三个粒子交换有反对称性
  $
     ket(1/2\, 1/2)_(23) & = (ket(arrow.t arrow.t arrow.b) - ket(arrow.t arrow.b arrow.t))/sqrt(2) \
    ket(1/2\, -1/2)_(23) & = (ket(arrow.b arrow.t arrow.b) - ket(arrow.b arrow.b arrow.t))/sqrt(2)
  $
- 1、3交换的反对称组合，是可以由以上的叠加生成，是非独立的
*味道部分*
- 三种味道，$u,d,s$，按照$"SU"(3)$的不可约表示做直积分解
  $
    3 times.o 3 times.o 3 = 10 plus.o 8 plus.o 8 plus.o 1
  $
  我们写组合后的波函数为
  $
    ket(I\, I_3\, Y)
  $
  其中$I$是同位旋，$I_3$是同位旋的第三分量，$Y$是超荷$Y = B + S$，$B$是重子数，$S$是奇异数，其中
  $
    u = ket(1/2\, 1/2\, 1/3), d = ket(1/2\, -1/2\, 1/3), s = ket(0\, 0\, -2/3)
  $
- 第一组（10），全对称组合
  - $Delta: Y=1, I=3/2$
    $
      Delta^(++) & = ket(3/2\, 3/2\, 1) =  &                           u u u \
         Delta^+ & = ket(3/2\, 1/2\, 1) =  & (u u d + u d u + d u u)/sqrt(3) \
         Delta^0 & = ket(3/2\, -1/2\, 1) = & (u d d + d u d + d d u)/sqrt(3) \
         Delta^- & = ket(3/2\, -3/2\, 1) = &                           d d d
    $
  - $Sigma^*: Y=0, I=1$
    $
      Sigma^(*+) & = ket(1\, 1\, 0)  &                         = (u u s + u s u + s u u)/sqrt(3) \
      Sigma^(*0) & = ket(1\, 0\, 0)  & = (u d s + u s d + d u s + d s u + s u d + s d u)/sqrt(6) \
      Sigma^(*-) & = ket(1\, -1\, 0) &                         = (d d s + d s d + s d d)/sqrt(3) \
    $
  - $Xi^*: Y=-1, I=1/2$
    $
      Xi^(*0) & = ket(1/2\, 1/2\, -1)  & = (u s s + s u s + s s u)/sqrt(3) \
      Xi^(*-) & = ket(1/2\, -1/2\, -1) & = (d s s + s d s + s s d)/sqrt(3)
    $
  - $Omega: Y=-2, I=0$
    $
      Omega^- & = ket(0\, 0\, -2) & = s s s
    $
  #figure(
    image("pic/2026-05-07-23-51-04.png", width: 80%),
    caption: [重子十重态的权图],
  )
- 第二、三组（8+8），混合对称性组合
  - 8个1-2交换反对称态$rho$
    - $N: Y=1, I=1/2$核子
      $
        p_rho & = ket(1/2\, 1/2\, 1)  & = ((u d - d u)u)/sqrt(2) \
        n_rho & = ket(1/2\, -1/2\, 1) & = ((u d - d u)d)/sqrt(2)
      $
    - $Sigma: Y=0, I=1$三重态
      $
        Sigma^+_rho & = ket(1\, 1\, 0)  &          = ((u s - s u)u)/sqrt(2) \
        Sigma^0_rho & = ket(1\, 0\, 0)  & = ((u s - s u)d + (d s - s d)u)/2 \
        Sigma^-_rho & = ket(1\, -1\, 0) &          = ((d s - s d)d)/sqrt(2) \
      $
    - $Lambda: Y=0, I=0$
      $
        Lambda_rho & = ket(0\, 0\, 0) & = (2(u d - d u)s + (u s - s u)d - (d s - s d)u)/sqrt(12)
      $
    - $Xi: Y=-1, I=1/2$二重态
      $
        Xi^0_rho & = ket(1/2\, -1/2\, -1) & = ((u s - s u)s)/sqrt(2) \
        Xi^-_rho & = ket(1/2\, 1/2\, -1)  & = ((d s - s d)s)/sqrt(2) \
      $
    #figure(
      image("pic/2026-05-08-14-25-49.png", width: 80%),
      caption: [重子八重态的权图——1,2交换反对称态],
    )
  - 8个2-3交换反对称态$rho'$
    - $N: Y=1, I=1/2$核子
      $
        p_rho' & = ket(1/2\, 1/2\, 1)  & = (u (u d - d u))/sqrt(2) \
        n_rho' & = ket(1/2\, -1/2\, 1) & = (d (u d - d u))/sqrt(2)
      $
    - $Sigma: Y=0, I=1$三重态
      $
        Sigma^+_rho' & = ket(1\, 1\, 0)  &           = (u (u s - s u))/sqrt(2) \
        Sigma^0_rho' & = ket(1\, 0\, 0)  & = (u (d s - s d) + d (u s - s u))/2 \
        Sigma^-_rho' & = ket(1\, -1\, 0) &           = (d (d s - s d))/sqrt(2) \
      $
    - $Lambda: Y=0, I=0$
      $
        Lambda_rho' & = ket(0\, 0\, 0) & = (2s (u d - d u) + d (u s - s u) - u (d s - s d))/sqrt(12)
      $
    - $Xi: Y=-1, I=1/2$二重态
      $
        Xi^0_rho' & = ket(1/2\, -1/2\, -1) & = (s (u s - s u))/sqrt(2) \
        Xi^-_rho' & = ket(1/2\, 1/2\, -1)  & = (s (d s - s d))/sqrt(2) \
      $
    #figure(
      image("pic/2026-05-08-14-26-07.png", width: 80%),
      caption: [重子八重态的权图——2,3交换反对称态],
    )
  - 还有一组混合交换反对称态，1-3反对称，但非独立
  - 事实上，也有1-2交换对称情况$lambda$，但它们可以由以上的叠加生成，所以非独立
- 第四组（1），全反对称组合
  $
    Lambda_1 & = ket(0\, 0\, 0) & = (u d s - u s d + d s u - d u s + s u d - s d u)/sqrt(6)
  $

*颜色部分*
- 现实空间，没见到带颜色的粒子，所以认为是单态，在颜色波函数上是粒子交换全反对称结构
  $
    psi("color") = (r g b - r b g + g b r - g r b + b r g - b g r)/sqrt(6)
  $

*重子波函数的交换对称性*
- 重子波函数是空间、自旋、味道、颜色四部分的乘积，其中空间是对称的，颜色是反对称的
- 三个全同粒子的交换反对称性要求：自旋波函数和味道波函数整体满足交换对称性
- *十重态*
  $
    psi("十重态") = psi("spin对称") psi("flavor对称")
  $
  #example(subname: [])[
    写$Delta^+$在自旋态$m_j = -1/2$的波函数
  ]
  $
    psi(Delta^+) &= ket(3/2\, 1/2\, 1) ket(3/2\, -1/2)\
    &= (u u d + u d u + d u u)/sqrt(3) (ket(arrow.b arrow.b arrow.t) + ket(arrow.b arrow.t arrow.b) + ket(arrow.t arrow.b arrow.b))/sqrt(3)\
    &= (u(arrow.b)u(arrow.b) d(arrow.t) + u(arrow.b) d(arrow.t) u(arrow.b) + d(arrow.t) u(arrow.b) u(arrow.b) + u(arrow.b) d(arrow.b) u(arrow.t))/3 \
    &+ (u(arrow.t) d(arrow.b) u(arrow.b) + u(arrow.b) d(arrow.t) u(arrow.b) + d(arrow.b) u(arrow.b) u(arrow.t) + d(arrow.b) u(arrow.t) u(arrow.b) + d(arrow.t) u(arrow.b) u(arrow.b))/3
  $
- *八重态*
  $
    psi("八重态") =& sum psi("spin部分交换反对称") psi("flavor部分交换反对称")\
    psi("八重态") prop& psi("spin")_(12) psi("flavor")_(12) + psi("spin")_(23) psi("flavor")_(23) + psi("spin")_(13) psi("flavor")_(13))
  $
  #example(subname: [])[
    写质子$p$在自旋态$m_j = 1/2$的波函数
  ]
  $
    psi(p) =& sum psi("spin部分交换反对称") psi("flavor部分交换反对称")\
    =& (1/2 (ket(arrow.t arrow.b arrow.t) - ket(arrow.b arrow.t arrow.t)) (u d u - d u u) + 1/2 (ket(arrow.t arrow.t arrow.b) - ket(arrow.t arrow.b arrow.t)) (u u d - u d u) + 1/2 (ket(arrow.t arrow.t arrow.b)- ket(arrow.b arrow.t arrow.t)) (u u d - d u u))sqrt(2)/3\
    =& 1/sqrt(18) (2 u(arrow.t) u(arrow.t) d(arrow.b) - u(arrow.t) u(arrow.b) d(arrow.t) - u(arrow.b) u(arrow.t) d(arrow.t) \
      &+ 2 u(arrow.t) d(arrow.b) u(arrow.t) - u(arrow.t) d(arrow.t) u(arrow.b) - u(arrow.b) d(arrow.t) u(arrow.t) \
      &+ 2 d(arrow.b) u(arrow.t) u(arrow.t) - d(arrow.t) u(arrow.b) u(arrow.t) - d(arrow.t) u(arrow.t) u(arrow.t))
  $
  - 八重态之所以没有十重态角上的粒子，是因为$u u u$等没有反对称味道组合

=== 重子磁矩

*磁矩矢量求和*
- 对于重子，基态没有轨道角动量，总磁矩等于三个夸克的磁矩和
  $
    mu = mu_1 + mu_2 + mu_3
  $
- 对于夸克，电荷$q$，质量$m$，自旋$1/2$
  $
    vb(mu) = q/(m c) vb(S), mu = (q hbar)/(2 m c)
  $
  $
    mu_u = 2/3 (e hbar)/(2 m_u c), mu_d = -1/3 (e hbar)/(2 m_d c), mu_s = -1/3 (e hbar)/(2 m_s c)
  $
*质子磁矩*
- 质子波函数的第一项
  $
      & 4/18 braket(u arrow.t u arrow.t d arrow.b, mu_1 + mu_2 + mu_3, u arrow.t u arrow.t d arrow.b) = 2/9 (2 mu_u - mu_d) \
    = & 2/9 braket(u arrow.t u arrow.t d arrow.b, mu_1 + mu_2 + mu_3, u arrow.t u arrow.b t arrow.b) \
    = & 2/9 (2mu_u - mu_d)
  $
- 由此可以得到质子磁矩
  $
    mu_p &= 2/9 (2 mu_u - mu_d) + 1/18 mu_d + 1/18 mu_d + 2/9 (2 mu_u - mu_d) + 1/18 mu_d + 1/18 mu_d + 2/9 (2 mu_u - mu_d) + 1/18 mu_d + 1/18 mu_d \
    &= 4/3 mu_u - 1/3 mu_d
  $
- 从而得到
  $
    mu_n : mu_p = -2 : 3
  $

=== 重子质量

*统一的质量公式*
$
  M = m_1 + m_2 + m_3 + A' ((vb(S)_1 dot vb(S)_2)/(m_1 m_2) + (vb(S)_2 dot vb(S)_3)/(m_2 m_3) + (vb(S)_1 dot vb(S)_3)/(m_1 m_3))
$
第一项是夸克质量，第二项是自旋自旋耦合

== 夸克质量，奇特强子
- 组分夸克
  - 前面质量中有一个参数是夸克质量，$m_u, m_d, m_s$，这通常不是标准模型Lagrange量里的“裸夸克质量”或“流夸克质量”，而是组分夸克质量
  - 真实的$u,d$流夸克质量只有几MeV：$m_u, m_d tilde 2-5 "MeV"$，而组分夸克质量却有几百MeV：$m_u, m_d tilde 300 "MeV"$
  - 所以在组分夸克模型中，常把一个轻夸克看成*裸夸克 + 周围胶子场 + 海夸克云 + 动能/相互作用能*的有效自由度，其有效质量大约是几百MeV。也就是说，组分夸克质量是一种低能*强子内部的有效参数*，不是基本质量
  - 质子的质量绝大部分不是来自三个价夸克的裸质量，而是来自：*胶子场能量*、*夸克动能*、*海夸克贡献*、*真空极化与强相互作用能*
  - 这和QCD的基本图像一致：强子一个强相互作用束缚体系。对于轻强子，质量主要来自QCD动力学，而不是Higgs机制给轻夸克的裸质量
- 海夸克
  - 普通夸克模型里，我们会说：$p = u u d, n = u d d$是价夸克内容，决定电荷、重子数、同位旋等量子数。
  - 但真实质子内部不是只有三个价夸克。由于QCD中胶子可以辐射胶子，也可以产生夸克—反夸克对：$g -> q macron(q)$。所以强子内部还存在大量瞬时涨落的$q macron(q)$这部分称为海夸克。
- 真空极化
  - *真空极化*则指强相互作用真空不是空无一物，而会因为场的量子涨落产生有效屏蔽、反屏蔽、夸克凝聚等效应。
  - 简单说，它反映的是：强子内部的质量和相互作用不是只由价夸克决定，还受到QCD真空结构影响。
- 重夸克偶素比较接近“质量相加”
  - $m_c tilde 1.3"GeV"$
    - $J\/psi (c macron(c)) tilde 3.1"GeV"$
    - $eta_c (c macron(c)) tilde 3.0"GeV"$
    - 粗略看：$2m_c tilde 2.6 "GeV"$再加上束缚能、动能、自旋相互作用等，得到约$3.0$GeV的粲偶素质量
    - 自旋—自旋耦合会导致同一夸克组成的不同自旋态质量不同：通常矢量态要比赝标量态略重
  - $m_b tilde 4.2"GeV"$
    - $Upsilon (b macron(b)) tilde 9.5 "GeV"$
    - 和实际质量处在同一量级
  - 所以对重夸克体系，强子质量中“夸克质量和”的部分更显著；而对质子、pion这类轻强子，裸夸克质量只占很小部分，QCD 动力学贡献更重要
- 四夸克态
  - $q q macron(q) macron(q)$
  - 例如某些$X,Y,Z$态常被讨论为四夸克候选。它们可以被理解为紧致四夸克，也可以是两个介子组成的分子态
- 五夸克态
  - $q q q q macron(q)$
  - LHCb 发现的一些$P_c$态常被解释为五夸克候选，例如含有$c macron(c)$和轻夸克的结构
- 胶球（未发现）
  - 胶球是只由胶子构成的强子：$g g, g g g, ...$
  - 因为胶子本身带颜色荷，胶子之间也能相互作用，所以 QCD 允许纯胶子形成颜色单态束缚态
