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
#newpara()

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
