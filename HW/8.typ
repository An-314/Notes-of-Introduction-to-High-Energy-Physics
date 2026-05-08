#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第八次作业],
  author: "Anzreww",
  time: "2026年5月",
)

#exercise(subname: [])[
  验证
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
  是Dirac方程的解。
]
#proof[

  采用
  $
    psi = a e^(- i p dot x/hbar) u
  $
  时，Dirac方程化为
  $
    (gamma^mu p_mu - m c) u = 0
  $
  注意到
  $
    gamma^0 = mat(1, 0; 0, -1), gamma^i = mat(0, sigma_i; - sigma_i, 0)
  $
  因此
  $
    gamma^mu p_mu = gamma^0 E/c - vb(gamma) dot vb(p) = mat(E/c, - vb(p) dot vb(sigma); vb(p) dot vb(sigma), - E/c)
  $
  注意到
  $
    vb(p) dot vb(sigma) = mat(p_3, p_1 - i p_2; p_1 + i p_2, - p_3)
  $
  从而
  $
    gamma^mu p_mu - m c = mat(E/c - m c, 0, - p_3, - p_1 + i p_2; 0, E/c - m c, - p_1 - i p_2, p_3; p_3, p_1 - i p_2, - E/c - m c, 0; p_1 + i p_2, - p_3, 0, - E/c - m c)
  $
  记
  $
    D = E + m c^2
  $
  还要注意
  $
    N = sqrt((E + m c^2)/(c))
  $
  以及相对论关系
  $
    E^2 = p^2 c^2 + m^2 c^4
  $
  #newpara()
  - $u^((1))$
    $
      (gamma^mu p_mu - m c) u^((1)) = N mat(E/c - m c, 0, - p_3, - p_1 + i p_2; 0, E/c - m c, - p_1 - i p_2, p_3; p_3, p_1 - i p_2, - E/c - m c, 0; p_1 + i p_2, - p_3, 0, - E/c - m c) mat(1; 0; c(p_3)/D; c(p_1 + i p_2)/D) = 0
    $
  - $u^((2))$
    $
      (gamma^mu p_mu - m c) u^((2)) = N mat(E/c - m c, 0, - p_3, - p_1 + i p_2; 0, E/c - m c, - p_1 - i p_2, p_3; p_3, p_1 - i p_2, - E/c - m c, 0; p_1 + i p_2, - p_3, 0, - E/c - m c) mat(0; 1; c(p_1 - i p_2)/D; - c(p_3)/D) = 0
    $
  - $v^((1))$
    $
      (gamma^mu p_mu + m c) v^((1)) = N mat(E/c + m c, 0, - p_3, - p_1 + i p_2; 0, E/c + m c, - p_1 - i p_2, p_3; p_3, p_1 - i p_2, - E/c + m c, 0; p_1 + i p_2, - p_3, 0, - E/c + m c) mat(c(p_1 - i p_2)/D; - c(p_3)/D; 0; 1) = 0
    $
  - $v^((2))$
    $
      (gamma^mu p_mu + m c) v^((2)) = N mat(E/c + m c, 0, - p_3, - p_1 + i p_2; 0, E/c + m c, - p_1 - i p_2, p_3; p_3, p_1 - i p_2, - E/c + m c, 0; p_1 + i p_2, - p_3, 0, - E/c + m c) mat(c(p_3)/D; c(p_1 + i p_2)/D; 1; 0) = 0
    $
  从而验证了它们是Dirac方程的解。
]


#exercise(subname: [])[
  验证
  $
    vb(S) = hbar/2 vb(Sigma) = hbar/2 mat(vb(sigma), O; O, vb(sigma))
  $
  对如上各个解的延运动方向的自旋投影结果。
]

#solution[
  设
  $
    D = E + m c^2
  $
  沿运动方向的自旋投影算符是
  $
    hat(S)_parallel = hat(vb(S)) dot vu(vb(p)) = hbar/2 (vb(Sigma) dot vb(p))/p
  $
  其中
  $
    vb(Sigma) dot vb(p) = mat(vb(sigma) dot vb(p), O; O, vb(sigma) dot vb(p)) = mat(p_3, p_1 - i p_2, 0, 0; p_1 + i p_2, - p_3, 0, 0; 0, 0, p_3, p_1 - i p_2; 0, 0, p_1 + i p_2, - p_3)
  $
  则有
  $
    hat(S)_parallel = hbar/(2 p) mat(p_3, p_1 - i p_2, 0, 0; p_1 + i p_2, - p_3, 0, 0; 0, 0, p_3, p_1 - i p_2; 0, 0, p_1 + i p_2, - p_3)
  $
  - $u^((1))$
    $
      hat(S)_parallel u^((1)) = (hbar N)/(2 p) mat(p_3, p_1 - i p_2, 0, 0; p_1 + i p_2, - p_3, 0, 0; 0, 0, p_3, p_1 - i p_2; 0, 0, p_1 + i p_2, - p_3) mat(1; 0; c(p_3)/D; c(p_1 + i p_2)/D) = (hbar N)/(2 p) mat(p_3; p_1 + i p_2; c(p_3^2 + p_1^2 + p_2^2)/D; 0)
    $
    只有在$p_1 = p_2 = 0$时，$u^((1))$才是本征态
  - $u^((2))$
    $
      hat(S)_parallel u^((2)) = (hbar N)/(2 p) mat(p_3, p_1 - i p_2, 0, 0; p_1 + i p_2, - p_3, 0, 0; 0, 0, p_3, p_1 - i p_2; 0, 0, p_1 + i p_2, - p_3) mat(0; 1; c(p_1 - i p_2)/D; - c(p_3)/D) = (hbar N)/(2 p) mat(p_1 - i p_2; - p_3; 0; c(p_3^2 + p_1^2 + p_2^2)/D)
    $
    只有在$p_1 = p_2 = 0$时，$u^((2))$才是本征态
  - $v^((1))$
    $
      hat(S)_parallel v^((1)) = (hbar N)/(2 p) mat(p_3, p_1 - i p_2, 0, 0; p_1 + i p_2, - p_3, 0, 0; 0, 0, p_3, p_1 - i p_2; 0, 0, p_1 + i p_2, - p_3) mat(c(p_1 - i p_2)/D; - c(p_3)/D; 0; 1) = (hbar N)/(2 p) mat(0; c(p_3^2 + p_1^2 + p_2^2)/D; p_1- i p_2; - p_3)
    $
    只有在$p_1 = p_2 = 0$时，$v^((1))$才是本征态
  - $v^((2))$
    $
      hat(S)_parallel v^((2)) = (hbar N)/(2 p) mat(p_3, p_1 - i p_2, 0, 0; p_1 + i p_2, - p_3, 0, 0; 0, 0, p_3, p_1 - i p_2; 0, 0, p_1 + i p_2, - p_3) mat(c(p_3)/D; c(p_1 + i p_2)/D; 1; 0) = - (hbar N)/(2 p) mat(c(p_3^2 + p_1^2 + p_2^2)/D; 0; p_3; p_1 + i p_2)
    $
    只有在$p_1 = p_2 = 0$时，$v^((2))$才是本征态
]

#exercise(subname: [5.2])[
  请利用方程
  $
    Psi_(n,l,m_l) (r, theta, phi, t) = ((2/(n a))^3 ((n - l - 1)!)/(2n ((n + l)!)^3))^(1/2) e^(-r/(n a)) ((2r)/(n a))^l L_(n - l - 1)^(2l + 1) ((2r)/(n a)) Y_l^(m_l)(theta, phi) e^(-i E_n t/hbar)
  $
  其中
  $
    a = hbar^2/(m e^2) = 0.529 10^(-8) "cm"
  $
  是Bhor半径，$L_(n - l - 1)^(2l + 1)$是缔合Laguerre多项式，$Y_l^(m_l)$是球谐函数。

  获得$Psi_100$的基态波函数。证明它在合适的能量下满足Schrödinger方程，并验证它是合理的归一化的。[答案：$Psi_100 = 1/sqrt(pi a^3) e^(-r/a) e^(- (i E_1 t)/hbar)$]
]

#solution[

  由氢原子波函数可知
  $
    Psi_100 = ((2/a)^3 1/2)^(1/2) e^(-r/a) ((2r)/a)^0 L_0^(1) ((2r)/a) Y_0^0(theta, phi) e^(-i E_1 t/hbar)
  $
  其中
  $
    L_0^1 = 1, Y_0^0 = 1/sqrt(4 pi)
  $
  因此
  $
    Psi_100 = 1/sqrt(pi a^3) e^(-r/a) e^(- (i E_1 t)/hbar)
  $
  其中
  $
    E_1 = - (m e^4)/(2 hbar^2) approx -13.6 "eV"
  $
  #newpara()
  现在验证它满足Schrödinger方程
  $
    i hbar pdv(Psi_100, t) = - (hbar^2)/(2 m) laplacian(Psi_100) + V Psi_100
  $
  注意到
  $
    laplacian f(r) = 1/r^2 pdv(, r)(r^2 pdv(f, r))
  $
  因此
  $
    laplacian(Psi_100) = 1/r^2 pdv(, r)(r^2 pdv(Psi_100, r)) = 1/r^2 pdv(, r)(- 2/a r^2 Psi_100) = (1/a^2 - 2/(r a)) Psi_100
  $
  又因为
  $
    V = - e^2/r
  $
  因此
  $
    "RHS" = - (hbar^2)/(2 m) laplacian(Psi_100) + V Psi_100 = (m e^4)/(2 hbar^2) Psi_100 = - E_1 Psi_100 = "LHS"
  $
  从而验证了它满足Schrödinger方程。

  现在验证它是合理的归一化的，即
  $
    integral abs(Psi)^2 r^2 sin(theta) dd(r, theta, phi) &= integral 1/(pi a^3) e^(-2 r/a) r^2 sin(theta) dd(r, theta, phi) \
    &= 1/(pi a^3) 4 pi integral_0^oo e^(-2 r/a) r^2 dd(r) \
    &= 4/a^3 (2 (a/2)^3) = 1
  $
]

#exercise(subname: [5.5])[
  用$"eV"$为单位计算$n=2$的能级$j = 3/2$和$j = 1/2$的能级分裂。它比起$n = 2$和$n = 1$的Bhor能级的间隔如何？
]

#figure(
  image("pic/2026-05-08-15-00-14.png", width: 80%),
  numbering: none,
)

#solution[

  考虑到精细结构的能量修正为
  $
    Delta E = - alpha^4 m c^2 1/(4 n^3) ((2n)/(j + 1/2) - 3/2)
  $
  有
  $
    E_(3/2) - E_(1/2) &= alpha^4 m c^2 1/(4 n^3) ((2n)/(1/2 + 1/2) - 3/2 - (2n)/(3/2 + 1/2) + 3/2) = alpha^4 m c^2 1/(4 n^3) (n - 1) \
    &= 1/(32) alpha^4 m c^2 approx 4.53 times 10^(-5) "eV"
  $
  而$n = 2$和$n = 1$的Bhor能级的间隔为
  $
    E_2 - E_1 = - (m e^4)/(2 hbar^2) (1/4 - 1) = 3/8 (m e^4)/(hbar^2) approx 10.2 "eV"
  $
  因此$n = 2$的能级分裂比起$n = 2$和$n = 1$的Bhor能级的间隔小了约5-6个数量级。
]

#exercise(subname: [5.12])[
  利用方程
  $
    M("meson") = m_1 + m_2 + A (vb(S)_1 dot vb(S)_2)/(m_1 m_2)
  $
  其中
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
  计算表中的介子质量。
  #figure(
    three-line-table[
      | 介子 | 计算 | 观测 |
      | --- | --- | --- |
      | $pi$ | $139$ | $138$ |
      | $K$ | $487$ | $496$ |
      | $eta$ | $561$ | $548$ |
      | $rho$ | $775$ | $776$ |
      | $omega$ | $775$ | $783$ |
      | $K^*$ | $892$ | $894$ |
      | $eta'$ | $1031$ | $1020$ |
    ],
    caption: [鹰标和矢量介子质量($"MeV"\/c^2$)],
  )

  [提示：对$eta$，首先找出对纯$u macron(u)$、纯$d macron(d)$和纯$s macron(s)$的质量，并把$eta$看作$1/6 u macron(u)$、$1/6 d macron(d)$和$2/3 s macron(s)$]再用公式于$eta'$，并注意灾难性的结果。
]

#solution[
  首先计算赝标量的纯$u macron(u)$、纯$d macron(d)$和纯$s macron(s)$的质量：
  $
    M = m_1 + m_2 + ((2 m_u)/hbar)^2 159 (- 3/4 hbar^2)/(m_1 m_2) = m_1 + m_2 - 477 (m_u^2)/(m_1 m_2)
  $
  - 纯$u macron(u)$的质量为
    $
      M = 2 m_u - 477 (m_u^2)/(m_u^2) = 139 "MeV"\/c^2
    $
  - 纯$d macron(d)$的质量为
    $
      M = 2 m_d - 477 (m_u^2)/(m_d^2) = 139 "MeV"\/c^2
    $
  - 纯$s macron(s)$的质量为
    $
      M = 2 m_s - 477 (m_u^2)/(m_s^2) = 772 "MeV"\/c^2
    $
  从而
  - $pi:$$u,d$混合，$M = 139 "MeV"\/c^2$
  - $K:$$u,s$混合或$d,s$混合，$M = 487 "MeV"\/c^2$
  - $eta$:$1/6 u macron(u)$、$1/6 d macron(d)$和$2/3 s macron(s)$混合，$M = 561 "MeV"\/c^2$
  - $eta'$:$1/3 u macron(u)$、$1/3 d macron(d)$和$1/3 s macron(s)$混合，$M = 350 "MeV"\/c^2$

  对于矢量介子，纯$u macron(u)$、纯$d macron(d)$和纯$s macron(s)$的质量为
  $
    M = m_1 + m_2 + ((2 m_u)/hbar)^2 159 (1/4 hbar^2)/(m_1 m_2) = m_1 + m_2 + 159 (m_u^2)/(m_1 m_2)
  $
  - 纯$u macron(u)$的质量为
    $
      M = 2 m_u + 159 (m_u^2)/(m_u^2) = 775 "MeV"\/c^2
    $
  - 纯$d macron(d)$的质量为
    $
      M = 2 m_d + 159 (m_u^2)/(m_d^2) = 775 "MeV"\/c^2
    $
  - 纯$s macron(s)$的质量为
    $
      M = 2 m_s + 159 (m_u^2)/(m_s^2) = 1031 "MeV"\/c^2
    $
  从而
  - $rho$:$u,d$混合，$M = 775 "MeV"\/c^2$
  - $omega$:$u,d$混合，$M = 775 "MeV"\/c^2$
  - $K^*$:$u,s$混合或$d,s$混合，$M = 892 "MeV"\/c^2$
  - $phi$:$s,s$，$M = 1031 "MeV"\/c^2$
]

#exercise(subname: [])[
  推导表中中子$n$和$Lambda$的磁矩表达式，并根据书中给出的质量，预言他们的磁矩数值。

  #figure(
    three-line-table[
      | 重子 | 磁矩 | 预言 | 实验 |
      | --- | --- | --- | --- |
      | $p$ | $4/3 mu_u - 1/3 mu_d$ | $2.79$ | $2.793$ |
      | $n$ | $- 1/3 mu_u + 4/3 mu_d$ | $- 1.86$ | $- 1.913$ |
      | $Lambda$ | $mu_s$ | $- 0.58$ | $- 0.613$ |
    ],
    caption: [核子磁矩的预言和实验值],
  )
]

#solution[
  中子夸克组成为
  $
    n = u d d
  $
  取自旋向上的中子波函数：
  $
    ket(n\, arrow.t) & = sum psi("spin部分交换反对称") psi("flavor部分交换反对称") \
    &= sqrt(2)/3 (1/2 (d u d - u d d) (ket(arrow.t arrow.b arrow.t) - ket(arrow.b arrow.t arrow.t) + 1/2 (d d u - d u d) (ket(arrow.t arrow.t arrow.b) - ket(arrow.t arrow.b arrow.t)) + 1/2 (d d u - u d d) (ket(arrow.t arrow.t arrow.b) - ket(arrow.b arrow.t arrow.t))) \
    &= 1/sqrt(18) (2 ket(d^arrow.t d^arrow.t u^arrow.b) - ket(d^arrow.t d^arrow.b u^arrow.t) - ket(d^arrow.b d^arrow.t u^arrow.t) + 2 ket(d^arrow.t u^arrow.b d^arrow.t) - ket(d^arrow.t u^arrow.t d^arrow.b) - ket(d^arrow.b u^arrow.t d^arrow.t) + 2 ket(u^arrow.b d^arrow.t d^arrow.t) - ket(u^arrow.t d^arrow.t d^arrow.b) - ket(u^arrow.t d^arrow.b d^arrow.t))
  $
  因此
  $
    mu_n = braket(n\, arrow.t, sum_i n_i sigma_(i z), n\, arrow.t) &= 3 times 4/18 (2 mu_d - mu_u) + 6 times 1/18 mu_u = - 1/3 mu_u + 4/3 mu_d
  $
  #newpara()
  $Lambda$的夸克组成为
  $
    Lambda = u d s
  $
  且$I=0, I_3=0, Y=0$，$Lambda$中$u,d$构成同位旋单态，并且$u,d$自旋也耦合成自旋单态。因此总自旋由$s$夸克承担。只用考虑$u,d$的味道反对称和自旋反对称部分：
  $
    ket(Lambda\, arrow.t) = 1/2 (ket(u^arrow.t d^arrow.b s^arrow.t) - ket(u^arrow.b d^arrow.t s^arrow.t) - ket(d^arrow.t u^arrow.b s^arrow.t) + ket(d^arrow.b u^arrow.t s^arrow.t))
  $
  因此
  $
    mu_Lambda = braket(Lambda\, arrow.t, sum_i n_i sigma_(i z), Lambda\, arrow.t) = 1/4((mu_u - mu_d + mu_s) + (- mu_u + mu_d + mu_s) + (- mu_u + mu_d + mu_s) + (mu_u - mu_d + mu_s)) = mu_s
  $
  #newpara()

  用核磁子
  $
    mu_N = (e hbar)/(2 m_p c)
  $
  作单位。夸克磁矩为
  $
    mu_q = (Q_q)/e m_p/m_q mu_N
  $
  因此
  $
    mu_u = 2/3 m_p/m_u mu_N = 1.86 mu_N, mu_d = - 1/3 m_p/m_d mu_N = - 0.93 mu_N, mu_s = - 1/3 m_p/m_s mu_N = - 0.58 mu_N
  $
  从而
  $
    mu_n = - 1/3 mu_u + 4/3 mu_d = - 1.86 mu_N, mu_Lambda = mu_s = - 0.58 mu_N
  $
]
