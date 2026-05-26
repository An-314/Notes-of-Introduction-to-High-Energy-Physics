#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第十次作业],
  author: "Anzreww",
  time: "2026年5月",
)

#exercise(subname: [7.26])[
  计算在质心系中电子-缪子散射的振幅
  $
    M = (-g_e^2)/(p_1-p_3)^2 (overline(u^((s_3))) (p_3) gamma^mu u^((s_1)) (p_1)) (overline(u^((s_4))) (p_4) gamma_mu u^((s_2)) (p_2))
  $
  假设$e$和$mu$沿$z$轴相互接近，相斥，然后沿$z$轴返回。假设初态和末态粒子都具有螺旋度$+1$。[答案:$M=-2g_e^2$]
]

#solution[
  有
  $
    u^((1)) (p) = N mat(1; 0; (c p)/(E + m c^2); 0),
    u^((2)) (p) = N mat(0; 1; 0; - (c p)/(E + m c^2))
  $
  其中
  $
    N = sqrt((E + m c^2)/c)
  $
  $
    p^2 c^2 = E^2 - m^2 c^4
  $
  则有
  $
    u(1) = mat(N_(e,+); 0; N_(e,-); 0),
    u(2) = mat(0; N_(mu,+); 0; -N_(mu,-))
    u(3) = mat(0; N_(e,+); 0; -N_(e,-)),
    u(4) = mat(N_(mu,+); 0; N_(mu,-); 0),
  $
  其中
  $
    N_(f, plus.minus) = sqrt((E_f plus.minus m_f c^2)/c)
  $
  有
  $
    overline(u) (3) gamma^0 u(1) = mat(0, N_(e,+), 0, N_(e,-)) gamma^0 gamma^0 mat(N_(e,+); 0; N_(e,-); 0) = 0
  $
  $
    overline(u) (3) gamma^i u(1) &= mat(0, N_(e,+), 0, N_(e,-)) gamma^0 gamma^i mat(N_(e,+); 0; N_(e,-); 0)\
    &= mat(0, N_(e,+), 0, N_(e,-)) mat(1, 0; 0, -1) mat(0, sigma^i; -sigma^i, 0) mat(N_(e,+); 0; N_(e,-); 0)\
    &= mat(0, N_(e,+)) sigma^i mat(N_(e,-); 0) + mat(0, N_(e,-)) sigma^i mat(N_(e,+); 0)\
    &= 2 N_(e,+) N_(e,-) (mat(0, 1) sigma^i mat(1; 0))\
    &= 2 N_(e,+) N_(e,-) sigma^i_(2, 1)
  $
  $
    overline(u) (4) gamma^0 u(2) = mat(N_(mu,+), 0, N_(mu,-), 0) gamma^0 gamma^0 mat(0; N_(mu,+); 0; -N_(mu,-)) = 0
  $
  $
    overline(u) (4) gamma^i u(2) &= mat(N_(mu,+), 0, N_(mu,-), 0) gamma^0 gamma^i mat(0; N_(mu,+); 0; -N_(mu,-)) = 2 N_(mu,+) N_(mu,-) sigma^i_(12)
  $
  从而
  $
    M & = g_e^2/(p_1-p_3)^2 (overline(u) (3) gamma^i u(1)) (overline(u) (4) gamma_i u(2)) \
      & = g_e^2/(p_1-p_3)^2 4 N_(e,+) N_(e,-) N_(mu,+) N_(mu,-) vb(sigma)_(21) dot vb(sigma)_(12) \
      & = (8 g_e^2)/(p_1-p_3)^2 N_(e,+) N_(e,-) N_(mu,+) N_(mu,-) \
  $
  其中
  $
    N_(f, plus) N_(f, minus) = (E_f^2 - m_f^2 c^4)/c^2 = abs(p_f)^2
  $
  从而
  $
    M = (8 g_e^2)/(p_1-p_3)^2 abs(vb(p)_e)^2 abs(vb(p)_mu)^2, abs(vb(p)_e) = abs(vb(p)_mu)
  $
  其中
  $
    p_1 = mat(E_e/c; vb(p)_e), p_3 = mat(E_e/c; -vb(p)_e)
  $
  从而
  $
    M = -2 g_e^2
  $
]

#exercise(subname: [7.27])[
  推导对湮灭$e^+ + e^- -> gamma + gamma$的振幅
  $
    M_1 = g_e^2/((p_1 - p_3)^2 - m^2 c^2) overline(v)(2) cancel(epsilon)^*(4) (cancel(p_1) - cancel(p_3) + m c) cancel(epsilon)^*(3) u(1)
  $
  $
    M_2 = g_e^2/((p_1 - p_4)^2 - m^2 c^2) overline(v)(2) cancel(epsilon)^*(3) (cancel(p_1) - cancel(p_4) + m c) cancel(epsilon)^*(4) u(1)
  $
]

#solution[

  #include "pic/10.1.typ"

  可以看到，两个图的振幅表达式是一样的，只是交换了两个光子外腿的位置，第一张图
  $
    &integral epsilon_mu^*(4) (overline(v)(2) (i g_e gamma^mu) (i (cancel(q) + m c))/(q^2 - m^2 c^2) (i g_e gamma^nu) u(1)) epsilon_nu^*(3) (2 pi)^4 delta^4(p_1 - q - p_3) delta^4(p_2 + q - p_4) dd(q, 4)/(2 pi)^4\
    = & - i g_e^2 overline(v)(2) cancel(epsilon)^*(4) ((cancel(p_1) - cancel(p_3) + m c))/((p_1 - p_3)^2 - m^2 c^2) cancel(epsilon)^*(3) u(1) (2 pi)^4 delta^4(p_1 + p_2 - p_3 - p_4)
  $
  从而
  $
    M_1 = g_e^2/((p_1 - p_3)^2 - m^2 c^2) overline(v)(2) cancel(epsilon)^*(4) (cancel(p_1) - cancel(p_3) + m c) cancel(epsilon)^*(3) u(1)
  $
  第二张图，将$p_3$换成$p_4$，同样可以得到
  $
    M_2 = g_e^2/((p_1 - p_4)^2 - m^2 c^2) overline(v)(2) cancel(epsilon)^*(3) (cancel(p_1) - cancel(p_4) + m c) cancel(epsilon)^*(4) u(1)
  $
]

#exercise(subname: [7.38])[
  + 从方程
    $
      expval(abs(M)^2) =& g_e^4/(p_1-p_3)^4 Tr(gamma^mu (cancel(p)_1 + m c) gamma^nu (cancel(p)_3 + m c)) Tr(gamma_mu (cancel(p)_2 + m c) gamma_nu (cancel(p)_4 + m c))\
      =& (8 g_e^4)/((p_1-p_3)^4) ((p_1 dot p_2)(p_3 dot p_4) + (p_1 dot p_4)(p_2 dot p_3) \
        & - (p_1 dot p_3)(m_mu c)^2 - (p_2 dot p_4)(m_e c)^2 + 2 (m_e m_mu c^2)^2)
    $
    开始，在高能区$(m, M -> 0)$计算质心系的自旋平均电子-缪子散射振幅。
  + 计算质心系高能电子-缪子散射的微分截面。让$E$为电子能量，$theta$为散射角。
]

#solution[
  +
    $
      expval(abs(M)^2) = & (8 g_e^4)/((p_1-p_3)^4) ((p_1 dot p_2)(p_3 dot p_4) + (p_1 dot p_4)(p_2 dot p_3) \
                         & - (p_1 dot p_3)(m_mu c)^2 - (p_2 dot p_4)(m_e c)^2 + 2 (m_e m_mu c^2)^2)
    $
    其中
    $
      p_1 = mat(E/c; vb(p)_i), p_2 = mat(E/c; -vb(p)_i), p_3 = mat(E/c; vb(p)_f), p_4 = mat(E/c; -vb(p)_f)\
      E^2/c^2 = abs(vb(p))^2, vb(p)_i dot vb(p)_f = abs(vb(p))^2 cos theta = E^2/c^2 cos theta
    $
    其中
    $
      (p_1-p_3)^2 = p_1^2 + p_3^2 - 2 p_1 dot p_3 = - 2 p_1 dot p_3
    $
    $
      p_1 dot p_2 = p_3 dot p_4 = 2 E^2/c^2\
    $
    $
      p_1 dot p_4 = p_2 dot p_3 = E^2/c^2 (1 + cos theta) = 2 E^2/c^2 cos^2(theta/2)
    $
    $
      p_1 dot p_3 = p_2 dot p_4 = E^2/c^2 (1 - cos theta) = 2 E^2/c^2 sin^2(theta/2)
    $
    从而
    $
      expval(abs(M)^2) = (8 g_e^4)/(4 E^4/c^4 sin^4(theta/2)) (4 E^4/c^4 + 4 E^4/c^4 cos^4(theta/2))= 2 g_e^4 (1 + cos^4(theta/2))/(sin^4(theta/2))
    $
  + 质心系的微分截面为
    $
      dv(sigma, Omega) = ((hbar c)/(8 pi))^2 g_e^4/(2 E^2) (1 + cos^4(theta/2))/(sin^4(theta/2))
    $
]
