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

= 对称性

== 群知识简介

*群*是一个集合$cal(G)$
$
  cal(G) = {g_0, g_1, g_2, ...}
$
配备一个二元运算$dot$，满足以下条件：
- 闭合性：对于任意$g_i, g_j in cal(G)$，$g_i dot g_j in cal(G)$
- 结合律：对于任意$g_i, g_j, g_k in cal(G)$，$(g_i dot g_j) dot g_k = g_i dot (g_j dot g_k)$
- 单位元：存在一个元素$e in cal(G)$，使得对于任意$g_i in cal(G)$，$e dot g_i = g_i dot e = g_i$
- 逆元：对于任意$g_i in cal(G)$，存在一个元素$g_i^(-1) in cal(G)$，使得$g_i dot g_i^(-1) = g_i^(-1) dot g_i = e$
群可以是对一个系统的全部对称性操作的集合。

*分离群与连续群*
- 分离群：元素之间是离散的，例如：$D_3$（等边三角形的对称群）
  $
    D_3 = {e, d, f, a, b, c}
  $
  其中$e$是单位元，$d$和$f$是旋转操作，$a$、$b$、$c$是反射操作；这是一个分立群，只有6个元素
- 连续群：元素之间是连续的，例如：$"SO"(3)$（三维空间的旋转群）
  - 空间平移的操作集合可以构成群
  - 空间转动的操作集合可以构成群
  - 时间平移变换构成群
  - 旋量的旋转变换构成群
  - Lorenz变换构成群
  - 有无穷多个群元素的群是连续群，连续群又可以分为Lie群和非Lie群；Lie群是指其元素可以用连续参数来描述的群，例如：$"SO"(3)$，$"SU"(2)$，$"SU"(3)$等

*Able与非Abel群*
- Abel群：满足交换律的群，群元素对易
  $
    g_i dot g_j = g_j dot g_i
  $
  - 对称操作可交换
  - 平移群的元素都是对易的，是Abel群
- 非Abel群：不满足交换律的群，群元素不对易
  $
    g_i dot g_j != g_j dot g_i
  $
  - 对称操作交换后效果不同
  - 三维转动群的元素不是对易的，是非Abel群

*二维转动群$"SO"(2)$*(special orthogonal group for n=2)描述了二维空间的旋转对称性。从$P$到$P'$点的变换为：
$
  P' = mat(x'; y') = mat(cos theta, -sin theta; sin theta, cos theta) mat(x; y) = R(theta) P
$
二维转动矩阵$R$的集合构成二维转动群
$
  "SO"(2) = {R(theta) | theta in [0, 2 pi)}, R(theta) = mat(cos theta, -sin theta; sin theta, cos theta)
$
任意两个二维转动的先后顺序是可以交换的，因此$"SO"(2)$是一个Abel群。二维转动矩阵$R$的生成元是
$
  sigma = mat(0, -1; 1, 0)
$
满足
$
  R = e^(i sigma theta)
$
$"SO"(2)$只有一个自由参数$theta$，$"so"(2)$代数有一个生成元$sigma$，因此$"SO"(2)$是一个一维Lie群。

*一维幺正群$"U"(1)$*(unitary group for n=1)描述了一个复数的相位变换对称性
$
  "U"(1) = {e^(i alpha) | alpha in [0, 2 pi)}
$
微观粒子的波函数用复数$psi$表示，可以进行相位变换$U = e^(i alpha)$，使得$psi' = U psi$，使得波函数表征的概率$abs(psi)^2$保持不变。
- $"U"(1)$的群元是$1 times 1$幺正矩阵$e^(i alpha)$，满足$U^dagger U = 1$，因此$"U"(1)$是一个Abel群
- $"U"(1)$的群元完成了复平面的转动
$"U"(1)$和$"SO"(2)$描述了同样的几何结构变换
$
  "U"(1) tilde.equiv "SO"(2)
$
#newpara()

*三维旋转群$"SO"(3)$*(special orthogonal group for n=3)描述了三维空间的旋转对称性。三维转动矩阵$R$，由Euler角来表征，三个自由度，三个参数
$
  R &= R_x (gamma) R_y (beta) R_z (alpha) \
  &= mat(1, 0, 0; 0, cos gamma, -sin gamma; 0, sin gamma, cos gamma) mat(cos beta, 0, sin beta; 0, 1, 0; -sin beta, 0, cos beta) mat(cos alpha, -sin alpha, 0; sin alpha, cos alpha, 0; 0, 0, 1)
$
对应着三个生成元
$
  R = e^(i J_z alpha) e^(i J_y beta) e^(i J_x gamma) = e^(i vb(J) dot vb(theta))
$
其中
$
  J_x = mat(0, 0, 0; 0, 0, -i; 0, i, 0), J_y = mat(0, 0, i; 0, 0, 0; -i, 0, 0), J_z = mat(0, -i, 0; i, 0, 0; 0, 0, 0)
$
#newpara()
*二维幺正群$"SU"(2)$*(special unitary group for n=2)描述了一个二维复数空间的特殊幺正变换对称性
$
  "SU"(2) = {U | U^dagger U = 1, det(U) = 1}
$
表示为
$
  U = mat(alpha, beta; -beta^*, alpha^*), abs(alpha)^2 + abs(beta)^2 = 1
$
有三个独立实参数，共有三个生成元。对于复数对$phi = mat(m; n)$，$m, n$都是复数，对应旋量场的两个复数分量
$
  abs(m)^2 + abs(n)^2 = 1
$
$"SU"(2)$变换后，$U phi$将保持该复数对的模长平方和不变，即$"SU"(2)$变换完成了旋量的转动。$"SU"(2)$也可以用Euler角来表征，三个参数
$
  u(alpha, beta, gamma) = u_3 (alpha) u_2 (beta) u_3 (gamma)
$
其中
$
  u_1 (alpha) = mat(cos alpha/2, -i sin alpha/2; -i sin alpha/2, cos alpha/2), u_2 (beta) = mat(cos beta/2, - sin beta/2; sin beta/2, cos beta/2), u_3 (gamma) = mat(e^(- i gamma/2), 0; 0, e^(i gamma/2))
$
生成元是Pauli矩阵
$
  sigma_1 = mat(0, 1; 1, 0), sigma_2 = mat(0, -i; i, 0), sigma_3 = mat(1, 0; 0, -1)
$
$
  u_i = e^(- i/2 sigma_i alpha_i)
$
从而有
$
  u(alpha, beta, gamma) = e^(- i/2 vb(sigma) dot vb(alpha)) = e^(mat(-i/2 gamma, -i/2(alpha - i beta); -i/2(alpha + i beta), i/2 gamma))
$
$"SU"(2)$群和$"SO"(3)$群有$2:1$的同态关系，即$"SU"(2)$是$"SO"(3)$的二重覆盖群
$
  "SU"(2) tilde "SO"(3)
$
有对应关系
$
  u_3(alpha) vb(sigma) u^dagger_3 (alpha) = U^dagger_z (alpha) vb(sigma)
$
#newpara()

下面定义*群的同态和同构*，对于
$
  cal(G) = {g_0, g_1, g_2, ...}, cal(F) = {f_0, f_1, f_2, ...}
$
如果存在一个映射$phi: cal(G) -> cal(F)$，使得对于任意$g_i, g_j in cal(G)$，都有
$
  phi(g_i dot g_j) = phi(g_i) dot phi(g_j)
$
则称$phi$是一个*群同态*，如果$phi$是一个双射，即存在一个逆映射$phi^(-1): cal(F) -> cal(G)$，使得对于任意$f_i, f_j in cal(F)$，都有
$
  phi^(-1)(f_i dot f_j) = phi^(-1)(f_i) dot phi^(-1)(f_j)
$
则称$phi$是一个*群同构*，如果两个群之间存在一个群同构，则称这两个群是*同构的*，记为$cal(G) tilde.equiv cal(F)$，同构的群具有相同的结构和性质，可以看作是同一个群的不同表现形式。

最后给出*群的直积、直和、直积分解*
- 直积：对于两个群$cal(G)$和$cal(F)$，它们的直积$cal(G) times.o cal(F)$是一个新的群，其元素是$cal(G)$和$cal(F)$的元素的有序对$(g, f)$，其中$g in cal(G)$，$f in cal(F)$，群运算定义为
  $
    (g_1, f_1) dot (g_2, f_2) = (g_1 dot g_2, f_1 dot f_2)
  $
  其表示
  $
    A = (a_(i j))_(n times n), B = (b_(i j))_(m times m) ==> A times.o B = mat(a_(i j)B) = (a_(i j) b_(k l))_(n m times n m)
  $
- 直和：对于两个群表示$A$和$B$，它们的直和$A plus.o B$是一个新的群表示，其表示空间是$A$和$B$的表示空间的直和，即$V_A plus.o V_B$，群元素的表示为
  $
    A plus.o B = mat(A, 0; 0, B)
  $
- 直积群的任意表示都可以约化成一些不可约表示的直和
  - $"SU"(2)$：$2 times.o 2 = 3 plus.o 1$，$2 times.o 2 times.o 2 = 2 times.o (3 plus.o 1) = 4 plus.o 2 plus.o 2$
  - $"SO"(3)$：$3 times.o 3 times.o 3 = 10 plus.o 8 plus.o 8 plus.o 1$

== 对称性和守恒定律

=== $"U"(1)$规范不变性与电荷守恒

系统的波函数用复数表示，它的相位是不可测的，只改变系统的*相位*没有物理影响，构成一种*对称性*（不变性）
$
  hat(U) = e^(i hat(Q) lambda)
$
$hat(Q)$为电荷算符，即生成元；$lambda$为与时空无关的实数参数；$hat(U)$为相位变换算符
$
  hat(U) psi = psi' = e^(i hat(Q) lambda) psi
$
这被称作一种*规范变换*，如果系统的哈密顿量$hat(H)$在该变换下保持不变，即
$
  hat(H) psi = i pdv(, t) psi, hat(H) psi' = i pdv(, t) psi' ==> hat(H) = hat(U) hat(H) hat(U)^dagger
$
从而$hat(H)$与$hat(Q)$对易，即$[hat(H), hat(Q)] = 0$，这表明电荷是一个守恒量，即电荷守恒定律。

=== 平移不变性与动量守恒

平移可以用一个空间位移算符$hat(T)(vb(a))$来表示，其中$vb(a)$是一个三维空间的位移矢量。对于一个粒子的位置算符$hat(r)$，平移变换后的位置算符为
$
  hat(T)(vb(a)) vb(r) = vb(r) + vb(a)\
  hat(T)(vb(a)) psi(vb(r)) = psi'(vb(r)) = psi(vb(r) - vb(a))
$
考虑无穷小变换$delta vb(a)$
$
  T(delta vb(a)) = 1 - i delta vb(a) dot hat(vb(p))
$
其中$hat(vb(p))$是动量算符，是平移的生成元，平移算符可以表示为
$
  hat(T)(vb(a)) = e^(- i vb(a) dot hat(vb(p)))
$
其中
$
  hat(vb(p)) = - i grad
$
是动量算符的坐标表象。平移不变性意味着哈密顿量$hat(H)$与平移算符$hat(T)(vb(a))$对易，即$[hat(H), hat(T)(vb(a))] = 0$，从而$hat(H)$与动量算符$hat(vb(p))$对易，即$[hat(H), hat(vb(p))] = 0$，这表明动量是一个守恒量，即动量守恒定律。

== 角动量
== 味对称性

*同位旋对称性*

考虑质子和中子，质量接近：$m_p = 938.3 "MeV/c"^2$，$m_n = 939.6 "MeV/c"^2$，它们可以看作是同一个粒子（核子）的两种状态，即*同位旋*的两种取值：$I_3 = +1/2$（质子）和$I_3 = -1/2$（中子）。

三种$pi$介子$pi^+$、$pi^0$、$pi^-$的质量也接近：$m_(pi^+) = 139.6 "MeV/c"^2$，$m_(pi^0) = 135.0 "MeV/c"^2$，$m_(pi^-) = 139.6 "MeV/c"^2$，它们可以看作是同一个粒子（介子）的三种状态，即*同位旋*的三种取值：$I_3 = +1$（$pi^+$），$I_3 = 0$（$pi^0$），$I_3 = -1$（$pi^-$）。

并且我们发现$pi^+ p -> pi^+ p$, $pi^- n -> pi^- n$两个过程截面几乎相同，这说明它们之间存在一种对称性，即*同位旋对称性*，同位旋对称性是指在强相互作用中，质子和中子可以看作是同一个粒子的两种状态，$pi^+$、$pi^0$、$pi^-$可以看作是同一个粒子的三种状态，在强相互作用中，这些粒子之间的相互作用是相同的。*同位旋对称性，是一个弱的对称性*。


*同位旋多重态*
- 质子（$u u d$）和中子（$u d d$）
  - $p$和$n$是全同粒子，是同位旋二重态
  - 同位旋$I$是$1/2$
  - $p$是$I_3$的$+1/2$态，$n$是$I_3$的$-1/2$态
- $u$夸克和$d$夸克
  - $u$和$d$是全同粒子，是同位旋双重态
  - 同位旋$I$是$1/2$
  - $u$是$I_3$的$+1/2$态，$d$是$I_3$的$-1/2$态
- $pi^+ (u macron(d))$、$pi^0 ((u macron(u) - d macron(d))/sqrt(2))$、$pi^- (d macron(u))$
  - $pi^+$、$pi^0$、$pi^-$是全同粒子，是同位旋三重态
  - 同位旋$I$是$1$
  - $pi^+$是$I_3$的$+1$态，$pi^0$是$I_3$的$0$态，$pi^-$是$I_3$的$-1$态
- $Delta^(2+)$、$Delta^+$、$Delta^0$、$Delta^-$
  - $Delta^(2+)$、$Delta^+$、$Delta^0$、$Delta^-$是全同粒子，是同位旋四重态
  - 同位旋$I$是$3/2$
  - $Delta^(2+)$是$I_3$的$+3/2$态，$Delta^+$是$I_3$的$+1/2$态，$Delta^0$是$I_3$的$-1/2$态，$Delta^-$是$I_3$的$-3/2$态
- 事实上，介子、重子排列上的一个横行都是一组同位旋多重态

*同位旋的运算和自旋相同*
- *同位旋对称性*可以用$"SU"(2)$群来描述，同位旋算符$I_i$满足$"su"(2)$代数。引用Dirac符号$ket(I I_3)$来表征同位旋态，其中$I$是同位旋量子数，$I_3$是同位旋第三分量的量子数。
  - $p = ket(1/2\, 1/2)$，$n = ket(1/2\, -1/2)$
  - $u = ket(1/2\, 1/2)$，$d = ket(1/2\, -1/2)$
  - $pi^+ = ket(1\, 1)$，$pi^0 = ket(1\, 0)$，$pi^- = ket(1\, -1)$
  - $Delta^(2+) = ket(3/2\, 3/2)$，$Delta^+ = ket(3/2\, 1/2)$，$Delta^0 = ket(3/2\, -1/2)$，$Delta^- = ket(3/2\, -3/2)$
  - $pi^+ p$的组合为同位旋矢量相加，$ket(1\, 1) plus.o ket(1/2\, 1/2) = ket(3/2\, 3/2)$
- 同位旋的运算和自旋的运算完全相同，同位旋的升降算符$I_+$和$I_-$与自旋的升降算符$S_+$和$S_-$满足相同的关系
  - $p = ket(1/2\, 1/2)$，$n = ket(1/2\, -1/2)$
  - $p,n$组合可以组成同位旋3重态和单态
    - $ket(1\, 1) = p p$
    - $ket(1\, 0) = (p n + n p)/sqrt(2)$
    - $ket(1\, -1) = n n$
    - $ket(0\, 0) = (p n - n p)/sqrt(2)$
    $
      1/2 times.o 1/2 p = 1 plus.o 0
    $
  - 氘核$d$，因为没有其他的伴随粒子，猜测，它的$I=0$
- 一个$p$,一个$n$可以组合成同位旋的三重态，也可以是单态，比例按照CG系数计算
  $
    n p = 1/sqrt(2) (ket(1\, 0) + ket(0\, 0) )
  $

*核子散射到氘核的过程*
- 核子指质子和中子
- #three-line-table[
    | 过程 | 左侧同位旋 | 右侧同位旋 |
    | -- | -- | -- |
    | $p + p -> d + pi^+$ | $ket(1\, +1)$ | $ket(1\, +1)$ |
    | $p + n -> d + pi^0$ | $1/sqrt(2) (ket(1\, 0) + ket(0\, 0))$ | $ket(1\, 0)$ |
    | $n + n -> d + pi^-$ | $ket(1\, -1)$ | $ket(1\, -1)$ |
  ]
- 假如第一和第三个过程的振幅为1
  $
    braket(1 +1, 1 +1) = 1, braket(1 -1, 1 -1) = 1
  $
  则第二个过程的振幅为$1/sqrt(2)$，因此第二个过程的截面是第一和第三个过程的一半
  $
    1/sqrt(2) braket(1 0, 1 0) + 1/sqrt(2) braket(0 0, 1 0) = 1/sqrt(2)
  $
  概率为振幅平方，只有$1/2$；实验测量结果：$sigma_1 : sigma_2 = 2: 1$

*$Delta$粒子在$pi p$散射中的产生截面*

== 分立对称性

下面介绍一些分立对称性：*宇称*、*时间反演*、*电荷共轭*，以及它们的组合$C P T$。
- *宇称变换（Parity，P）*：对应着物理系统的坐标变换$vb(r) → -vb(r)$，镜像实际上是一种通俗的说法
- *电荷共轭变换（Charge conjugation，C）*：粒子的电荷和磁矩反号，更好的描述是粒子和反粒子交换
- *时间反演变换（Time reversal，T）*：对应着物理系统的时间变换$t → -t$

=== C宇称、P宇称与CP破坏

*宇称$P$的一些规则*
- 物理系统的宇称是一个守恒量，即$[hat(H), hat(P)] = 0$，因此宇称是一个良好量子数
- 两次变换
  $
    hat(P)^2 = 1
  $
  因此宇称的本征值只能是$+1$或$-1$，分别对应着偶宇称和奇宇称
- 宇称是*粒子的内禀宇称*
  - 正反费米子（夸克$q macron(q)$，轻子$l macron(l)$，质子$p macron(p)$）总是成对出现，他们的宇称相反，单个Fermion的宇称按习惯设定
  - Boson（介子$pi$，光子$gamma$，W/Z玻色子）可单一产生，其宇称需要实验测定，例如
- 两体系统的宇称，要考虑角动量的贡献：$P = (-1)^L$，$L$是轨道角动量
  $
                           & pi^- + &      d & -> &    n + & n \
              "轨道角动量" &        &      0 & -> &      1 & \
          "粒子的内禀宇称" & -1     &      1 & -> &      1 & 1 \
    "轨道角动量带来的宇称" &        & (-1)^0 & -> & (-1)^1 & \
  $

*C宇称*
- $C$宇称是电荷共轭变换的宇称：粒子→反粒子
- $hat(C)^2 = 1$，因此$C$宇称的本征值只能是$+1$或$-1$
- 如果是中性粒子，而且反粒子是自身
- $C$一个可相乘的量子数


*$theta$-$tau$之谜*
- 20世纪50年代，有两个粒子，质量相同，自旋同为$0$，但一个可以衰变到$2$个$pi$，另一个可以衰变到$3$个$pi$，拥有不同的宇称
  $
         theta^+ -> pi^+ + pi^0, & P = (-1)^L = 1 \
    tau^+ -> pi^+ + pi^0 + pi^0, & P = (-1)^L = -1 \
    tau^+ -> pi^+ + pi^+ + pi^-, & P = (-1)^L = -1 \
  $
  杨振宁和李政道发现，在弱作用中，宇称问题没有实验检测，提出*宇称不守恒*及实验方案
- *P破缺，宇称不守恒*
  - 1957年，杨和李因为在*弱相互作用中宇称（parity，P）不守恒*的突破性工作分享了1957年的Nobel物理学奖
  - 我们期待，物理规律在镜像（$vb(r) → −vb(r)$）的情况下不变
  - 实验证明，只有电磁和强相互作用$P$守恒，弱相互作用$P$不守恒
- *吴健雄，Co-60的实验*
  - 吴健雄在1957年进行的Co-60核衰变实验，提供了弱相互作用中宇称不守恒的直接证据
  - 吴创造了一个镜像的实验环境，但Co-60的衰变子体却无法镜像出来
*Maurice Goldhaber，中微子手征性，中微子的P宇称破缺*
- *中微子只有左手态*，镜像中要求有中微子右手态，不存在
- *反中微子只有右手态*，镜像中要求有反中微子左手态，不存在
- 涉及中微子的实验有最大的宇称破缺
*C对称性与C破缺*
- 中微子有最大的C宇称破缺：把中微子变成反中微子的时候，手征性不对
- 物理学家是绝望的，从绝望中寻找最后一个救命稻草；这一线希望是*CP联合变换*的对称性
*CP破缺*——$K^0$
- 1980年，Watson和Logsdon因为在中性$K$介子的对称性研究分享了Nobel物理学奖
- *中性$K$介子CP变换不守恒*
  - $K_0(d macron(s)), hat(C) K_0 = macron(K)_0(s macron(d))$
  // #feynman(
  //   node(),
  // )
  $K^0$和$macron(K)^0$是可以混合的；这个过程奇异数改变2，是个次级过程
- 中性$K$介子的CP本征态
  - $K^0$和$macron(K)^0$的宇称
    $
      hat(P) ket(K^0) = - ket(K^0), hat(P) ket(macron(K)^0) = - ket(macron(K)^0)
    $
  - $K^0$和$macron(K)^0$的C宇称
    $
      hat(C) ket(K^0) = ket(macron(K)^0), hat(C) ket(macron(K)^0) = ket(K^0)
    $
  - $K^0$和$macron(K)^0$的CP变换
    $
      hat(C) hat(P) ket(K^0) = - ket(K^0), hat(C) hat(P) ket(macron(K)^0) = - ket(macron(K)^0)
    $
  - 构建$K_1$和$K_2$为CP的本征态
    $
      ket(K_1) = 1/sqrt(2) (ket(K^0) - ket(macron(K)^0))\
      ket(K_2) = 1/sqrt(2) (ket(K^0) + ket(macron(K)^0))
    $
    就有
    $
      hat(C) hat(P) ket(K_1) = ket(K_1), hat(C) hat(P) ket(K_2) = - ket(K_2)
    $
- $K^0_L$(K-Long)和$K^0_S$(K-Short)的衰变模式
  - $K^0_L$主要衰变到$3$个$pi$
    - $pi^+ pi^- pi^0$，$pi^0 pi^0 pi^0$，$pi^- mu^+ nu_mu$，$pi^+ mu^- macron(nu_mu)$，$pi^- e^+ nu_e$，$pi^+ e^- macron(nu_e)$
    - 寿命$10^-8$s
  - $K^0_S$主要衰变到$2$个$pi$
    - $pi^+ pi^-$，$pi^0 pi^0$
    - 寿命$10^-10$s
  - 如果这些就是$K_1$和$K_2$，CP继而就是守恒的了
- 混合现象
  - $K^0$和$macron(K)^0$可以相互转化，形成混合态
    $
      K^0 <-> macron(K)^0
    $
    这个过程奇异数改变2，是个次级过程
  - 实际上$K^0$和$macron(K)^0$的混合结果才是实验上观测到的粒子
    $
      K^0_L = 1/sqrt(2) (ket(K^0) + ket(macron(K)^0))\
      K^0_S = 1/sqrt(2) (ket(K^0) - ket(macron(K)^0))
    $
    如果这些就是$K_1$和$K_2$，CP继而就是守恒的了
- K-long——一个检验CP的实验粒子
  - 经过足够长的时间，中性K-long介子理论上是一个CP为$-1$的粒子
  - 实验上发现，在$K_L$中有$2 times 10^(-3)$分量的$K_S$
    $
      K^0_L = 1/sqrt(1 + abs(epsilon)^2) (ket(K_2) + epsilon ket(K_1)), epsilon = 2 times 10^(-3)
    $
*其他系统的CP破坏*
- $K^0$和$macron(K^0)$的混合是来自于两次W的交换，二级的弱作用
  - 比如$macron(K)^0-K^0$系统，($s macron(d) - d macron(s)$)
  - 比如$macron(B)^0-B^0$系统，($d macron(b) - b macron(d)$)

=== CPT守恒

- 如果坚守CPT联合变换的不变性，即CPT守恒，则T变换必须是不守恒的
- CPT联合变换的不变性是物理学家的最后的坚守
