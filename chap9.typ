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

= 弱作用

== 带电轻子的弱作用

我们先给出弱相互作用的传播子和顶角规则，然后用它们计算逆缪子衰变与缪子衰变，最后推出缪子的能谱和寿命。

弱相互作用由$W^(±)$和$Z_0$传播。它们是有质量的矢量玻色子，质量大约是
$
  M_W = 80 "GeV", M_Z = 91 "GeV"
$
对一个有质量矢量玻色子，它的传播子大致写成
$
  (-i(g_(mu nu) - (q_mu q_nu) /(M^2 c^2))) / (q^2 - M^2c^2)
$
这里$q$是传播子上传递的四动量。

弱作用的一个重要特点是：在很多低能过程中，传递动量远小于$W\/Z$的质量尺度：
$
  q^2 << M_W^2 c^2, M_Z^2 c^2
$
因此*弱作用传播子近似变成一个常数*
$
  (- i g_(mu nu))/(M^2 c^2)
$
它意味着在低能情形下，$W$传播的过程可以近似成一个四点接触相互作用，也就是Fermi弱相互作用的图像。

弱作用*顶角因子*写成
$
  (- i g_w)/(2 sqrt(2)) gamma^mu (1 - gamma^5)
$
其中
- $g_w$是弱相互作用耦合常数
- $gamma^mu$代表矢量耦合, Vector coupling
- $gamma^5$代表轴矢量耦合, Axial vector coupling
- $gamma^mu (1 - gamma^5)$被称作$V-A$理论，矢量加轴矢量在一起有最大的宇称破缺
弱作用是只耦合到左手手征部分。也就是说，弱带电流具有最大宇称破坏。这一点和电磁相互作用很不一样。电磁相互作用的顶角是
$
  (- i e) gamma^mu
$
左右手都一样耦合；弱带电流则有
$
  (- i g_w)/(2 sqrt(2)) gamma^mu (1 - gamma^5)
$
会选择左手部分。

下面计算逆$mu$衰变
$
  nu_mu + e^- -> mu^- + nu_e
$
虽然现实中不容易实现，但计算简单；按照Feynman规则，写出振幅的表达式
$
  M = g_w^2/(8 (M_W c)^2) (overline(u)(3) gamma^mu (1 - gamma^5) u(1)) (overline(u)(4) gamma_mu (1 - gamma^5) u(2))
$
对初末自旋求和，使用Casimir's trick，得到
$
  sum_"spin" abs(M)^2 = & (g_w^4)/(64 M_W^4 c^4) Tr(gamma^mu (1 - gamma^5) (cancel(p)_1 + m_mu c) gamma_nu (1 - gamma^5) cancel(p)_3) Tr(gamma_mu (1 - gamma^5) (cancel(p)_2 + m_mu c) gamma^nu (1 - gamma^5) cancel(p)_4)\
  = & 4 ((g_w)/(M_W c))^4 (p_1 dot p_2) (p_3 dot p_4)
$
中微子只有左手的，总振幅减半
$
  expval(abs(M)^2) = 2 ((g_w)/(M_W c))^4 (p_1 dot p_2) (p_3 dot p_4)
$
回到质心系，忽略电子质量
$
  expval(abs(M)^2) = 8 ((g_w E)/(M_W c))^4 (1 - ((m_mu c^2)/(2 E))^2)^2
$
带入两体散射的截面公式
$
  dv(sigma, Omega) = 1/2 ((hbar c g_w^2 E)/(4 pi (M_W c^2)^2))^2 (1 - ((m_mu c^2)/(2 E))^2)^2
$
对角度积分，求总截面
$
  sigma = 1/(8 pi) ((hbar c g_w^2 E)/((M_W c^2)^2))^2 (1 - ((m_mu c^2)/(2 E))^2)^2
$
#newpara()

下面计算$mu$衰变
$
  mu^- -> e^- + nu_mu + overline(nu)_e
$
相空间复杂，但是没有圈图，不需要重整化，树图就很精确；可以简化成4点Fermi相互作用。

振幅形式和逆$mu$衰变几乎一样：
$
  M = g_w^2/(8 (M_W c)^2) (overline(u)(3) gamma^mu (1 - gamma^5) u(1)) (overline(u)(4) gamma_mu (1 - gamma^5) v(2))
$
其中$u, v$分别是中微子和反中微子的自旋函数。对自旋求和，得到
$
  expval(abs(M)^2) = 2 ((g_w)/(M_W c))^4 (p_1 dot p_2) (p_3 dot p_4)
$
取$mu$的静止系
$
  p_1 = mat(m_mu c; 0)
$
有
$
  p_1 dot p_2 = m_mu E_2, p_3 dot p_4 = ((m_mu^2 - m_e^2) c^2)/2 - m_mu E_2
$
取电子的质量为零，一个近似
$
  expval(abs(M)^2) & = ((g_w)/(M_W c))^4 m_mu^2 E_2 (m_mu c^2 - 2 E_2) \
                   & = ((g_w^2 m_mu)/(M_W^2 c))^2 abs(vb(p)_2) (m_mu c - 2 abs(vb(p)_2))
$
而衰变率的一般公式是
$
  dd(Gamma) = abs(M)^2/(2 m_mu c^2) dd(Phi_3)
$
其中$Phi_3$是三体相空间
$
  dd(Gamma) = expval(abs(M)^2)/(2 hbar m_mu) dd(vb(p)_2)/((2 pi)^3 2 abs(vb(p)_2)) dd(vb(p)_3)/((2 pi)^3 2 abs(vb(p)_3)) dd(vb(p)_4)/((2 pi)^3 2 abs(vb(p)_4)) (2 pi)^4 delta^4(p_1 - p_2 - p_3 - p_4)
$
这是一个三体衰变，我们必须回到之前的相空间积分公式，逐步计算；粒子4是末态的电子，我们希望最后的衰变率是电子能量的函数，方便和实验做对比。

$E_4$是我们希望剩下的变量，处理顺序是$vb(p)_3, vb(p)_4, vb(p)_2$
$
  dd(Gamma) &= expval(abs(M)^2)/(2 hbar m_mu) dd(vb(p)_2)/((2 pi)^3 2 abs(vb(p)_2)) dd(vb(p)_3)/((2 pi)^3 2 abs(vb(p)_3)) dd(vb(p)_4)/((2 pi)^3 2 abs(vb(p)_4)) (2 pi)^4 delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_3) - abs(vb(p)_4)) delta^3(- vb(p)_2 - vb(p)_3 - vb(p)_4) \
  & = expval(abs(M)^2)/(16 (2pi)^5 hbar m_mu) (dd(vb(p)_2) dd(vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4) abs(vb(p)_2 + vb(p)_4)) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - abs(vb(p)_2 + vb(p)_4))\
  & = expval(abs(M)^2)/(16 (2pi)^5 hbar m_mu) (abs(vb(p)_2)^2 sin theta_24 dd(theta_24, phi_24, vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4) abs(vb(p)_2 + vb(p)_4)) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - abs(vb(p)_2 + vb(p)_4))\
  & = expval(abs(M)^2)/(16 (2pi)^4 hbar m_mu) (abs(vb(p)_2)^2 sin theta_24 dd(theta_24, vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4) abs(vb(p)_2 + vb(p)_4)) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - abs(vb(p)_2 + vb(p)_4))
$
定义$u$
$
  u = sqrt((abs(vb(p)_2)^2 + abs(vb(p)_4)^2 + 2 abs(vb(p)_2) abs(vb(p)_4) cos theta_24))
$
则
$
  dd(Gamma) & = expval(abs(M)^2)/(16 (2pi)^4 hbar m_mu) (abs(vb(p)_2)^2 dd(abs(vb(p)_2), cos theta_24, vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4) u) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - u)\
  & = expval(abs(M)^2)/(16 (2pi)^4 hbar m_mu) (abs(vb(p)_2)^2 dd(abs(vb(p)_2), vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4)) integral dd(cos theta_24)/u delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - u)
$
其中
$
  integral dd(cos theta_24)/u delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - u) &= integral dd(u)/(abs(vb(p)_2) abs(vb(p)_4)) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - u) \
  & = (mu_c - abs(vb(p)_2) - abs(vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4))
$
从而
$
  dd(Gamma) & = expval(abs(M)^2)/((4pi)^4 hbar m_mu) dd(abs(vb(p)_2), vb(p)_4)/abs(vb(p)_4)^2
$
经过前面的 delta 函数处理后，剩下的积分变量主要是$abs(vb(p)_2)$和$vb(p)_4$，它们的范围由三体末态的动量和能量守恒约束
$
  u_- < m_mu c - abs(vb(p)_2) - abs(vb(p)_4) < u_+\
  u_+ = abs(vb(p)_2) + abs(vb(p)_4), u_- = abs(abs(vb(p)_2) - abs(vb(p)_4))
$
确定的积分范围是
$
  abs(vb(p)_2) < 1/2 m_mu c, abs(vb(p)_4) < 1/2 m_mu c\
  abs(vb(p)_2) + abs(vb(p)_4) > 1/2 m_mu c
$
$
  dd(Gamma) & = (g_w/(4 pi M_W))^4 m_mu/(hbar c^2) dd(vb(p)_4)/abs(vb(p)_4)^2 integral_((m_mu c)/2 - abs(vb(p)_4))^((m_mu c)/2) abs(vb(p)_2)^3 (m_mu c - 2 abs(vb(p)_2)) dd(abs(vb(p)_2))\
  & = (g_w/(4 pi M_W))^4 m_mu/(hbar c^2) ((m_mu c)/2 - 2/3 abs(vb(p)_4)) dd(vb(p)_4)
$
表示成极坐标形式，并且有
$
  E = abs(vb(p)_4) c
$
则有
$
  dv(Gamma, E) = (g_w/(M_W c))^4 (m_mu^2 E^2)/(2 hbar (4 pi)^3) (1 - (4E)/(3 m_mu c^2))
$
与实验结果吻合非常好。

$mu$只有这么一个衰变过程，从而$mu$总的衰变率是上式对$E$的积分
$
  Gamma & = (g_w/(M_W c))^4 (m_mu^2 )/(2 hbar (4 pi)^3) integral_0^((m_mu c)/2) E^2(1 - (4E)/(3 m_mu c^2)) dd(E) \
        & = ((m_mu g_w)/M_W)^4 (m_mu^2 c^2)/(12 hbar (8 pi)^3)
$
寿命为
$
  tau = 1/Gamma = (12 hbar (8 pi)^3)/(m_mu^2 c^2) ((M_W)/(m_mu g_w))^4
$
带入相关的常数，可以得到$tau = 2.2 mu"s"$

== 弱电统一（联合理论）

=== 手征Fermion态

刚才讲到$V-A$理论
$
  (- i g_w)/(2 sqrt(2)) gamma^mu (1 - gamma^5)
$
$gamma^mu (1 - gamma^5)$是相互作用顶角结构的一部分；但也可以将它附着到粒子波函数上，定义左手态
$
  u_L (p) = (1 - gamma^5)/2 u(p)
$
其中
$
  gamma^5 = i gamma^0 gamma^1 gamma^2 gamma^3\
$
左右手投影算符
$
  hat(P)_L = (1 - gamma^5)/2, hat(P)_R = (1 + gamma^5)/2
$
$
  hat(P)_L + hat(P)_R = 1, hat(P)_L^2 = hat(P)_L, hat(P)_R^2 = hat(P)_R, hat(P)_L hat(P)_R = 0
$
它们确实是在把一个旋量分解成两个互不重叠的部分。

定义左手态和右手态
$
  u_L (p) = hat(P)_L u(p), u_R (p) = hat(P)_R u(p)
$
其伴随表示
$
  overline(u)_L (p) = overline(u)(p) hat(P)_R, overline(u)_R (p) = overline(u)(p) hat(P)_L
$
定义流
$
  j_mu^- = overline(u) gamma^mu (1 - gamma^5) u = 2 overline(u)_L gamma^mu u_L\
$
弱带电流本质上是左手Fermion和左手Fermion之间的相互作用。

注意：这里的“左手、右手”是手征性 chirality，严格说不完全等同于螺旋度 helicity。对无质量粒子二者相同；对有质量粒子二者不完全相同。但弱相互作用的理论结构是按手征性来写的。

=== 左手二重态，右手单态

接下来开始把粒子按照$"SU"(2)_L$来组织。

弱相互作用只作用在左手二重态上。对轻子来说，每一代轻子可以写成一个左手二重态：
$
  l^i_L = mat(nu_l; l)_L = hat(P)_L mat(nu_l; l)
$
具体来说三代分别是
$
  l^1_L = mat(nu_(e L); e^-_L), l^2_L = mat(nu_(mu L); mu^-_L), l^3_L = mat(nu_(tau L); tau^-_L)
$
上分量是对应的中微子，下分量是对应的带电轻子。二重态可以在$"SU"(2)$变化下变换；而右手态是单态，不参与$"SU"(2)$变化。这正是弱相互作用最大宇称破坏的数学体现。

右手态是单态
$
  l_(i R) = hat(P)_R l_i
$
它们不组成二重态，也不参与$W$的带电流相互作用。

中微子没有右手态，如果想引入中微子质量，这里可以引入。在最小标准模型里没有右手中微子，因此中微子原本是无质量的。现代实验已经知道中微子有质量，所以更完整的理论常常要扩展标准模型，比如引入右手中微子。

夸克也可以定义左手二重态和右手单态
$
  q_L^i = mat(u; d)_L, q_(i R) = hat(P)_R q_i
$
其中$i$是代数指标，$u, d$分别是上夸克和下夸克。每一代夸克都可以写成一个左手二重态和一个右手单态。具体
$
  q_L^1 = mat(u_L; d_L), q_L^2 = mat(c_L; s_L), q_L^3 = mat(t_L; b_L)\
$
$
  u_(1 R) = u_R, d_(1 R) = d_R, u_(2 R) = c_R, d_(2 R) = s_R, u_(3 R) = t_R, d_(3 R) = b_R
$

=== 电弱统一理论

电弱统一的规范群是
$
  "SU"(2)_L times "U"(1)_Y
$
其中
- $"SU"(2)_L$是弱同位旋群，作用在左手二重态上
- $"U"(1)_Y$是弱超荷群，作用在所有态上
它们和电荷之间满足 Gell-Mann–Nishijima 型关系：
$
  Q = I_3 + Y/2
$
其中
- $I$是弱同位旋，注意，不是之前讲的强子同位旋
  - 前页介绍的轻子、夸克二重态，弱同位旋$I$为$1/2$上分量为$I_3$为$+1/2$，下分量为$I_3$为$-1/2$
  - 右手单态$I$为$0$
- $Y$是弱超荷
  - 由轻子电荷可以推知弱超荷
    - 左手二重态的弱超荷$Y = -1$
    - 右手单态的弱超荷$Y = -2$
  - 弱夸克
    - $Y(q_L^i) = 1/3$
    - $Y(u_(i R)) = 4/3$
    - $Y(d_(i R)) = -2/3$
- $Q$是电荷

引入定域的弱同位旋$"SU"(2)$变换，以及弱超荷$"U"(1)$变换不变性，对应会有4个规范场
$
  cal(L) = & overline(q)_L^i i gamma^mu (partial_mu - i g T^j A_mu^j - i g'/2 Y B_mu) q_L^i \
           & + overline(u)_R^i i gamma^mu (partial_mu - i g'/2 Y B_mu) u_R^i \
           & + overline(d)_R^i i gamma^mu (partial_mu - i g'/2 Y B_mu) d_R^i \
$
$"SU"(2)_L$有三个生成元$T^j = tau^j/2$，其中$tau^j$是Pauli矩阵，所以引入三个规范场
$
  A_mu^1, A_mu^2, A_mu^3
$
$"U"(1)_Y$有一个生成元，$Y$是超荷，所以引入一个规范场
$
  B_mu
$
总共四个规范场。$g,g'$分别是$"SU"(2)_L$和$"U"(1)_Y$的耦合常数。

对应的协变导数是
$
  D_mu = partial_mu - i g T^j A_mu^j - i g'/2 Y B_mu
$
矩阵形式为
$
  D_mu = & partial_mu - i/2 mat(
             g A_mu^3 + Y g' B_mu, g (A_mu^1 - i A_mu^2);
             g (A_mu^1 + i A_mu^2), - g A_mu^3 + Y g' B_mu
           )
$
这个矩阵的非对角元会把二重态的上、下分量相互转化。比如对夸克二重态：
$
  mat(u_L; d_L)
$
非对角元会
$
  u_L <-> d_L
$
这就是$W^(plus.minus)$介子的带电流相互作用。因此定义$W^(plus.minus)$规范场
$
  W_mu^(plus.minus) = (A_mu^1 minus.plus i A_mu^2)/sqrt(2)
$
它们是$"SU"(2)_L$的非对角生成元对应的规范场，带电荷，介导带电流相互作用。从而$D_mu$可以写为
$
  D_mu = & partial_mu - i/2 mat(
             g A_mu^3 + Y g' B_mu, g W_mu^+;
             g W_mu^-, - g A_mu^3 + Y g' B_mu
           )
$
这里的$W$还是没有质量的，稍后会通过Higgs机制获得质量。

再做替换
$
  A_mu^3 = cos theta_W Z_mu + sin theta_W A_mu\
  B_mu = - sin theta_W Z_mu + cos theta_W A_mu
$
这里的$A_mu$和$Z_mu$是光子场和$Z$Boson场，$theta_W$是Weinberg角
$
  sin theta_W = g'/(sqrt(g^2 + g'^2)), cos theta_W = g/(sqrt(g^2 + g'^2))
$
从而对于二重态$D_mu$可以写成
$
  D_mu = & partial_mu - i/2 mat(
             g sin theta_W (1 + Y) A_mu + g (cos^2 theta_W - Y sin^2 theta_W)/(cos theta_W) Z_mu, g W_mu^+;
             g W_mu^-, g sin theta_W (1 - Y) A_mu - g (cos^2 theta_W - Y sin^2 theta_W)/(cos theta_W) Z_mu
           )
$
经过替换，已经把4个$"SU"(2)_L times "U"(1)_Y$规范场替换成了$W^+, W^-, Z, A$四个物理场。$W^+, W^-$是带电的，$Z, A$是中性的。$A$是光子，$Z$是Z Boson。

对于单态
$
  partial_mu - i g'/2 Y B_mu = partial_mu - i g Y/2 (sin theta_W A_mu - (sin^2 theta_W)/(cos theta_W) Z_mu)
$
全部替换到Lagrange量中，并带入二重态和单态的超荷数值
$
  cal(L) = & overline(q)_L^i i gamma^mu partial_mu q_L^i \
  & + overline(q)_L^i gamma_mu mat(
    2/3 g sin theta_W A_mu + g (cos^2 theta_W - 1/3 sin^2 theta_W)/(cos theta_W) Z_mu, g W_mu^+;
    g W_mu^-, - 1/3 g sin theta_W A_mu - g (cos^2 theta_W - 1/3 sin^2 theta_W)/(cos theta_W) Z_mu
  ) q_L^i\
  & + overline(u)_R^i i gamma^mu partial_mu u_R^i + overline(u)_R^i gamma_mu (2/3 sin theta_W A_mu - 2/3 (sin^2 theta_W)/(cos theta_W) Z_mu) u_R^i\
  & + overline(d)_R^i i gamma^mu partial_mu d_R^i + overline(d')_R^i gamma_mu (- 1/3 sin theta_W A_mu + 1/3 (sin^2 theta_W)/(cos theta_W) Z_mu) d'_R^i
$
其中$d'$是CKM转动后的下型夸克。也就是说，弱相互作用中的下型夸克态不是质量本征态，而是混合态：
$
  d'_i = "CKM"_(i j) d_j
$
全部展开，合并得到
$
  cal(L) = & overline(u)_i i gamma^mu partial_mu u_i + overline(d)_i i gamma^mu partial_mu d_i \
  & + g/(2 sqrt(2)) overline(d')_i gamma^mu (1 - gamma^5) u_i W_mu^- + g/(2 sqrt(2)) overline(u)_i gamma^mu (1 - gamma^5) d'_i W_mu^+\
  & + g/(4 cos theta_W) overline(u)_i gamma^mu ((1 - 8/3 sin^2 theta_W) - gamma^5) u_i Z_mu + g/(4 cos theta_W) overline(d')_i gamma^mu ((1 - 4/3 sin^2 theta_W) - gamma^5) d'_i Z_mu\
  &+ g sin theta_W (2/3 overline(u)_i gamma^mu u_i - 1/3 overline(d)_i gamma^mu d_i) A_mu
$
其中Weinberg角$theta_W$的数值由实验测量得到
$
  sin^2 theta_W = 0.23
$
电磁耦合强度
$
  e = g sin theta_W
$
其中：
- 第一行是夸克的自由传播项
- 第二行是$W$介子带电流相互作用
  - W只耦合左手夸克
  - $W^+: d->u$，$W^-: u->d$
- 第三行是$Z$介子中性流相互作用
  - $Z$耦合到左右手夸克，耦合强度不同
  - $Z: u->u, d->d$
  - 它不是简单的纯$V-A$结构，而是同时包含矢量耦合和轴矢量耦合
    $
      gamma_mu (g_V - g_A gamma^5)
    $
    对不同Fermion，$g_V$和$g_A$不同，取决于它们的$I_3$、$Q$和$sin^2 theta_W$
- 第四行是光子介导的电磁相互作用
  - 光子耦合到左右手夸克，耦合强度相同
  - $A: u->u gamma, d->d gamma$
  - 它是
    $
      e (2/3 overline(u)_i gamma^mu u_i - 1/3 overline(d)_i gamma^mu d_i) A_mu
    $
    这正是普通 QED 形式
    $
      e Q_f overline(psi)_f gamma^mu psi_f A_mu
    $
    所以电磁相互作用从电弱统一中自然出现，而且电荷正好是
    $
      Q = I_3 + Y/2
    $
