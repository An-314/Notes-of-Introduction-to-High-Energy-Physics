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

= 相对论运动学

== 量纲和自然单位制

*高能物理中的能量单位 eV*
- 能量单位：electron volt (eV)
  - $1"eV"$ = 带一个电子电荷$abs(e)$的粒子，通过一个$1"V"$的电场加速，所获得的能量 = $1.6 times 10^(-19)"J"$
  - 一些常用的单位：
    - $1"keV"$ = $10^3"eV"$
    - $1"MeV"$ = $10^6"eV"$
    - $1"GeV"$ = $10^9"eV"$
    - $1"TeV"$ = $10^12"eV"$
*高能粒子的速度大小*
- 一个热中子的动能为$0.026"eV"$，速度
  $
    v = sqrt((2 T)/m) = sqrt((2 times 0.026"eV")/(0.93956 times 10^9"eV"\/c^2)) = 2200 "m/s"
  $
- LHC实验上质子束流的能量为$4"TeV"$，速度
  $
    T = (m_p c^2)/sqrt(1 - v^2/c^2) - m_p c^2 => v = c sqrt(1 - ((m_p c^2)/T)^2) = 0.99999997 c
  $
*可见光的能量*
- 红光（700 nm）和紫光（400 nm）的能量
  $
    E(700"nm") = h nu = 6.588 times 10^(-25) times 2 pi "GeV s" (3 times 10^8 "m/s") / (700 times 10^(-9) "m") = 1.77 "eV"\
  $
  $
    E(400"nm") = h nu = 6.588 times 10^(-25) times 2 pi "GeV s" (3 times 10^8 "m/s") / (400 times 10^(-9) "m") = 3.09 "eV"
  $
*自然单位制 Natural Unit*
- 相对论能动量方程：
  $
    E^2 = (m c^2)^2 + (p c)^2
  $
  省略掉$c$，即$c=1$，得到
  $
    E^2 = m^2 + p^2
  $
  这时*能量、质量和动量的单位都是eV，长度和时间的单位是$1\/"eV"$，速度的单位是$1$，即无量纲的数值；需要的时候，再把$c$或$c^2$除回去*
  $
    p -> p/c, m -> m/c^2
  $
- 其中也有
  $
    v = (p c^2)/E, v/c = (p c)/E => beta = p/E
  $
  $
    p = (m beta)/sqrt(1 - beta^2), E = m/sqrt(1 - beta^2)
  $
  如需要回到正常单位，$p$仍需要把$c$除回去

*自然单位制举例*
- 质量举例
  - 质子：938.272$"MeV"\/c^2$
  - 中子：939.565$"MeV"\/c^2$
  - 这是我们解释自由中子可以衰变的原因之一
- 动量举例
  - 动量：$3"GeV"\/c$
- 能量举例
  - 能量：$50"GeV"$

*位移，时间的自然单位制*
- 自然单位制中，$c=1, hbar=1$
  $
    hbar c = 0.198 times 10^(-15) "GeV m" = 1
  $
  从而有
  $
    1 "GeV"^(-1) = 0.198 "fm"
  $
  例如
  $
    lambda = hbar c (2pi)/E = 1/(3.2 "eV") hbar c times 2 pi
  $
  $
    hbar = 6.588 times 10^(-25) "GeV s" = 1 => 1 "GeV"^(-1) = 6.59 times 10^(-25) "s"
  $

== Lorenz变换

Lorenz变换是描述在不同惯性参考系之间坐标和时间如何转换的方程。对于一个以速度$v$沿$x$轴运动的参考系，Lorenz变换的矩阵形式：
$
  mat(x'; y'; z'; t') = mat(gamma, -gamma beta, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; -gamma beta, gamma, 0, 1) mat(x; y; z; t)
$
其中
$
  gamma = 1 / sqrt(1 - beta^2), beta = v / c
$
在狭义相对论中，Lorenz变换保持了物理定律的形式不变，并且是线性的。它描述了时间膨胀、长度收缩和相对论性动量等现象。

*同时的相对性*
- 在一个参考系中同时发生的事件，在另一个以相对速度运动的参考系中可能不再同时发生。这是因为时间和空间的测量依赖于观察者的运动状态。
- S系有两个同时事件$(t_A, x_A)$和$(t_B, x_B)$，满足$t_A = t_B$。在另一个以速度$v$运动的参考系S'中，这两个事件的时间坐标为：
$
  t'_A = gamma (t_A - beta/c x_A), t'_B = gamma (t_B - beta/c x_B)\
  t'_A - t'_B = gamma beta/c (x_B - x_A)
$

*Lorenz收缩，长度变短*
- $S'$中的长棒，延$x、x'$方向长度为$L'$
- 长棒$L'$在$S'$中的顶点位置为（$x'=0,x'=L'$）
- $S$中$t=0$时刻，$S$中长棒的顶点位置为
  $
    0 = gamma (0 - beta/c 0), L' = gamma (0 - beta/c 0) => L = L' / gamma
  $
  运动的长度比静止的长度短

*时间膨胀*

== 四矢量

用*四矢量*标记空间和时间坐标：
$
  mat(x^0; x^1; x^2; x^3) = mat(c t; x; y; z)
$
Lorenz变换可以表示为四矢量的线性变换：
$
  x^mu' = Lambda^mu_nu x^nu
$
这里使用了Einstein求和约定，其中$Lambda^mu_nu$是Lorenz变换矩阵
$
  Lambda^mu_nu = mat(gamma, -gamma beta, 0, 0; -gamma beta, gamma, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1)
$
#newpara()

四矢量有Lorenz不变的内积：
$
  I = (x^0)^2 - (x^1)^2 - (x^2)^2 - (x^3)^2 = (c t)^2 - x^2 - y^2 - z^2
$
这里引入度规张量$g_(mu nu)$
$
  g = mat(1, 0, 0, 0; 0, -1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1)
$
即
$
  g_00 = - g_11 = - g_22 = - g_33 = 1, g_(mu nu) = 0 (mu != nu)
$
四矢量的内积可以写成
$
  I = g_(mu nu) x^mu x^nu
$
该内积在Lorenz变换下保持不变，即$I' = I$，这表明四矢量的长度是一个Lorenz不变量。

上下指标也被称为*逆变量和协变量*
- 逆变量，原来的四矢量
  $
    x^mu = mat(x^0; x^1; x^2; x^3)
  $
- 协变量，使用度规张量将逆变量转换为协变量
  $
    x_mu = g_(mu nu) x^nu = mat(x_0; x_1; x_2; x_3) = mat(c t; -x; -y; -z)
  $
  - 这样，Lorenz不变量可以写成
    $
      I = g_(mu nu) x^mu x^nu = x^mu x_mu
    $
- 四矢量标积
  $
    a b = a dot b = a_0 b^0 - vb(a) dot vb(b)\
    a^2 = a dot a = a_0^2 - vb(a) dot vb(a)
  $

== 能量和动量

*速度，原速度，动量*
- 速度的Lorenz变换是有些复杂的，沿着坐标系变换方向的速度要变换，垂直于坐标系变换方向的速度也要变换
- 定义*原速度*：
  $
    vb(eta) = dv(vb(x), tau)
  $
  其中$tau$是粒子的固有时间，即粒子质心系时间，是Lorenz不变的。
- 定义*动量*：
  $
    vb(p) = m vb(eta) = m gamma vb(v)
  $
*能动量四矢量*
- 定义能动量四矢量：
  $
    p^mu = mat(p^0; vb(p)) = mat(E/c; vb(p))
  $
  其中$E$是粒子的能量，满足关系式
  $
    E^2 = (m c^2)^2 + (p c)^2 = (gamma m c^2)^2
  $
  $
    vb(p) = m vb(eta) = m gamma vb(v)
  $
- 其Lorenz不变量为
  $
    p_mu p^mu = (E/c)^2 - vb(p) dot vb(p) = (m c)^2
  $
- Lorenz变换下能动量四矢量的变换为
  $
    p^mu' = Lambda^mu_nu p^nu
  $
  其中$Lambda^mu_nu$是Lorenz变换矩阵
- 光子的能动量四矢量满足
  $
    p_mu p^mu = 0, E = p c = h nu
  $
  因此光子是无质量粒子
*高速粒子的动量和能量*
- 低速情况下，比如宏观物体，相对论公式的低能近似
  $
    p = m v, T = 1/2 m v^2 = p^2 /(2 m)
  $
- 高速情况下，质量非零微观粒子能达到近光速
  $
    p = (m v)/sqrt(1 - v^2/c^2), E = (m c^2)/sqrt(1 - v^2/c^2), v = (p c^2)/E, E = c sqrt((m c)^2 + p^2)
  $

== 碰撞

*相对论碰撞*
- *能量守恒*
  $
    E_"i" = E_"f"
  $
- *动量守恒*
  $
    vb(p)_"i" = vb(p)_"f"
  $
- *Lorenz不变量守恒*
  $
    p_mu p^mu = p'_mu p'^mu
  $
- 但*没有质量守恒*
  $
    pi^0 -> gamma gamma
  $
  质量非零粒子可以衰变成质量为零的粒子，反之亦然

#example[
  两块泥土，每个质量都为$m$，以$3/5 c$速度对撞，然后粘在一起，求最后组成的土块质量。
]

#solution[
  $
    E_1 + E_2 = E_M\
    vb(p)_1 + vb(p)_2 = vb(p)_M = 0 => vb(p)_1 = - vb(p)_2\
  $
  从而
  $
    M = 2 E = 2 m/sqrt(1 - beta^2) = 5/2 m
  $
]

#example[
  一个粒子，质量为$M$，衰变成两半，质量各为$m$，求各自的速度。
]

#solution[
  $
    M = 2 E = 2 m/sqrt(1 - beta^2) => gamma = M/(2 m) => v = c sqrt(1 - (2 m/M)^2)
  $
]

#example[
  一个静止的$pi$，衰变成$mu$和中微子，求$mu$的速度。
]

#solution[
  $
    E_nu + E_mu = E_pi, vb(p)_nu + vb(p)_mu = 0 => vb(p)_nu = - vb(p)_mu\
  $
  衰变后
  $
    E_pi = m_pi = sqrt(m_mu^2 + p_mu^2) + sqrt(m_nu^2 + p_nu^2) = sqrt(m_mu^2 + p_mu^2) + p_mu\
  $
  从而
  $
    p_mu = (m_pi^2 - m_mu^2) / (2 m_pi)\
    E_mu = sqrt(m_mu^2 + p_mu^2)= (m_pi^2 + m_mu^2) / (2 m_pi)
  $
  速度为
  $
    beta_mu = p_mu / E_mu = (m_pi^2 - m_mu^2) / (m_pi^2 + m_mu^2) => v_mu = beta_mu c
  $
]

#example[
  通过反应$p + p -> p + p + p +macron(p)$产生反质子，起始粒子是一个高能质子撞向一个静止质子，求反应阈值。
]

#solution[
  考虑质心系，极限是所有粒子没有动能。

  实验室系中
  $
    p_"TOT" = mat(E + m; p; 0; 0)
  $
  质心系中
  $
    p_"TOT" = mat(4 m; 0; 0; 0)
  $
  利用相对论不变量将实验室系和质心系联系起来：
  $
    p_(mu "TOT") p^mu_"TOT" = p'_(mu "TOT") p'^mu_"TOT"\
    (E + m)^2 - p^2 = (4 m)^2 => E = 7 m
  $
  动能
  $
    T = E - m = 6 m
  $
  撞向静止靶的质子的动能要达到6撞向静止靶的质子的动能要达到$6 m c^2$才能产生反质子
]

#example[
  两个全同粒子迎头对撞，质量为$m$，动能为$T$，问相对动能（在一个粒子静止的系中，另一个的动能）。
]

#solution[
  质心系中
  $
    p_"TOT" = mat(2 (T + m); 0; 0; 0)
  $
  一个粒子的静止系
  $
    p'_"TOT" = mat(T' + m + m; p'; 0; 0)
  $
  同样利用相对论不变量联系两个系：
  $
    p_(mu "TOT") p^mu_"TOT" = p'_(mu "TOT") p'^mu_"TOT"\
    (2 (T + m))^2 = (T' + 2 m)^2 - p'^2
  $
  其中
  $
    (T' + m)^2 - m^2 = p'^2
  $
  就有
  $
    T' = 4 T(1 + T/(2 m))
  $
  质心系的对撞中的$T=1$GeV，在固定靶实验中的则需要更大的能量才能达到相同的效果。
]

#newpara()

*类时，类空，类光的说法*
$
  a^2 = a_0^2 - vb(a) dot vb(a)
$
- $a^mu$类时，如果$a^2 > 0$，则存在一个参考系使得$a^mu$的空间部分为零，即$a^mu = (a_0; 0; 0; 0)$，在这个参考系中，$a^mu$的时间分量为$a_0$，空间分量为零。
- $a^mu$类空，如果$a^2 < 0$，则存在一个参考系使得$a^mu$的时间分量为零，即$a^mu = (0; vb(a))$，在这个参考系中，$a^mu$的时间分量为零，空间分量为$vb(a)$。
- $a^mu$类光，如果$a^2 = 0$，则对于任何参考系，$a^mu$的时间分量和空间分量满足$a_0^2 = vb(a) dot vb(a)$，即$a^mu$的时间分量等于空间分量的模长。

*粒子散射过程*
- 湮灭
  - $a$和$b$湮灭生成的中间态粒子的质量$sqrt(s)$
    $
      s & = (E_a + E_b)^2 - (vb(p)_a + vb(p)_b)^2 \
        & = (E_c + E_d)^2 - (vb(p)_c + vb(p)_d)^2
    $
  - 例如，在质心系中易计算出总动量为0，s一定是大于0的，类时过程
- 交换
  - $a$和$b$的散射还可以通过交换一个粒子完成


== 角分布

*粒子衰变的角分布*
- *角分布*带着粒子的重要信息：*自旋，极化*
  - 一个无自旋的粒子$pi^0$，在质心系中的衰变过程，末态粒子的发射方向没有倾向性，各向同性
  - 对自旋$1/2$的粒子，发射粒子有倾向性

*$Lambda$粒子自旋$1/2$*
$
  Lambda -> p + pi^-
$
- $Lambda$的自旋是$1/2$，$p$的自旋也是$1/2$，$pi^-$的自旋是$0$
- 给定$z$轴，$Lambda$的自旋是沿着该轴的$+1/2$；沿着$z$轴，如果$p$向上发射，它必须也是右手的，这个振幅为$a$
- 给定$z$轴，$Lambda$的自旋是反向沿着该轴的$-1/2$；沿着$z$轴，如果$p$向上发射，它必须也是左手的，这个振幅为$b$
- 给定$z'$轴，$Lambda$的沿着$z$轴的$1/2$自旋投影到$z'$
  $
    braket(z'\, + 1/2, z\, 1/2) = cos(theta/2), braket(z'\, - 1/2, z\, 1/2) = sin(theta/2)
  $
  在$theta$方向的概率为
  $
    P(theta) = a^2 cos^2(theta/2) + b^2 sin^2(theta/2) = beta(1 + alpha cos theta)
  $

== 角分布的Lorenz变换
