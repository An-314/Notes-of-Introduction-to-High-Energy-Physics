#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第十二次作业],
  author: "Anzreww",
  time: "2026年6月",
)

#exercise(subname: [])[
  Higgs机制
]
#newpara()
利用之前的两个实场构建一个复场
$
  phi = phi_1 + i phi_2
$
于是
$
  phi^* phi = phi_1^2 + phi_2^2
$
Lagrange量为
$
  cal(L) = 1/2 (partial_mu phi)^* (partial^mu phi) + 1/2 mu^2 phi^* phi - 1/4 lambda^2 (phi^* phi)^2
$
这与前面的两个实标量场的Lagrange量等价。

这个复标量场$phi$有一个$"U"(1)$相位对称性
$
  phi -> e^(i theta) phi
$
和前面 Dirac 场一样，普通导数在局域相位变换下会多出一项，因此不能保持不变。所以要引入协变导数：
$
  cal(D)_mu = partial_mu + i q/(hbar c) A_mu
$
于是Lagrange量中的动能项改成
$
  cal(L) = 1/2 (cal(D)_mu phi)^* (cal(D)^mu phi) +
  1/2 mu^2 phi^* phi - 1/4 lambda^2 (phi^* phi)^2
$
这个Lagrange量在局域$"U"(1)$变换下保持不变。引入对称性自发破缺后，$phi$在非零真空附近展开
$
  eta = phi_1 - mu/lambda, xi = phi_2
$
也就是
$
  phi = (mu/lambda) + eta + i xi
$
代入Lagrange量，得到
$
  cal(L) =& (1/2 (partial_mu eta) (partial^mu eta) - mu^2 eta^2) + (1/2 (partial_mu xi) (partial^mu xi)) + (- 1/(16 pi) F^(mu nu) F_(mu nu) + 1/2 (q/(hbar c) mu/lambda)^2 A^mu A_mu) \
  & - 2i (mu/lambda q/(hbar c)) partial_mu xi A^mu + (q/(hbar c) (eta (partial_mu xi) - xi (partial_mu eta)) A^mu + mu/lambda (q/(hbar c))^2 eta (A_mu A^mu) \
    & + 1/2 (q/(hbar c))^2 (eta^2 + xi^2) A_mu A^mu - lambda mu (eta^3 + eta xi^2) - lambda^2/4 (eta^4 + 2 eta^2 xi^2 + xi^4)) + mu^4/(4 lambda^2)
$
其中会出现这样的结构
$
  1/2 (q/(hbar c) mu/lambda)^2 A^mu A_mu
$
正是规范场的质量项形式
$
  m_A = 2 sqrt(pi) (q mu)/(lambda c^2)
$
前面整体对称性自发破缺时，会出现无质量Goldstone场$xi$。但在局域规范理论里，这个Goldstone场可以通过规范选择消掉。选一个特殊的规范变换，使
$
  phi_2 = xi = 0
$
具体地，对复场做相位变换
$
  phi -> phi' = (cos theta + i sin theta) (phi_1 + i phi_2) = (cos theta phi_1 - sin theta phi_2) + i (sin theta phi_1 + cos theta phi_2)
$
选一个特殊的规范变换
$
  theta = - arctan(phi_2/phi_1)
$
则有
$
  phi' = sqrt(phi_1^2 + phi_2^2) + i 0
$
其中
- $eta$获得了质量，就是Higgs粒子（一个自旋0的标量粒子）
- $xi$被吸收掉了，不再是一个独立的物理粒子
- $A_mu$获得了质量，就是$W^(plus.minus),Z^0$等弱相互作用的载体（三个物理极化）


#exercise(subname: [])[
  计算缪子的寿命，从画图，振幅计算，直到得到2.2微秒的结果。
]
#newpara()
$mu$衰变
$
  mu^- -> e^- + nu_mu + overline(nu)_e
$
#figure(
  include "pic/12.1.typ",
  caption: [$mu$衰变的Feynman图],
)
按照Feynman规则，写出振幅的表达式
$
  M = g_w^2/(8 (M_W c)^2) (overline(u)(3) gamma^mu (1 - gamma^5) u(1)) (overline(u)(4) gamma_mu (1 - gamma^5) v(2))
$
其中$u, v$分别是中微子和反中微子的自旋函数。对自旋求和，使用Casimir's trick，得到
$
  sum_"spin" abs(M)^2 = & (g_w^4)/(64 M_W^4 c^4) Tr(gamma^mu (1 - gamma^5) (cancel(p)_1 + m_mu c) gamma_nu (1 - gamma^5) cancel(p)_3) Tr(gamma_mu (1 - gamma^5) (cancel(p)_2 + m_mu c) gamma^nu (1 - gamma^5) cancel(p)_4)\
  = & 4 ((g_w)/(M_W c))^4 (p_1 dot p_2) (p_3 dot p_4)
$
中微子只有左手的，总振幅减半
$
  expval(abs(M)^2) = 2 ((g_w)/(M_W c))^4 (p_1 dot p_2) (p_3 dot p_4)
$
取$mu$的静止系
$
  p_1 = mat(m_mu c; 0), p_2 = mat(E_2/c; vb(p)_2), p_3 = mat(E_3/c; vb(p)_3), p_4 = mat(E_4/c; vb(p)_4)
$
一般对中微子的质量取零限制
$
  p_2^2 = p_3^2 = 0 ==>\
  E_2 = abs(vb(p)_2) c, E_3 = abs(vb(p)_3) c
$
电子如果暂时保留质量，则
$
  p_4^2 = m_e^2 c^2 ==>\
  E_4 = sqrt(abs(vb(p)_4)^2 c^2 + m_e^2 c^4)
$
以及四动量守恒
$
  p_1 = p_2 + p_3 + p_4 ==>\
  m_mu c = E_2 + E_3 + E_4\
  vb(p)_2 + vb(p)_3 + vb(p)_4 = 0
$
有
$
              (p_3 + p_4)^2 & = (p_1 - p_2)^2 \
  m_e^2 c^2 + 2 p_3 dot p_4 & = m_mu^2 c^2 - 2 p_1 dot p_2 \
$
有
$
  p_1 dot p_2 = m_mu E_2, p_3 dot p_4 = ((m_mu^2 - m_e^2) c^2)/2 - m_mu E_2
$
取电子的质量为零
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
这是一个三体衰变，我们必须回到之前的相空间积分公式，逐步计算；粒子4是末态的电子，我们希望最后的衰变率是电子能量的函数，方便和实验做对比。$E_4$是我们希望剩下的变量，处理顺序是$vb(p)_3, vb(p)_4, vb(p)_2$
$
  dd(Gamma) &= expval(abs(M)^2)/(2 hbar m_mu) dd(vb(p)_2)/((2 pi)^3 2 abs(vb(p)_2)) dd(vb(p)_3)/((2 pi)^3 2 abs(vb(p)_3)) dd(vb(p)_4)/((2 pi)^3 2 abs(vb(p)_4)) (2 pi)^4 delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_3) - abs(vb(p)_4)) delta^3(- vb(p)_2 - vb(p)_3 - vb(p)_4) \
  & = expval(abs(M)^2)/(16 (2pi)^5 hbar m_mu) (dd(vb(p)_2) dd(vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4) abs(vb(p)_2 + vb(p)_4)) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - abs(vb(p)_2 + vb(p)_4))\
  & = expval(abs(M)^2)/(16 (2pi)^5 hbar m_mu) (abs(vb(p)_2)^2 sin theta_24 dd(theta_24, phi_24, vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4) abs(vb(p)_2 + vb(p)_4)) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - abs(vb(p)_2 + vb(p)_4))\
  & = expval(abs(M)^2)/(16 (2pi)^4 hbar m_mu) (abs(vb(p)_2)^2 sin theta_24 dd(theta_24, vb(p)_4))/(abs(vb(p)_2) abs(vb(p)_4) abs(vb(p)_2 + vb(p)_4)) delta(m_mu c - abs(vb(p)_2) - abs(vb(p)_4) - abs(vb(p)_2 + vb(p)_4))
$
定义$u$
$
  u = sqrt((abs(vb(p)_2)^2 + abs(vb(p)_4)^2 + 2 abs(vb(p)_2) abs(vb(p)_4) cos theta_24)) = abs(vb(p)_2 + vb(p)_4)
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
带入相关的常数，可以得到$tau = 2.2 mu"s"$s的结果。


#exercise(subname: [])[
  轻子部分的弱电统一理论
]

#newpara()

弱相互作用下Fermion的左手场和右手场行为不同
$
  psi_L = (1- gamma_5)/2 psi = hat(L) psi\
  psi_R = (1 + gamma_5)/2 psi = hat(R) psi
$
其中$hat(L), hat(R)$是左手、右手投影算符，满足
$
  hat(L) + hat(R) = 1, hat(L) hat(R) = 0, hat(L)^2 = hat(L), hat(R)^2 = hat(R)
$
弱相互作用是V-A的流-流相互作用，对于两个Fermion场$psi_1$和$psi_2$，其在弱相互作用下的弱流为
$
  j_mu & = overline(psi_1) gamma_mu (1 - gamma_5) psi_2 \
       & = 2 overline(psi_1) gamma_mu hat(L) psi_2 \
       & = 2 overline(psi_1) gamma_mu hat(L) hat(L) psi_2 \
       & = 2 overline(psi_1) hat(R) gamma_mu hat(L) psi_2 \
       & = 2 overline(psi_1)_LL gamma_mu psi_2_L
$
其中用到了$gamma_mu, gamma_5$的反对易性。说明V-A的弱流中实际参与弱相互作用的只是左手场。

轻子二重态是
$
  l_L^i = mat(nu_(i L); l_(i L)) = hat(L) l^i
$
在$"SU"$(2)群元素作用下，左手二重态的变换为
$
  l'^i_L = exp(i g T^j beta^j (x)) l_L^i
$
其中$g$为一常数，$g$和$gamma_5$的乘积构成$"SU"(2)$群变换参数。右手轻子场为
$
  l_R^i = hat(R) l^i
$
在$"SU"(2)$变换下右手场为单态
$
  T^j l_(i R) = 0
$
其中$$是$"SU"(2)$生成元的单态表示，实际上为$0$。

夸克左手二重态为
$
  q_L^i = mat(u_(i L); d'_(i L)) = hat(L) q^i
$
其中$d'_(i L)$是弱相互作用的夸克态，和质量本征态$d_(i L)$之间有Cabibbo-Kobayashi-Maskawa矩阵$V$的关系
$
  d'_(i L) = V_(i j) d_(j L)
$
右手夸克场为单态
$
  u_R^i = hat(R) u^i, d'_R^i = hat(R) d'^i
$
#newpara()

我们依然假设轻子和夸克的电荷及弱同位旋第三分量满足关系
$
  Q = I_3 + Y/2
$
其中$Y$为弱超荷，$I_3$为弱同位旋第三分量
- 对于左手二重态，$I_3$的取值为$1/2, -1/2$
  - $Y(l_L^i) = -1$
  - $Y(q_L^i) = 1/3$
- 对于右手单态，$I_3 = 0$
  - $Y(l_R^i) = -2$
  - $Y(u_R^i) = 4/3, Y(d'^i_R) = -2/3$

假设弱电相互作用在$"SU"(2)L times "U"(1)_Y$群变换下保持不变，$L$代表左手场，$Y$代表弱超荷，则根据Yang-Mills理论，必有相应的$"SU"(2)$和$"U"(1)$规范场存在
$
  cal(L)_"FG" = & overline(l)_L^i i gamma^mu (partial_mu - i g T^j A_mu^j - i g'/2 Y B_mu) l_L^i \
  & + overline(q)_L^i i gamma^mu (partial_mu - i g T^j A_mu^j - i g'/2 Y B_mu) q_L^i \
  & + overline(l)_R^i i gamma^mu (partial_mu - i g'/2 Y B_mu) l_R^i \
  & + overline(u)_R^i i gamma^mu (partial_mu - i g'/2 Y B_mu) u_R^i + overline(d')_R^i i gamma^mu (partial_mu - i g'/2 Y B_mu) d'_R^i
$
其中$g,g'$是$"SU"(2)$和$"U"(1)$的耦合常数。

协变导数，其中$T^j = tau^j/2$
$
  D_mu &= partial_mu - i g tau^j/2 A_mu^j - i g'/2 Y B_mu\
  &= partial_mu - i/2 mat(g A_mu^3 + g' Y B_mu, g (A_mu^1 - i A_mu^2); g (A_mu^1 + i A_mu^2), - g A_mu^3 + g' Y B_mu)\
  &= partial_mu - i/2 mat(g A_mu^3 + g' Y B_mu, g sqrt(2) W_mu^+; g sqrt(2) W_mu^-, - g A_mu^3 + g' Y B_mu)
$
其中
$
  W_mu^(plus.minus) = (A_mu^1 minus.plus i A_mu^2)/sqrt(2)
$
在保持定域规范不变的Lagrange量中规范场都是无质量的，而实际上传递弱相互作用 的中间Boson$W$是有质量的，将通过真空自发破缺制机获得质量。现中性矢量$A^3_mu, B_mu$都不是质量本征态，其本征态
$
  A_mu & = cos theta A_mu^3 + sin theta B_mu \
  Z_mu & = - sin theta A_mu^3 + cos theta B_mu
$
其中$theta$是Weinberg角，满足
$
  sin theta = g'/sqrt(g^2 + g'^2), cos theta = g/sqrt(g^2 + g'^2)
$
整理有
$
  D_mu &= partial_mu - i/2 mat((g sin theta + Y g' cos theta) A_mu + (g cos theta - Y g' sin theta) Z_mu, g sqrt(2) W_mu^+; g sqrt(2) W_mu^-, (- g sin theta + Y g' cos theta) A_mu + (- g cos theta - Y g' sin theta) Z_mu)\
  & = partial_mu - i/2 mat(g sin theta (1 + Y) A_mu + g (cos^2 theta - Y sin^2 theta)/(cos theta) Z_mu, g sqrt(2) W_mu^+; g sqrt(2) W_mu^-, g sin theta (Y - 1) A_mu - g (cos^2 theta + Y sin^2 theta)/(cos theta) Z_mu)
$
代入不同的场
$
  cal(L)_"FG" = & overline(l)_L^i i gamma^mu partial_mu l_L^i + overline(l)_L^i gamma^mu mat(g/(2 cos theta) Z_mu, g/sqrt(2) W_mu^+; g/sqrt(2) W_mu^-, - g/(2 cos theta) Z_mu + g sin theta A_mu) l_L^i \
  & + overline(q)_L^i i gamma^mu partial_mu q_L^i + overline(q)_L^i gamma^mu mat(2/3 g sin theta A_mu + g (cos^2 theta - 1/3 sin^2 theta)/(2 cos theta) Z_mu, g/sqrt(2) W_mu^+; g/sqrt(2) W_mu^-, - 1/3 g sin theta A_mu - g (cos^2 theta + 1/3 sin^2 theta)/(2 cos theta) Z_mu) q_L^i \
  & + overline(l)_R^i i gamma^mu partial_mu l_R^i + overline(l)_R^i gamma^mu (- g sin theta A_mu + g (sin^2 theta)/(cos theta) Z_mu) l_R^i \
  & + overline(u)_R^i i gamma^mu partial_mu u_R^i + overline(u)_R^i gamma^mu (2/3 g sin theta A_mu - 2/3 g (sin^2 theta)/(cos theta) Z_mu) u_R^i \
  & + overline(d')_R^i i gamma^mu partial_mu d'_R^i + overline(d')_R^i gamma^mu (- 1/3 g sin theta A_mu + 1/3 g (sin^2 theta)/(cos theta) Z_mu) d'_R^i\
  =& overline(nu)_(L i) i gamma^mu partial_mu nu_(L i) + overline(l)_i i gamma^mu partial_mu l_i + overline(u)_i i gamma^mu partial_mu u_i + overline(d')_i i gamma^mu partial_mu d'_i \
  & + g/(2 sqrt(2)) (overline(l)_i gamma^mu (1 - gamma_5) nu_i + overline(d')_i gamma^mu (1 - gamma_5) u_i) W_mu^-\
  & + g/(2 sqrt(2)) (overline(nu)_i gamma^mu (1 - gamma_5) l_i + overline(u)_i gamma^mu (1 - gamma_5) d'_i) W_mu^+ \
  & + g/(4 cos theta) (overline(nu)_i gamma^mu (1 - gamma_5) nu_i + overline(l)_i gamma^mu (-(1 - 4 sin^2 theta) + gamma_5) l_i \
    & + overline(u)_i gamma^mu ((1 - 8/3 sin^2 theta) - gamma_5) u_i + overline(d')_i gamma^mu ((-1 + 4/3 sin^2 theta) + gamma_5) d'_i) Z_mu\
  & + g sin theta (- overline(l)_i gamma^mu l_i + 2/3 overline(u)_i gamma^mu u_i - 1/3 overline(d')_i gamma^mu d'_i) A_mu
$
其中
- 前四项为轻子和夸克的动能项
- 第五六项为弱带电流项，传递这种相互作用的是带电中间Boson$W^plus.minus$，这两项互为Hermitian共轭，描述Fermion与带电中间Boson之间的相互作用
- 第七项为弱中性流项，传递这种相互作用的是电中性间中Boson子$Z^0$，这是定域非Abel规范理论所预言的弱相互作用的一种新的形式。
规范理论说明弱相互作用不只是由带电流引起，也可以由中性流引起，弱相互作用下粒子的电荷状态也可以不发生改变。
