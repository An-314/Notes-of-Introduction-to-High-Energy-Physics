#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第五次作业],
  author: "Anzreww",
  time: "2026年4月",
)

#exercise(subname: [3.14])[
  一个热土豆比冷土豆重多少(用kg为单位)？
]

#solution[
  加热土豆从$20 ℃$升温到$100 ℃$。把一个土豆看成质量约$0.2$kg，比热容约$3.5 times 10^3 "J"\/("kg" dot ℃)$。则吸收热量大约
  $
    Q = m c Delta T = 0.2 times 3.5 times 10^3 times (100 - 20) "J" = 5.6 times 10^4 "J"
  $
  对应的质量增加为
  $
    Delta m = Q/c^2 = (5.6 times 10^4 "J") / (3 times 10^8 "m/s")^2 approx 6 times 10^(-13) "kg"
  $
]

#exercise(subname: [3.15])[
  一个以速度$v$飞行的$pi$衰变成一个缪子和一个中微子，$pi^- -> mu^- + macron(nu)_mu$。如果中微子以$90^degree$角相对原来的$pi$方向出现，缪子将以什么角度飞出？[答案:$tan theta = (1 - m_mu^2/m_pi^2)/(2 beta gamma^2)$]
]

#solution[
  能量动量守恒要求
  $
    E_pi = E_mu + E_nu\
    vb(p)_pi = vb(p)_mu + vb(p)_nu => cases(
      p_pi = p_mu cos theta,
      p_mu sin theta = p_nu,
    )
  $
  其中
  $
    E_pi = gamma beta m_pi, E_mu = sqrt(p_mu^2 + m_mu^2), E_nu = p_nu
  $
  则
  $
    (gamma m_pi - p_nu)^2 = p_mu^2 + m_mu^2\
    (gamma m_pi - p_mu sin theta)^2 = p_mu^2 + m_mu^2\
  $
  其中
  $
    p_mu = 1 / (cos theta) p_pi = 1 / (cos theta) gamma beta m_pi
  $
  则
  $
    (gamma m_pi - 1 / (cos theta) gamma beta m_pi sin theta)^2 = (1 / (cos theta) gamma beta m_pi)^2 + m_mu^2\
    (1 + beta tan theta)^2 = beta^2/(cos^2 theta) + (m_mu^2/m_pi^2) 1/ (gamma^2)\
    - 2 beta tan theta - beta^2 + 1 = (m_mu^2/m_pi^2) 1/ (gamma^2)\
  $
  利用
  $
    beta^2 = 1 - 1/gamma^2
  $
  从而
  $
    tan theta = (1 - m_mu^2/m_pi^2)/(2 beta gamma^2)
  $
]

#exercise(subname: [3.16])[
  粒子$A$(能量为$E$)撞击粒子$B$(静止)，产生粒子$C_1, C_2, ... :A+B->C_1 + C_2+...+C_n$。计算这个反应的阈值(即最小的$E$)，用各种粒子的质量表达结果。？[答案:$(M^2 - m_A^2 - m_B^2)/(2 m_B)$，其中$M = sum_i m_i$]
]

#solution[
  前后的四矢量为
  $
    p_"TOT" = mat(E_A+ m_B; vb(p)_A), p'_"TOT" = mat(sum_i m_i; 0)
  $
  Lorentz不变量要求
  $
    (E_A + m_B)^2 - vb(p)_A^2 = (sum_i m_i)^2\
  $
  其中
  $
    p_A = sqrt(E_A^2 - m_A^2)
  $
  则有
  $
    2 E_A m_B + m_B^2 - m_A^2 = M^2\
    E_A = (M^2 - m_A^2 - m_B^2)/(2 m_B)
  $
  其中
  $
    M = sum_i m_i
  $
]

#exercise(subname: [3.19], lab: "3.19")[
  静止的粒子$A$衰变成粒子$B$和$C$($A->B+C$)。
  - 计算出射粒子的能量，用各种质量表达结果。[答案:$E_B = (m_A^2 + m_B^2 - m_C^2)/(2 m_A) c^2$]
  - 计算出射粒子的动量的大小。[答案:$abs(vb(p)_B) = abs(vb(p)_C) = sqrt(lambda(m_A^2, m_B^2, m_C^2))/(2 m_A c)$其中，$lambda(x, y, z) = x^2 + y^2 + z^2 - 2x y - 2y z - 2z x$]
  - 注意$lambda$因子：$lambda(a^2, b^2, c^2) = (a + b + c)(a + b - c)(b + c - a)(c + a - b)$。因此当$m_A = m_B + m_C$时$abs(vb(p)_B)$为零，且当$m_A < m_B + m_C$时$abs(vb(p)_B)$为虚值。请给予解释。
]

#solution[
  + 出射粒子的能量
    $
      E_A = E_B + E_C\
      p_B = - p_C\
    $
    其中
    $
      E_A = m_A, E_B = sqrt(p_B^2 + m_B^2), E_C = sqrt(p_C^2 + m_C^2)
    $
    从而
    $
      E_B^2 - E_C^2 = (E_B + E_C)(E_B - E_C) = m_B^2 - m_C^2\
    $
    其中
    $
      E_B + E_C = m_A
    $
    则
    $
      E_B - E_C = (m_B^2 - m_C^2)/m_A\
    $
    得到
    $
      E_B = (m_A^2 + m_B^2 - m_C^2)/(2 m_A) c^2\
      E_C = (m_A^2 - m_B^2 + m_C^2)/(2 m_A) c^2
    $
  + 出射粒子的动量的大小
    $
      p_B^2 = E_B^2 - m_B^2 = ((m_A^2 + m_B^2 - m_C^2)^2 - 4 m_A^2 m_B^2)/(4 m_A^2) c^2\
      p_C^2 = E_C^2 - m_C^2 = ((m_A^2 - m_B^2 + m_C^2)^2 - 4 m_A^2 m_C^2)/(4 m_A^2) c^2
    $
    即
    $
      abs(vb(p)_B) = abs(vb(p)_C) = sqrt(lambda(m_A^2, m_B^2, m_C^2))/(2 m_A c)
    $
  + 当$m_A = m_B + m_C$时，$lambda(m_A^2, m_B^2, m_C^2) = 0$，因此出射粒子的动量为零。这是因为在这种情况下，衰变产物的总质量等于初始粒子的质量，因此没有多余的能量可以转化为动能。

    当$m_A < m_B + m_C$时，$lambda(m_A^2, m_B^2, m_C^2) < 0$，因此出射粒子的动量为虚值。这是因为在这种情况下，衰变产物的总质量大于初始粒子的质量，因此无法满足能量守恒定律，衰变过程无法发生。
]

#exercise(subname: [3.20])[
  利用 @3.19 的结果计算下列反应的每个衰变产物的质心能量
  - $pi^- -> mu^- + macron(nu)_mu$
  - $pi^0 -> gamma + gamma$
  - $K^+ -> pi^+ + pi^0$
  - $Lambda -> p + pi^-$
  - $Omega^- -> Lambda + K^-$
]

#solution[
  取近似质量：
  #three-line-table[
    | 粒子 | 质量(MeV/c^2) |
    | --- | --- |
    | $pi^-$ | 139.57 |
    | $mu^-$ | 105.66 |
    | $pi^0$ | 134.98 |
    | $K^+$ | 493.68 |
    | $pi^+$ | 139.57 |
    | $Lambda$ | 1115.68 |
    | $p$ | 938.27 |
    | $Omega^-$ | 1672.45 |
    | $K^-$ | 493.68 |
    | $gamma, nu$ | 0 |
  ]
  利用
  $
    E_B = (m_A^2 + m_B^2 - m_C^2)/(2 m_A) c^2, E_C = (m_A^2 - m_B^2 + m_C^2)/(2 m_A) c^2
  $
  + $pi^- -> mu^- + macron(nu)_mu$
    $
      E_mu = (m_pi^2 + m_mu^2 - 0)/(2 m_pi) c^2 approx 109.78 "MeV"\
      E_nu = (m_pi^2 - m_mu^2 + 0)/(2 m_pi) c^2 approx 29.79 "MeV"
    $
  + $pi^0 -> gamma + gamma$
    $
      E_gamma = (m_pi^2 + 0 - 0)/(2 m_pi) c^2 approx 67.49 "MeV"
    $
  + $K^+ -> pi^+ + pi^0$
    $
      E_(pi^+) = (m_(K^+)^2 + m_(pi^+)^2 - m_(pi^0)^2)/(2 m_(K^+)) c^2 approx 248.12 "MeV"\
      E_(pi^0) = (m_(K^+)^2 - m_(pi^+)^2 + m_(pi^0)^2)/(2 m_(K^+)) c^2 approx 245.56 "MeV"
    $
  + $Lambda -> p + pi^-$
    $
      E_p = (m_(Lambda)^2 + m_p^2 - m_(pi^-)^2)/(2 m_(Lambda)) c^2 approx 943.65 "MeV"\
      E_(pi^-) = (m_(Lambda)^2 - m_p^2 + m_(pi^-)^2)/(2 m_(Lambda)) c^2 approx 172.04 "MeV"
    $
  + $Omega^- -> Lambda + K^-$
    $
      E_(Lambda) = (m_(Omega^-)^2 + m_(Lambda)^2 - m_(K^-)^2)/(2 m_(Omega^-)) c^2 approx 1135.50 "MeV"\
      E_(K^-) = (m_(Omega^-)^2 - m_(Lambda)^2 + m_(K^-)^2)/(2 m_(Omega^-)) c^2 approx 536.95 "MeV"
    $
]

#exercise(subname: [3.26])[
  对全同粒子的弹性散射，$A + A -> A + A$，证明 Mandelstam 变量成为
  $
    s = (4 (vb(p)^2 + m^2 c^2))/c^2\
    t = (- 2 vb(p)^2 (1 - cos theta))/c^2\
    u = (- 2 vb(p)^2 (1 + cos theta))/c^2
  $
  其中$vb(p)$是入射粒子的质心动量，$theta$是散射角。
]

#solution[
  Mandelstam 变量定义为
  $
    s = (p_A + p_B)^2/c^2, t = (p_A - p_C)^2/c^2, u = (p_A - p_D)^2/c^2
  $
  对于全同粒子的弹性散射，$p_A = p_B = p_C = p_D = p$，且散射角为$theta$，则有
  $
    p_A = mat(E; vb(p)), p_B = mat(E; -vb(p)), p_C = mat(E; vb(p)'), p_D = mat(E; -vb(p)')
  $
  则有
  $
    s = (p_A + p_B)^2/c^2 = (2 E)^2/c^2 = (4 (vb(p)^2 + m^2 c^2))/c^2\
  $
  而
  $
    t = (p_A - p_C)^2/c^2 = (E - E)^2/c^2 - (vb(p) - vb(p)')^2/c^2 = (- 2 vb(p)^2 (1 - cos theta))/c^2\
    u = (p_A - p_D)^2/c^2 = (E - E)^2/c^2 - (vb(p) + vb(p)')^2/c^2 = (- 2 vb(p)^2 (1 + cos theta))/c^2
  $
  其中$theta$为$vb(p)$和$vb(p)'$之间的夹角，即散射角。
]

#note[
  旋量的叠加（自旋，角动量）的规则。
]

#solution[
  角动量算符$hat(vb(J))$的本征态为
  $
    hat(vb(J))^2 ket(j\,m) = j(j+1) ket(j\,m)\
    hat(vb(J))_z ket(j\,m) = m ket(j\,m)
  $
  对于两个角动量的叠加
  $
    hat(vb(J)) = hat(vb(J))_1 + hat(vb(J))_2
  $
  总角动量的量子数$j$满足
  $
    j = abs(j_1 - j_2), abs(j_1 - j_2) + 1, ..., j_1 + j_2
  $
  总角动量的磁量子数$m$满足
  $
    m = m_1 + m_2 = -j, -j + 1, ..., j
  $
  角动量叠加的规则为：耦合表象写可以用未耦合表象的线性组合表示，即
  $
    ket(j_1\,m_1) times.o ket(j_2\,m_2) = sum_(j=abs(j_1-j_2))^(j_1+j_2) sum_(m=-j)^j D_(j_1 m_1 j_2 m_2)^(j m) ket(j\,m)\
    ket(j\,m) = sum_(m_1=-j_1)^(j_1) sum_(m_2=-j_2)^(j_2) C_(j_1 m_1 j_2 m_2)^(j m) ket(j_1\,m_1) times.o ket(j_2\,m_2)
  $
  其中$C_(j_1 m_1 j_2 m_2)^(j m)$为Clebsch-Gordan系数。
]

#note[
  自旋1/2粒子的空间转动规则。
]

#solution[
  自旋$1/2$粒子在选定$z$轴的自旋基底下的态矢量为
  $
    ket(arrow.t) = ket(1/2\,1/2), ket(arrow.b) = ket(1/2\,-1/2)
  $
  一般态矢量可以表示为
  $
    ket(psi) = a ket(arrow.t) + b ket(arrow.b) = mat(a; b) = chi
  $
  旋转算符
  $
    hat(U)(R) = exp(-i/hbar theta vu(n) dot hat(vb(J)))
  $
  其中$vu(n)$为旋转轴的单位向量，$theta$为旋转角度，$hat(vb(J))$为角动量算符。对于自旋$1/2$粒子，角动量算符可以表示为
  $
    hat(vb(J)) = hat(vb(S)) = hbar/2 vu(sigma)
  $
  其中
  $
    vu(sigma) = (sigma_x, sigma_y, sigma_z)\
    sigma_x = mat(0, 1; 1, 0), sigma_y = mat(0, -i; i, 0), sigma_z = mat(1, 0; 0, -1)
  $
  是Pauli矩阵。则旋转算符可以表示为
  $
    hat(U)(R) = exp(-i/2 theta vu(n) dot vu(sigma))
  $
  有恒等式
  $
    exp(-i/2 theta vu(n) dot vu(sigma)) = cos(theta/2) I - i sin(theta/2) vu(n) dot vu(sigma)
  $
  #newpara()
  对于一般态
  $
    ket(psi') = hat(U)(R) ket(psi) = (cos(theta/2) I - i sin(theta/2) vu(n) dot vu(sigma)) chi
  $
]

#note[
  群的定义，及什么是分立群，连续群，转动群，二维转动群，三维转动群。
]

#solution[
  群是一个集合$cal(G)$，以及一个二元运算$dot$，满足以下条件：
  1. 闭合性：对于任意$g_1, g_2 in cal(G)$，$g_1 dot g_2 in cal(G)$。
  2. 结合律：对于任意$g_1, g_2, g_3 in cal(G)$，$(g_1 dot g_2) dot g_3 = g_1 dot (g_2 dot g_3)$。
  3. 单位元：存在一个元素$e in cal(G)$，使得对于任意$g in cal(G)$，$e dot g = g dot e = g$。
  4. 逆元：对于任意$g in cal(G)$，存在一个元素$g^(-1) in cal(G)$，使得$g dot g^(-1) = g^(-1) dot g = e$。

  分立群是指群元素是离散的，即群元素之间没有连续变化的参数。连续群是指群元素可以通过连续变化的参数来表示。

  转动群是指描述空间转动的群。在$n$维空间中，转动群通常表示为$"SO"(n)$，即$n$维特殊正交群
  $
    "SO"(n) = {R | R^TT = I, det(R) = 1}
  $

  #newpara()
  二维转动群$"SO"(2)$描述二维空间中的转动，其元素可以表示为
  $
    R(theta) = mat(cos theta, -sin theta; sin theta, cos theta)
  $
  $"SO"(2)$有一个参数$theta$，表示转动角度。$"SO"(2)$是Abel的。

  三维转动群$"SO"(3)$描述三维空间中的转动，其元素可以表示为
  $
    g(alpha, beta, gamma) = R_z (alpha) R_y (beta) R_z (gamma)
  $
  其中$alpha, beta, gamma$为三个Euler角，$R_z$和$R_y$分别表示绕$z$轴和$y$轴的转动矩阵。$"SO"(3)$有三个参数$alpha, beta, gamma$，表示三维空间中的转动。$"SO"(3)$是非Abel的。
]
