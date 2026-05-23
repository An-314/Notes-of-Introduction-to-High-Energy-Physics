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

= 量子电动力学

== Dirac方程

在非相对论量子力学中，粒子由Schrödinger方程描述；在相对论量子力学中
- 自旋为$0$的粒子由Klein-Gordon方程描述
- 自旋为$1/2$的粒子由Dirac方程描述
- 自旋为$1$的粒子由Proca方程描述

我们认为Schrödinger方程是可以从经典能量动量关系
$
  vb(p)^2/(2m) + V = E
$
做正则量子化
$
  vb(p) -> -i hbar grad, E -> i hbar pdv(, t)
$
得到的
$
  - (hbar^2)/(2m) laplacian Psi + V Psi = i hbar pdv(Psi, t)
$
#newpara()

Klein-Gordon方程是从相对论能量动量关系
$
  E^2 - vb(p)^2 c^2 = m^2 c^4 <=> p^mu p_mu - m^2 c^2 = 0
$
做正则量子化
$
  p_mu -> i hbar pdv(, x^mu)
$
也就是
$
  pdv(, x^0) = 1/c pdv(, t), pdv(, x^i) = pdv(, x^i)(i=1,2,3)
$
得到
$
  - hbar^2 pdv(, x^mu) pdv(, x_mu) Psi - m^2 c^2 Psi = 0
$
即
$
  -1/c^2 pdv(Psi, t, 2) + laplacian Psi = ((m c)/hbar)^2 Psi
$
该方程的解包含了正能态和负能态两种情况
- 正能解
  $
    E = p_0 = omega = sqrt(p^2 + m^2)\
    phi^+ = e^(- i omega t + i vb(p) dot vb(x))
  $
- 负能解
  $
    E = p_0 = - omega = - sqrt(p^2 + m^2)\
    phi^- = e^(i omega t + i vb(p) dot vb(x))
  $
Klein-Gordon方程用于标量场
#newpara()

Dirac方程是Klein-Gordon方程的进阶版：描述旋量场$s = 1/2$，也有正能、负能解，描述Fermion:$e, tau, mu, q$

对于没有空间分量即，$vb(p)=0$，动能关系为
$
  (p^0)^2 - m^2 c^2 = (p^0 + m c)(p^0 - m c) = 0
$
给出两个一阶方程
$
  p^0 + m c = 0, p^0 - m c = 0
$
我们希望有空间部分后也可以进行分解
$
              p^mu p_mu - m^2 c^2 & = (beta^kappa p_kappa + m c)(gamma^lambda p_lambda - m c) \
  (p^0)^2 - vb(p)^2 c^2 - m^2 c^2 & = (beta^0 p_0 - beta^i p_i + m c)(gamma^0 p_0 - gamma^i p_i - m c)
$
其中$beta^kappa, gamma^lambda$是八个待定系数，有
$
  "RHS" = beta^kappa gamma^lambda p_kappa p_lambda - m c (beta^kappa - gamma^kappa)p_kappa - m^2 c^2
$
选择
$
  beta^kappa = gamma^kappa
$
从而
$
  p^mu p_mu &= beta^kappa beta^lambda p_kappa p_lambda\
  (p^0)^2 - vb(p)^2 c^2 &= (gamma^kappa)^2 p_kappa^2 + (gamma^kappa gamma^lambda + gamma^lambda gamma^kappa) p_kappa p_lambda
$
取
$
  (gamma^0)^2 = 1, (gamma^i)^2 = -1(i=1,2,3), gamma^mu gamma^nu + gamma^nu gamma^mu = 0(mu != nu)
$
或更简明地
$
  gamma^mu gamma^nu + gamma^nu gamma^mu & = 2 g^(mu nu) \
                   {gamma^mu, gamma^nu} & = 2 g^(mu nu)
$
其中$g^(mu nu)$是Minkowski度规
$
  g^(mu nu) = diag(1, -1, -1, -1)
$
该矩阵的最小维数为$4$，因此$gamma^mu$是$4 times 4$矩阵，被称作Dirac矩阵。

Bjorken-Drell表示
$
  gamma^0 = mat(I, O; O, -I), gamma^i = mat(O, sigma^i; -sigma^i, O)
$
其中$I$是$2 times 2$单位矩阵，$O$是$2 times 2$零矩阵，$sigma^i$是Pauli矩阵。

相对论能量-动量关系因而被因子化成
$
  (gamma^mu p_mu - m c)(gamma^nu p_nu + m c) = 0
$
选择约定其中一项
$
  (gamma^mu p_mu - m c) Psi = 0
$
再做正则量子化
$
  p_mu -> i hbar pdv(, x^mu)
$
得到*Dirac方程*
$
  i hbar gamma^mu pdv(Psi, x^mu) - m c Psi = 0
$
$Psi$是一个四分量的旋量，称为Dirac旋量。Dirac方程的解包含了粒子和反粒子两种情况。

== Dirac方程的解

假设$Psi$与空间坐标无关
$
  pdv(Psi, x^i) = 0(i=1,2,3)
$
这是$vb(p)=0$的态，也就是说粒子是静止的。Dirac方程变为
$
  (i hbar)/c gamma^0 pdv(Psi, t) - m Psi = 0
$
$
  mat(I, O; O, -I) mat(pdv(vb(Psi)_A, t); pdv(vb(Psi)_B, t)) = - i (m c^2)/hbar mat(vb(Psi)_A; vb(Psi)_B) = 0
$
其中$vb(Psi)_A, vb(Psi)_B$分别是$Psi$的前两分量和后两分量
$
  vb(Psi)_A = mat(psi_1; psi_2), vb(Psi)_B = mat(psi_3; psi_4)
$
因此
$
  pdv(vb(Psi)_A, t) = - i (m c^2)/hbar vb(Psi)_A, - pdv(vb(Psi)_B, t) = - i (m c^2)/hbar vb(Psi)_B
$
解为
$
  vb(Psi)_A (t) = e^(- i (m c^2)/hbar t) vb(Psi)_A (0), vb(Psi)_B (t) = e^(i (m c^2)/hbar t) vb(Psi)_B (0)
$
因子
$
  e^(- i (m c^2)/hbar t) tilde e^(- i E/hbar t) <-> E = m c^2
$
正对应$vb(p)=0$的粒子态。其中$vb(Psi)_B$是负能态。$vb(Psi)_A$描述电子，则$vb(Psi)_B$描述正电子：每个都是一个两分量旋量，正好是一个自旋$1/2$的系统。

$vb(p) = 0$的Dirac方程给出四个解
$
  Psi^1 = mat(1; 0; 0; 0) e^(- i (m c^2)/hbar t), Psi^2 = mat(0; 1; 0; 0) e^(- i (m c^2)/hbar t), Psi^3 = mat(0; 0; 1; 0) e^(i (m c^2)/hbar t), Psi^4 = mat(0; 0; 0; 1) e^(i (m c^2)/hbar t)
$
它们对应地描写一个自旋上的电子，一个自旋下的电子，一个自旋下的正电子，和一个自旋上的正电子。

下面我们寻找波包解
$
  Psi(x) = a e^(-i vb(k) dot vb(x)) u(k)
$
希望找到一个四矢量$k^mu$和一个四分量旋量$u(k)$使得它满足Dirac方程。由于$x$的依赖只限于指数
$
  pdv(, x^mu) = - i k_mu
$
得到
$
  hbar gamma^mu k_mu e^(-i vb(k) dot vb(x)) u(k) - m c e^(-i vb(k) dot vb(x)) u(k) = 0
$
$
  (gamma^mu k_mu - (m c)/hbar) u(k) = 0
$
注意这个方程是纯代数方程
$
  gamma^mu k_mu = gamma^0 k^0 - vb(gamma) dot vb(k) = mat(k^0, - vb(sigma) dot vb(k); vb(sigma) dot vb(k), - k^0)
$
因此
$
  (hbar gamma^mu k_mu - m c) u &= mat(hbar k^0 - m c, - hbar vb(sigma) dot vb(k); hbar vb(sigma) dot vb(k), - hbar k^0 - m c) mat(u_A; u_B)\
  &= mat((hbar k^0 - m c) u_A - hbar vb(sigma) dot vb(k) u_B; hbar vb(sigma) dot vb(k) u_A - (hbar k^0 + m c) u_B)
$
从而给出
$
  u_A = 1/(k^0 - (m c)/hbar) (vb(sigma) dot vb(k)) u_B\
  u_B = 1/(k^0 + (m c)/hbar) (vb(sigma) dot vb(k)) u_A
$
把第二个方程代入第一个方程给出
$
  u_A = 1/((k^0)^2 - (m c/hbar)^2) (vb(sigma) dot vb(k))^2 u_A
$
而
$
      vb(k) dot vb(sigma) & = mat(k_3, k_1 - i k_2; k_1 + i k_2, - k_3) \
  (vb(k) dot vb(sigma))^2 & = mat(k_3^2 + (k_1 - i k_2)(k_1 + i k_2), 0; 0, k_3^2 + (k_1 + i k_2)(k_1 - i k_2)) \
                          & = vb(k)^2 I
$
因此
$
  ( (k^0)^2 - ((m c)/hbar)^2) = vb(k)^2 <=> k^mu k_mu = ((m c)/hbar)^2
$
这就意味着$k^mu$事实上是能量-动量四矢量
$
  k^mu = plus.minus p^mu/hbar
$
正号（时间依赖$e^(- i E/hbar)$）对应粒子态，负号（时间依赖$e^(i E/hbar)$）对应反粒子态。

现在可以构造Dirac方程的平面波解
- $u_A = mat(1; 0)$
  $
    u_B = (vb(p) dot vb(sigma))/(p^0 + m c) mat(1; 0) = c/(E + m c^2) mat(p_3; p_1 + i p_2)
  $
- $u_A = mat(0; 1)$
  $
    u_B = (vb(p) dot vb(sigma))/(p^0 + m c) mat(0; 1) = c/(E + m c^2) mat(p_1 - i p_2; - p_3)
  $
- $u_B = mat(1; 0)$
  $
    u_A = (vb(p) dot vb(sigma))/(p^0 + m c) mat(1; 0) = c/(E + m c^2) mat(p_3; p_1 + i p_2)
  $
- $u_B = mat(0; 1)$
  $
    u_A = (vb(p) dot vb(sigma))/(p^0 + m c) mat(0; 1) = c/(E + m c^2) mat(p_1 - i p_2; - p_3)
  $
对前两个式子，我们取$k^mu = p^mu/hbar$，得到粒子态的解；对后两个式子，我们取$k^mu = - p^mu/hbar$，得到反粒子态的解。

这些旋量的一个方便的归一化是
$
  u^dagger u = 2 E/c
$
即
$
  u = mat(alpha; beta; gamma; delta) <=> u^dagger = mat(alpha^*, beta^*, gamma^*, delta^*)\
  u^dagger u = abs(alpha)^2 + abs(beta)^2 + abs(gamma)^2 + abs(delta)^2
$
用结果的归一化因子
$
  N = sqrt((E + m c^2)/(c))
$
四个正则解成为
$
  u^((1)) = N mat(1; 0; c(p_3)/(E + m c^2); c(p_1 + i p_2)/(E + m c^2)), u^((2)) = N mat(0; 1; c(p_1 - i p_2)/(E + m c^2); - c(p_3)/(E + m c^2))
$
$
  v^((1)) = N mat(c(p_1 - i p_2)/(E + m c^2); - c(p_3)/(E + m c^2); 0; 1), v^((2)) = - N mat(c(p_3)/(E + m c^2); c(p_1 + i p_2)/(E + m c^2); 1; 0)
$
$
  psi = a e^(- i p dot x/hbar) u "particle"\
  psi = a e^(i p dot x/hbar) v "antiparticle"
$
从这里起，习惯上用字$v$来表示反粒子态的旋量。

粒子态满足动量空间的Dirac方程
$
  (gamma^mu p_mu - m c) u = 0
$
反粒子态满足
$
  (gamma^mu p_mu + m c) v = 0
$
#newpara()

可能会认为$u^((1))$描述自旋上的电子、$u^((2))$描述自旋下的电子、$v^((1))$描述自旋上的正电子、$v^((2))$描述自旋下的正电子，但不全是这样。因为Dirac粒子的自旋矩阵是
$
  vb(S) = hbar/2 vb(Sigma) = hbar/2 mat(vb(sigma), O; O, vb(sigma))
$
可以检验$u^((1))$不是$Sigma_z$的本征态。只有在$z$轴指向运动方向$p_x=p_y=0$时，$u^((1)), u^((2)), v^((1)), v^((2))$才是本征态：$u^((1))$和$v^((1))$是自旋上的态，$u^((2))$和$v^((2))$是自旋下的态。

Dirac的理解是
1. 真空已经被负能态的粒子填满了
2. Pauli不相容原理，正能电子不可能再跃迁到负能态去了
3. 真空上被激发一个电子，会留下一个空穴，即一个“反粒子”
反粒子的性质是
- 电荷，与电子相反，正电荷
- 磁矩，与电子相反

=== 双线性协变量

如果你变到一个以速度。在$x$方向运动的系统
$
  psi => psi' = S psi
$
其中$S$是如下$4 times 4$矩阵
$
  S = a_+ + a_- gamma^0 gamma^1 = mat(a_+, a_- sigma_1; a_- sigma_1, a_+) = mat(a_+, 0, 0, a_-; 0, a_+, a_-, 0; 0, a_-, a_+, 0; a_-, 0, 0, a_+)
$
其中
$
  a_plus.minus = plus.minus sqrt(1/2(gamma plus.minus 1))
$
#newpara()

如果我们要用旋量$psi$构造一个标量，合理的做法是试验如下表达式
$
  psi^dagger psi = mat(psi_1^*, psi_2^*, psi_3^*, psi_4^*) mat(psi_1; psi_2; psi_3; psi_4) = abs(psi_1)^2 + abs(psi_2)^2 + abs(psi_3)^2 + abs(psi_4)^2
$
这不是不变的
$
  (psi^dagger psi)' = psi^dagger S^dagger S psi != psi^dagger psi
$
其中
$
  S^dagger S = S^2 = gamma mat(1, - beta sigma_1; - beta sigma_1, 1) != I
$
当然，四矢量元素的平方和也同样不是不变的；引入伴随旋量
$
  overline(psi) = psi^dagger gamma^0 = psi^dagger mat(I, O; O, -I) = mat(psi_1^*, psi_2^*, - psi_3^*, - psi_4^*)
$
从而
$
  overline(psi) psi = psi^dagger gamma^0 psi = abs(psi_1)^2 + abs(psi_2)^2 - abs(psi_3)^2 - abs(psi_4)^2
$
是一个*相对论不变量*，因为
$
  S^dagger gamma^0 S = gamma^0
$
#newpara()

我们通过宇称变换下的行为
$
  P: vb(r) -> - vb(r), t -> t
$
来区分标量和赝标量。震标量改变符号；标量不改变符号
$
  P: psi -> gamma^0 psi
$
从而
$
  (overline(psi) psi)' = overline(psi) gamma^0 gamma^0 psi = overline(psi) psi
$
因此$overline(psi) psi$是一个*标量*。相反考虑
$
  overline(psi) gamma^5 psi
$
其中
$
  gamma^5 = i gamma^0 gamma^1 gamma^2 gamma^3 = mat(O, I; I, O)
$
它是Lorentz不变的
$
  (overline(psi) gamma^5 psi)' = psi^* S^dagger gamma^0 gamma^5 S psi = overline(psi) gamma^5 psi
$
但在宇称变换下改变符号
$
  (overline(psi) gamma^5 psi)' = (psi')^dagger gamma^0 gamma^5 gamma^0 psi = psi^dagger gamma^0 gamma^0 gamma^5 gamma^0 psi = - overline(psi) gamma^5 psi
$
事实上有$gamma^5$和$gamma^mu$的反对易关系
$
  {gamma^5, gamma^mu} = 0
$
#newpara()

由于$i$与$j$的取值均为$1$至$4$，所以共有$16$种形式的$psi_i^* psi_j$积(取一个分量的$psi_i^*$，而取另一个分量的$psi_j$)。这$16$种积可以被组合成各种线性组合来构造不同的变换行为，如下
- 标量：$overline(psi) psi$，$1$个分量
- 赝标量：$overline(psi) gamma^5 psi$，$1$个分量
- 矢量：$overline(psi) gamma^mu psi$，$4$个分量
- 赝矢量：$overline(psi) gamma^5 gamma^mu psi$，$4$个分量
- 反对称张量：$overline(psi) sigma^(mu nu) psi$，$6$个分量，其中
  $
    sigma^(mu nu) = i/2 [gamma^mu, gamma^nu] = i/2 (gamma^mu gamma^nu - gamma^nu gamma^mu)
  $
$1, gamma^5, gamma^mu, gamma^mu gamma^5, sigma^(mu nu)$组成所有$4 times 4$矩阵空间的一组基。

== 光子

*光子场*

Maxwell方程定义了光子的场方程，也给出了光子的波函数
$
  (square + m^2) A^mu = 0
$
其中
$
  square = pdv(, x^mu) pdv(, x_mu) = 1/c^2 pdv(, t, 2) - laplacian
$
解为
$
  A_mu (x) = a e^(- i/hbar p dot x) epsilon_mu^((s))
$
有无质量
$
  p^mu p_mu = 0
$
以及Coulomb规范
$
  epsilon^0 = 0
$
有两种横向极化
$
  vb(epsilon)^((1)) = mat(1; 0; 0), vb(epsilon)^((2)) = mat(0; 1; 0)
$

== QED的Feynman规则

*电子波函数*为
$
  psi(x) = a e^(- i/hbar p dot x) u^((s)) (p)
$
*正电子波函数*为
$
  psi(x) = a e^(i/hbar p dot x) v^((s)) (p)
$
其中$s$是自旋状态，取$1,2$；$u,v$分别满足正反粒子的Dirac方程。伴随量分别是
$
  macron(u) = u^dagger gamma^0, macron(v) = v^dagger gamma^0
$
正交归一性有
$
  macron(u^((s))) u^((s')) = 2 m c^2 delta^(s s'), macron(v^((s))) v^((s')) = - 2 m c^2 delta^(s s')
$
完备性有
$
  sum_(s=1)^2 u^((s)) macron(u^((s))) = gamma^mu p_mu + m c\
  sum_(s=1)^2 v^((s)) macron(v^((s))) = gamma^mu p_mu - m c
$

#newpara()

*光子波函数*为
$
  A_mu (x) = a e^(- i/hbar p dot x) epsilon_mu^((s))
$
其中$s$是自旋状态，取$1,2$；$epsilon_mu^((s))$满足
$
  p^mu epsilon_mu^((s)) = 0
$
Coulomb规范下
$
  epsilon^0 = 0, vb(epsilon) dot vb(p) = 0
$
正交归一性有
$
  epsilon^((s)) dot epsilon^((s')) = - delta^(s s')
$
完备性有
$
  sum_(s=1)^2 epsilon_mu^((s)) epsilon_nu^((s)) = delta_(i j) - hat(p)_i hat(p)_j
$
#newpara()
#figure(
  image("pic/builds/7.1.pdf", width: 30%),
  caption: [QED的Feynman规则],
)

现在能给出QED的Feynman规则了，对于振幅$M$的计算：
- 标记外线（入射和出射）粒子动量$p_1, p_2, ...$，，标记他们的正方向；标记内线粒子动量$q_1, q_2,...$，标记他们的正方向
- 外线因子
  - 电子：入射$u$，出射$macron(u)$
  - 正电子：入射$macron(v)$，出射$v$
  - 光子：入射$epsilon_mu$，出射$epsilon_mu^*$
- 内线因子
  $
    i g_e gamma^mu
  $
  无量纲，其中
  $
    g_e = sqrt(4 pi alpha) = e sqrt((4 pi)/(hbar c))
  $
  其中$alpha$是精细结构常数，$e$是电子的电荷
- 传播子：对每个内线，写下
  - 电子和正电子
    $
      (i (gamma^mu q_mu + m c))/(q^mu q_mu - m^2 c^2)
    $
  - 光子
    $
      i g_(mu nu)/(q^mu q_mu)
    $
- 能动量守恒：每个顶角有$(2 pi)^4 delta^(4)(k_1 + k_2 + k_3)$，其中$k_i$是入射线的动量，$- k_i$是出射线的动量
- 对每条内线，补充一个因子
  $
    integral dd(q_j, 4)/(2 pi)^4
  $
  积掉内动量$q$
- 最终，会有一个全局因子
  $
    (2 pi)^4 delta(sum_i q_i)
  $
  删去，并乘以$i$，结果为$M$，注意对着图反向沿着每一条Fermion做
- 反对称化（全同Fermion）

== 例子

*$e$-$mu$散射*
#figure(
  image("pic/builds/7.2.pdf", width: 30%),
  caption: [$e$-$mu$散射的树图],
)
这个过程在树图阶段，只有这一个
$
  (2pi)^4 integral (overline(u^((s_3))) (p_3) (i g_e gamma^mu) u^((s_1)) (p_1)) (i g_(mu nu))/(q^2) (overline(u^((s_4))) (p_4) (i g_e gamma^nu) u^((s_2)) (p_2)) \
  delta(p_1 - p_3 - q) delta(p_2 - p_4 + q) dd(q, 4)
$
这个积分只需处理一个$delta$函数，使$q$取确定值$p_1-p_3$，去掉整体的$(2pi)^4 delta$函数，并乘以$i$，张量$g_(mu nu)$改变第二项的上下标，并且要求只有$mu = nu$才有非零结果
$
  M = (-g_e^2)/(p_1-p_3)^2 (overline(u^((s_3))) (p_3) gamma^mu u^((s_1)) (p_1)) (overline(u^((s_4))) (p_4) gamma_mu u^((s_2)) (p_2))
$
其中
$
  u^((1)) (p) = N mat(1; 0; c p_3/(E + m c^2); c(p_1 + i p_2)/(E + m c^2)),
  u^((2)) (p) = N mat(0; 1; c(p_1 - i p_2)/(E + m c^2); - c p_3/(E + m c^2))
$
有
$
  overline(u) = u^dagger gamma^0
$
因此
$
  overline(u^((1))) (p) = N mat(1, 0, - (c p_3)/(E + m c^2), - c(p_1 + i p_2)/(E + m c^2)),
  overline(u^((2))) (p) = N mat(0, 1, - c(p_1 - i p_2)/(E + m c^2), c p_3/(E + m c^2))
$
至此，$M$就是可以计算的了。

*$e$-$e$散射*
#figure(
  image("pic/builds/7.3.pdf", width: 70%),
  caption: [$e$-$e$散射的树图],
)
包括两个过程，末态是两个全同Fermion（末态交叉），所以要反对称化；省略了动量和自旋的标识，以粒子标号统一标识
$
  M = (-g_e^2)/(p_1-p_3)^2 (overline(u) (3) gamma^mu u (1)) (overline(u) (4) gamma_mu u (2)) + (-g_e^2)/(p_1-p_4)^2 (overline(u) (4) gamma^mu u (1)) (overline(u) (3) gamma_mu u (2))
$

#newpara()
*$e$-$e^+$散射*
#figure(
  image("pic/builds/7.4.pdf", width: 70%),
  caption: [$e$-$e^+$散射的树图],
  numbering: none,
)
反向沿着每一条Fermion线进行计算
- 左图的贡献
  $
    (- g_e^2)/(p_1-p_3)^2 (overline(u) (3) gamma^mu u (1)) (overline(v) (2) gamma_mu v (4))
  $
- 右图的贡献
  $
    (- g_e^2)/(p_1+p_2)^2 (overline(v) (2) gamma^mu u (1)) (overline(u) (3) gamma_mu v (4))
  $
交换入射粒子与出射反粒子导致的反对称负号
$
  M = (- g_e^2)/(p_1-p_3)^2 (overline(u) (3) gamma^mu u (1)) (overline(v) (2) gamma_mu v (4)) - (- g_e^2)/(p_1+p_2)^2 (overline(v) (2) gamma^mu u (1)) (overline(u) (3) gamma_mu v (4))
$
#newpara()

*Comton散射*
#figure(
  image("pic/builds/7.5.pdf", width: 80%),
  caption: [Compton散射的树图],
)
- 左图
  $
    (2 pi)^4 integral epsilon_mu (2) (overline((u))(4) (i g_e gamma^mu) (i (gamma^nu q_nu + m c))/(q^mu q_mu - m^2 c^2) (i g_e gamma^nu) u (1)) epsilon_nu^* (3)\
    delta(p_1 - p_3 - q) delta(p_4 - p_2 + q) dd(q, 4)
  $
  记
  $
    gamma^mu q_mu = cancel(q)
  $
  则有
  $
    (- i (2pi)^4 g_e^2)/((p_1-p_3)^2 - m^2c^2) (overline(u)(4) cancel(epsilon)_2 (cancel(p)_1 - cancel(p)_3 + m c) cancel(epsilon)_3^* u (1)) delta(p_1 + p_2 - p_3 - p_4)
  $
  从而
  $
    M_a = g_e^2/((p_1-p_3)^2 - m^2c^2) (overline(u)(4) cancel(epsilon)_2 (cancel(p)_1 - cancel(p)_3 + m c) cancel(epsilon)_3^* u (1))
  $
- 右图
  $
    M_b = g_e^2/((p_1+p_2)^2 - m^2c^2) (overline(u)(4) cancel(epsilon)_3^* (cancel(p)_1 + cancel(p)_2 + m c) cancel(epsilon)_2 u (1))
  $
初末态交换粒子全同，直接相加
$
  M = M_a + M_b
$

== Casimir窍门

上面的计算已经可以进行了，要指定入射粒子的自旋，出射粒子的自旋。大量的实验是这样的情况：
- 入射粒子：没有极化
- 出射粒子：对极化没有判断
例如一个无极化的正负电子对撞机实验。这样，需要对各种入射自旋组合求平均，对各种出射粒子自旋求和。

*电子-缪子散射*
$
  M = (-g_e^2)/(p_1-p_3)^2 (overline(u^((s_3))) (p_3) gamma^mu u^((s_1)) (p_1)) (overline(u^((s_4))) (p_4) gamma_mu u^((s_2)) (p_2))
$
则有
$
  expval(abs(M)^2) = 1/4 sum_(s_1, s_2, s_3, s_4) M^2(s_1, s_2, s_3, s_4)
$
对各种入射自旋组合求平均，对各种出射粒子自旋求和；各个$M$中，各种粒子，自旋不同，无干涉现象，$M$平方后相加
$
  M(s_1, s_2, s_3, s_4) = (-g_e^2)/(p_1-p_3)^2 (overline(u^((s_3))) (p_3) gamma^mu u^((s_1)) (p_1)) (overline(u^((s_4))) (p_4) gamma_mu u^((s_2)) (p_2))
$
则有
$
  abs(M)^2 = g_e^4/(p_1-p_3)^4 (overline(u)(3) gamma^mu u (1)) (overline(u) (4) gamma_mu u (2)) (overline(u) (3) gamma^nu u (1))^* (overline(u) (4) gamma_nu u (2))^*
$
抽离一个通项$G$（第一、第三项），尝试进行化简
$
  G = (overline(u)(a) Gamma_1 u(b)) (overline(u)(a) Gamma_2 u(b))^*
$
计算第二项的复共轭
$
  G = (overline(u)(a) Gamma_1 u(b)) (overline(u)(b) overline(Gamma)_2 u(a))
$
其中
$
  overline(Gamma) = gamma^0 Gamma^dagger gamma^0
$
显示b的自旋，利用$u overline(u)$的完备性
$
  sum_(s_b) G & = sum_(s_b) (overline(u)(a) Gamma_1 u^(s_b)(b)) (overline(u)^(s_b)(b) overline(Gamma)_2 u(a)) \
              & = overline(u)(a) Gamma_1 (sum_(s_b) u^(s_b)(b) overline(u)^(s_b)(b)) overline(Gamma)_2 u(a) \
              & = overline(u)(a) Gamma_1 (gamma^mu p_mu + m c) overline(Gamma)_2 u(a) \
              & = overline(u)(a) cal(O) u(a)
$
对a的自旋求和，利用$u overline(u)$的完备性
$
  sum_(s_a) sum_(s_b) G & = sum_(s_a) (overline(u)^(s_a)(a) cal(O) u^(s_a)(a)) \
                        & = Tr(cal(O) sum_(s_a) u^(s_a)(a) overline(u)^(s_a)(a)) \
                        & = Tr(cal(O) (gamma^mu p_mu + m c)) \
                        & = Tr(cal(O) (cancel(p)_a + m_a c)) \
                        & = Tr(Gamma_1 (cancel(p)_a + m_a c) overline(Gamma)_2 (cancel(p)_a + m_a c)) \
$
得到Casimir窍门的公式
$
  sum_(s_a) sum_(s_b) G = Tr(Gamma_1 (cancel(p)_a + m_a c) overline(Gamma)_2 (cancel(p)_a + m_a c))
$
回到电子-缪子散射
$
  1/4 sum_(s_1, s_2, s_3, s_4) M^2(s_1, s_2, s_3, s_4) =& g_e^4/(p_1-p_3)^4 Tr(gamma^mu (cancel(p)_1 + m c) gamma^nu (cancel(p)_3 + m c)) Tr(gamma_mu (cancel(p)_2 + m c) gamma_nu (cancel(p)_4 + m c))\
  =& (8 g_e^4)/((p_1-p_3)^4) ((p_1 dot p_2)(p_3 dot p_4) + (p_1 dot p_4)(p_2 dot p_3) \
    & - (p_1 dot p_3)(m_mu c)^2 - (p_2 dot p_4)(m_e c)^2 + 2 (m_e m_mu c^2)^2)
$

== 截面

莫特和卢瑟福散射

$m$射到$M$靶上，$m<<M$有
- 碰撞前：$E, vb(p)_1$
- 碰撞后：$E, vb(p)_3, theta$
质心系两体散射微分截面为
$
  dv(sigma, Omega) = ((hbar c)/(8 pi))^2 (S abs(M))/(E_1 + E_2)^2 abs(vb(p)_f)/abs(vb(p)_i)
$
靶粒子$M$非常重，入射粒子能动量较小，$E<<M$；有近似：质心系与实验室系（$M$的静止系）趋同
$
  abs(vb(p)_f) = abs(vb(p)_i)\
  E_1 + E_2 = E_1 + M c^2 approx M c^2
$
则有
$
  dv(sigma, Omega) = ((hbar c)/(8 pi))^2 (S abs(M))/(M c^2)^2
$
且有
$
  p_1 = mat(E/c; vb(p)_1), p_2 = mat(M c; vb(0)), p_3 = mat(E/c; vb(p)_3), p_4 = mat(M c; vb(0))
$
并且
$
  vb(p)_1 dot vb(p)_3 = vb(p)^2 cos theta
$

== 重整化与跑动耦合常数

电子缪子散射，包括真空极化图，如上一章结尾的分析，会有发散的部分。

树图贡献
$
  M_1 = - g_e^2 (overline(u)(3) gamma^mu u (1)) g_(mu nu)/q^2 (overline(u) (4) gamma^nu u (2))
$
真空极化圈图贡献
$
  M_2 = (i g_e^2)/q^4 (overline(u)(3) gamma^mu u (1)) I_(mu nu) (overline(u) (4) gamma^nu u (2))
$
其中
$
  I_(mu nu) = - g_e^2 integral dd(k, 4)/(2 pi)^4 Tr(gamma_mu (cancel(k) + m c) gamma_nu (cancel(k) - cancel(q) + m c))/((k^mu k_mu - m^2 c^2)((cancel(k)+cancel(q))^mu (cancel(k)+cancel(q))_mu - m^2 c^2))
$
具体计算这里略去，有
$
  I_(mu nu) = - i g_(mu nu) q^2 I(q^2)
$
其中
$
  I(q^2) = (g_e^2)/(12 pi^2) (integral_(m^2)^oo dd(z)/z - f((-q^2)/(m^2 c^2)))
$
引入一个能标截断$M$
$
  I(q^2) = (g_e^2)/(12 pi^2) (ln(M^2/m^2) - f((-q^2)/(m^2 c^2)))
$
就有
$
  I_(mu nu) = - i g_(mu nu) q^2 (g_e^2)/(12 pi^2) (ln(M^2/m^2) - f((-q^2)/(m^2 c^2)))
$
散射过程总的振幅，两个振幅相加
$
  M &= M_1 + M_2\
  &= - g_e^2 (overline(u)(3) gamma^mu u (1)) g_(mu nu)/q^2 (overline(u) (4) gamma^nu u (2)) (1 - (g_e^2)/(12 pi^2) (ln(M^2/m^2) - f((-q^2)/(m^2 c^2))))
$
核心系数
$
  g_e^2 (1 - (g_e^2)/(12 pi^2) (ln(M^2/m^2) - f((-q^2)/(m^2 c^2))))
$
分别为树图贡献和真空极化圈图贡献，其中有一个发散的部分$ln(M^2/m^2)$，以及一个有限的部分$f((-q^2)/(m^2 c^2))$。我们常见的物理过程$q^2 -> 0$，$f(q^2)->0$，则
$
  g_e^2 (1 - (g_e^2)/(12 pi^2) ln(M^2/m^2))
$
这个结果（除以$4 pi$）应该是我们实验上测量得到的$alpha$（1/137），$g_e^2 = sqrt(4 pi alpha)$。定义重整化后的相互作用强度$g_R^2(M)$为
$
  g_R^2(M) = g_e^2 (1 - (g_e^2)/(12 pi^2) ln(M^2/m^2))\
  g_R^2/(4 pi) = alpha approx 1/137
$
下一步利用$g_R^2$重写核心系数，重整化后的系数
$
  g_R^2 (1 + (g_R^2)/(12 pi^2) f((-q^2)/(m^2 c^2)))
$
