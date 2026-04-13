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
  u(alpha, beta, gamma) = u_1 (alpha) u_2 (beta) u_3 (gamma)
$
其中
$
  u_1 (alpha) = mat(e^(i alpha/2), 0; 0, e^(-i alpha/2)), u_2 (beta) = mat(cos(beta/2), sin(beta/2); -sin(beta/2), cos(beta/2)), u_3 (gamma) = mat(cos (gamma/2), - i sin(gamma/2); - i sin(gamma/2), cos(gamma/2))
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
  u_1(alpha) vb(sigma) u^dagger_1 (alpha) = U^dagger_z (alpha) vb(sigma)
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
== 分立对称性
