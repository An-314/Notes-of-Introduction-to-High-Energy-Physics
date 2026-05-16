#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第九次作业],
  author: "Anzreww",
  time: "2026年5月",
)

#exercise(subname: [])[
  重复黄金规则的推导，计算衰变率和散射截面。
]
#newpara()

衰变的*黄金规则*是指一个粒子衰变成其他粒子的概率。对于一个粒子$1$衰变成$2,3,...,n$粒子的过程
$
  1 -> 2 + 3 + ... + n
$
我们计算粒子的寿命$tau$，即衰变率（宽度）$Gamma = 1/tau$；衰变率由以下公式计算：
$
  Gamma = S/(2 hbar m_1) integral abs(M)^2 (2 pi)^4 delta^4(p_1 - sum_(i=2)^n p_i) product_(j=2)^n 2 pi delta(p_j^2 - m_j^2 c^2) theta(p_j^0) dd(p_j, 4)/(2 pi)
$
这里的$p_j$表示第$j$个粒子的四动量。

我们在粒子1的静止系考虑这一问题
- $delta^4(p_1 - sum_(i=2)^n p_i)$保证了整体的能动量守恒
- $delta(p_j^2 - m_j^2 c^2)$全部的外线粒子都在质量壳上
- $theta(p_j^0)$保证了每个粒子都是正能量的$p_j^0 = E_j/c$
- $abs(M)^2$是衰变振幅模平方，包含动力学的部分
- $S$是一个全同粒子$S = 1/s!$

先处理$delta(p^2 - m^2 c^2)$
$
  dd(p, 4) = dd(p^0, vb(p))
$
则
$
  delta(p^2 - m^2 c^2) = delta((p^0)^2 - vb(p)^2 - m^2 c^2)
$
注意到
$
  delta(x^2 - a^2) = 1/(2 a) (delta(x - a) + delta(x + a)) (a>0)
$
因此，拆开并只取正解部分
$
  theta(p^0) delta((p^0)^2 - vb(p)^2 - m^2 c^2) = 1/(2 sqrt(vb(p)^2 + m^2 c^2)) delta(p^0 - sqrt(vb(p)^2 + m^2 c^2))
$
从而
$
  Gamma = &S/(2 hbar m_1) integral abs(M)^2 (2 pi)^4 delta^4(p_1 - sum_(i=2)^n p_i)\ &product_(j=2)^n 1/(2 sqrt(vb(p)_j^2 + m_j^2 c^2)) delta(p_j^0 - sqrt(vb(p)_j^2 + m_j^2 c^2)) (dd(p_j^0) dd(vb(p)_j, 3))/(2 pi)^3
$
积掉这一组质壳的$delta$函数
$
  Gamma = S/(2 hbar m_1) integral abs(M)^2 (2 pi)^4 delta^4(p_1 - sum_(i=2)^n p_i) product_(j=2)^n 1/(2 sqrt(vb(p)_j^2 + m_j^2 c^2)) (dd(vb(p)_j, 3))/(2 pi)^3
$
以后可以用$p^0_j$代替$sqrt(vb(p)_j^2 + m_j^2 c^2) = E_j (vb(p)_j)$，因为质壳条件保证了两者相等。

衰变到两粒子时，衰变率的公式可以简化为
$
  Gamma = S/(2 hbar m_1) integral abs(M)^2 (2 pi)^4 (delta^4(p_1 - p_2 - p_3))/(4 sqrt(vb(p)_2^2 + m_2^2 c^2) sqrt(vb(p)_3^2 + m_3^2 c^2)) (dd(vb(p)_2, vb(p)_3, 3))/(2 pi)^6
$
处理前面的系数
$
  Gamma = S/(32 pi^2 hbar m_1) integral abs(M)^2 (delta^4(p_1 - p_2 - p_3))/(sqrt(vb(p)_2^2 + m_2^2 c^2) sqrt(vb(p)_3^2 + m_3^2 c^2)) dd(vb(p)_2, vb(p)_3, 3)
$
粒子1是静止的
$
  p_1 = mat(m_1 c; vb(0))
$
并且2，3粒子在质壳上
$
  delta^4(p_1 - p_2 - p_3) &= delta(p_1^0 - p_2^0 - p_3^0) delta^3(vb(p)_1 - vb(p)_2 - vb(p)_3)\
  &= delta(m_1 c - sqrt(vb(p)_2^2 + m_2^2 c^2) - sqrt(vb(p)_3^2 + m_3^2 c^2)) delta^3(vb(p)_2 + vb(p)_3)
$
则宽度
$
  Gamma = &S/(32 pi^2 hbar m_1) integral abs(M)^2 (delta(m_1 c - sqrt(vb(p)_2^2 + m_2^2 c^2) - sqrt(vb(p)_3^2 + m_3^2 c^2)))/(sqrt(vb(p)_2^2 + m_2^2 c^2) sqrt(vb(p)_3^2 + m_3^2 c^2))\ &delta^3(vb(p)_2 + vb(p)_3) dd(vb(p)_2, vb(p)_3, 3)
$
再积掉一组动量守恒的$delta$函数：$vb(p)_2 = -vb(p)_3$，则
$
  Gamma = S/(32 pi^2 hbar m_1) integral abs(M)^2 (delta(m_1 c - sqrt(vb(p)_2^2 + m_2^2 c^2) - sqrt(vb(p)_2^2 + m_3^2 c^2)))/(sqrt(vb(p)_2^2 + m_2^2 c^2) sqrt(vb(p)_2^2 + m_3^2 c^2)) dd(vb(p)_2, 3)
$
转换到极坐标：$vb(p)_2 -> (r, theta, phi)$，则
$
  Gamma = S/(32 pi^2 hbar m_1) integral abs(M)^2 (delta(m_1 c - sqrt(r^2 + m_2^2 c^2) - sqrt(r^2 + m_3^2 c^2)))/(sqrt(r^2 + m_2^2 c^2) sqrt(r^2 + m_3^2 c^2)) r^2 sin theta dd(r, theta, phi)
$
现在$Gamma$只依赖于$vb(p)_2$ ，而宽度必须是标量，那可以构成标量形式的只有$vb(p)_2 dot vb(p)_2 = r^2$。换一个角度考虑
- 衰变前（质心系）：$vb(p)_1 = vb(0)$
- 衰变后（质心系）：$vb(p)_2 = -vb(p)_3$
如果1粒子没有自旋的极化，衰变后的内容是各向同性的，$Gamma$对方向没有依赖性

先处理对$theta$和$phi$的积分，我们认为$abs(M)$没有对其们的依赖性，则
$
  Gamma = S/(8 pi hbar m_1) integral abs(M)^2 (delta(m_1 c - sqrt(r^2 + m_2^2 c^2) - sqrt(r^2 + m_3^2 c^2)))/(sqrt(r^2 + m_2^2 c^2) sqrt(r^2 + m_3^2 c^2)) r^2 dd(r)
$
为了简化最后一个$delta$函数，定义
$
  u = sqrt(r^2 + m_2^2 c^2) + sqrt(r^2 + m_3^2 c^2)
$
则
$
  dv(u, r) = (u r)/(sqrt(r^2 + m_2^2 c^2) sqrt(r^2 + m_3^2 c^2))
$
左右同时变换
$
  r/u dd(u) = (r^2)/(sqrt(r^2 + m_2^2 c^2) sqrt(r^2 + m_3^2 c^2)) dd(r)
$
从而
$
  Gamma = S/(8 pi hbar m_1) integral_((m_2 + m_3)/c)^oo abs(M)^2 delta(m_1 c - u) r/u dd(u)
$
固定$u$到$m_1 c$，则
$
  sqrt(r^2 + m_2^2 c^2) + sqrt(r^2 + m_3^2 c^2) = m_1 c
$
将上式左右移动，并平方两次，推出$r$的值为
$
  r_0 = c/(2 m_1) sqrt(m_1^4 + m_2^4 + m_3^4 - 2 m_1^2 m_2^2 - 2 m_1^2 m_3^2 - 2 m_2^2 m_3^2)
$
因此，衰变率为
$
  Gamma = S/(8 pi hbar m_1) abs(M)^2 r_0/u = S/(8 pi hbar m_1) abs(M)^2 r_0/(m_1 c) = (S abs(vb(p)))/(8 pi hbar m_1^2 c) abs(M(vb(p)))^2
$
其中$vb(p)$是衰变后粒子在质心系中的动量，$abs(vb(p))$的表达式为
$
  abs(vb(p)) = c/(2 m_1) sqrt(m_1^4 + m_2^4 + m_3^4 - 2 m_1^2 m_2^2 - 2 m_1^2 m_3^2 - 2 m_2^2 m_3^2)
$

#newpara()

考虑粒子1和2碰撞生成$3, 4, ..., n$
$
  1 + 2 -> 3 + 4 + ... + n
$
- 碰撞前（质心系）：$vb(p)_1 = -vb(p)_2$
- 碰撞后（质心系）：$vb(p)_3 + vb(p)_4 + ... + vb(p)_n = vb(0)$
则碰撞的微分截面为
$
  sigma =& (S hbar^2)/(4 sqrt((p_1 dot p_2)^2 - m_1^2 m_2^2 c^4)) integral abs(M)^2 (2 pi)^4 delta^4(p_1 + p_2 - sum_(i=3)^n p_i) \
  &product_(j=3)^n 1/(2 sqrt(vb(p)_j^2 + m_j^2 c^2)) theta(p_j^0) (dd(vb(p)_j, 3))/(2 pi)^3
$
利用前面的计算公式，处理质壳的$delta$函数
$
  sigma = (S hbar^2)/(4 sqrt((p_1 dot p_2)^2 - m_1^2 m_2^2 c^4)) integral abs(M)^2 (2 pi)^4 delta^4(p_1 + p_2 - sum_(i=3)^n p_i) product_(j=3)^n 1/(2 sqrt(vb(p)_j^2 + m_j^2 c^2)) (dd(vb(p)_j, 3))/(2 pi)^3
$
其中$p_j^0$实际为$sqrt(vb(p)_j^2 + m_j^2 c^2)$，因为质壳条件保证了两者相等。

考虑粒子1和2碰撞生成3和4
$
  1 + 2 -> 3 + 4
$
- 碰撞前（质心系）：$vb(p)_1 = -vb(p)_2$
- 碰撞后（质心系）：$vb(p)_3 = -vb(p)_4$，散射角为$theta$，则
$
  sigma = &(S hbar^2)/(4 sqrt((p_1 dot p_2)^2 - m_1^2 m_2^2 c^4)) integral abs(M)^2 (2 pi)^4 delta^4(p_1 + p_2 - p_3 - p_4)\
  & 1/(4 sqrt(vb(p)_3^2 + m_3^2 c^2) sqrt(vb(p)_4^2 + m_4^2 c^2)) (dd(vb(p)_3, vb(p)_4, 3))/(2 pi)^6
$
计算一下前面的系数
$
  sqrt((p_1 dot p_2)^2 - m_1^2 m_2^2 c^4) & =^"自然单位制" sqrt((E_1 E_2 - vb(p)_1 dot vb(p)_2)^2 - m_1^2 m_2^2) \
  & = sqrt((E_1 E_2 + abs(vb(p)_1)^2)^2 - (E_1^2 - abs(vb(p)_1)^2)(E_2^2 - abs(vb(p)_1)^2)) \
  & = (E_1 + E_2) abs(vb(p)_1)\
  & =^"自然单位制" (E_1 + E_2) abs(vb(p)_1)/c
$
变换前面的系数，归结常数项：
$
  sigma = (S hbar^2 c)/(64 pi^2 (E_1 + E_2) abs(vb(p)_1)) integral abs(M)^2 (delta^4(p_1 + p_2 - p_3 - p_4))/(sqrt(vb(p)_3^2 + m_3^2 c^2) sqrt(vb(p)_4^2 + m_4^2 c^2)) dd(vb(p)_3, vb(p)_4, 3)
$
同前所述
$
  delta^4 (p_1 + p_2 - p_3 - p_4) = delta(E_1/c + E_2/c - p_3^0 - p_4^0) delta^3(vb(p)_3 + vb(p)_4)
$
再处理$vb(p)_3 = -vb(p)_4$
$
  sigma = (S hbar^2 c)/(64 pi^2 (E_1 + E_2) abs(vb(p)_1)) integral abs(M)^2 (delta(E_1/c + E_2/c - sqrt(vb(p)_3^2 + m_3^2 c^2) - sqrt(vb(p)_3^2 + m_4^2 c^2)))/(sqrt(vb(p)_3^2 + m_3^2 c^2) sqrt(vb(p)_3^2 + m_4^2 c^2)) dd(vb(p)_3, 3)
$
该散射过程明显有方向依赖性，讨论微分截面
$
  dd(vb(p)_3, 3) = r^2 dd(r, Omega)
$
则
$
  dv(sigma, Omega) = (hbar/(8pi))^2 (S c)/( (E_1 + E_2) abs(vb(p)_1)) integral_0^oo abs(M)^2 (delta(E_1/c + E_2/c - sqrt(r^2 + m_3^2 c^2) - sqrt(r^2 + m_4^2 c^2)))/(sqrt(r^2 + m_3^2 c^2) sqrt(r^2 + m_4^2 c^2)) r^2 dd(r)
$
继续做变换（其实是总能量）
$
  u = sqrt(r^2 + m_3^2 c^2) + sqrt(r^2 + m_4^2 c^2) = E_1 + E_2
$
有
$
  r/u dd(u) = (r^2)/(sqrt(r^2 + m_3^2 c^2) + sqrt(r^2 + m_4^2 c^2)) dd(r)
$
末态动量
$
  r_0 = abs(vb(p)_f) =& c^3/(2(E_1 + E_2)) \
  &sqrt((E_1 + E_2)^4/c^8 + m_3^4 + m_4^4 - 2 (E_1 + E_2)^2 m_3^2/c^4 - 2 (E_1 + E_2)^2 m_4^2/c^4 - 2 m_3^2 m_4^2)
$
则有
$
  dv(sigma, Omega) = ((hbar c)/(8pi))^2 (S abs(vb(p)_3))/( (E_1 + E_2) abs(vb(p)_1)) abs(M)^2 = ((hbar c)/(8pi))^2 (S abs(M)^2)/(E_1 + E_2)^2 abs(vb(p)_f)/abs(vb(p)_i)
$

#exercise(subname: [6.8])[
  考虑在实验室系($b$初始静止)的弹性散射，$a+b -> a+b$，假设靶如此之重($m_b c^2 >> E_a$)以致其反冲可以忽略。定出微分截面。[提示:在这个极限下实验室系和质心系是一样的]
]

#solution[
  注意到散射过程对于质心系有
  $
    dv(sigma, Omega) = ((hbar c)/(8pi))^2 (S abs(vb(p)_3))/( (E_1 + E_2) abs(vb(p)_1)) abs(M)^2 = ((hbar c)/(8pi))^2 (S abs(M)^2)/(E_1 + E_2)^2 abs(vb(p)_f)/abs(vb(p)_i)
  $
  而在实验室系中，$abs(vb(p)_i) = abs(vb(p)_f)$，并且有
  $
    E_1 + E_2 = E_a + m_b c^2 approx m_b c^2
  $
  因此
  $
    dv(sigma, Omega) = ((hbar c)/(8pi))^2 (S abs(M)^2)/(m_b c^2)^2
  $
]

#exercise(subname: [6.15])[
  + 计算$A + B -> A + B$的最低阶振幅(有两个图)
  + 假设$m_A = m_B = m, m_C = 0$计算这个过程在质心系的微分截面。用入射能量 ($A$的)$E$和散射角(对粒子$A$)$theta$表达你的结果
  + 假设$B$比$A$重很多且保持静止，$A$以能量$E$入射，计算在实验室系这个过程的$dv(sigma, Omega)$
  + 计算上一问的总截面$sigma$
]

#solution[

  #import "@preview/inknertia:0.1.0": feynman
  #import feynman: *

  #let L = 0.48cm

  // 左图：s-channel
  #let diag_left = feynman(
    orientation: "vertical",
    length: L,
    (
      vertex("tl", label: $B$),
      vertex("tr", label: $A$),
      vertex("br", label: $B$),
      vertex("bl", label: $A$),
      vertex("vt", shape: "dot"),
      vertex("vb", shape: "dot"),
      edge("tl", "vt", momentum: $p_2$),
      edge("vt", "tr", momentum: $p_3$),
      edge("bl", "vb", momentum: $p_1$),
      edge("vb", "br", momentum: $p_4$),
      edge("vb", "vt", label: $C$, momentum: $q$),
    ),
  )

  // 右图：t-channel
  #let diag_right = feynman(
    orientation: "horizontal",
    length: L,
    (
      vertex("lb", label: $A$),
      vertex("lt", label: $B$),
      vertex("rt", label: $A$),
      vertex("rb", label: $B$),
      vertex("vl", shape: "dot"),
      vertex("vr", shape: "dot"),
      edge("lt", "vl", momentum: $p_2$),
      edge("lb", "vl", momentum: $p_1$),
      edge("vl", "vr", label: $C$, momentum: $q$),
      edge("vr", "rt", momentum: $p_3$),
      edge("vr", "rb", momentum: $p_4$),
    ),
  )

  #grid(
    columns: 2,
    column-gutter: 1.2cm,
    [#diag_left], [#diag_right],
  )
  + 计算$A + B -> A + B$的最低阶振幅(有两个图)
    - 对于第一个图，振幅为
      $
        &integral (-i g)^2 i/(q^2 - m_C^2 c^2) (2pi)^4 delta^4(p_1 - p_4 - q) (2pi)^4 delta^4(p_2 - p_3 + q) dd(q, 4)/(2pi)^4 \
        =& (-i g^2)/((p_1 - p_4)^2 - m_C^2 c^2) (2pi)^4 delta^4(p_1 + p_2 - p_3 - p_4) \
      $
      得到
      $
        M_1 = g^2/((p_1 - p_4)^2 - m_C^2 c^2)
      $
    - 对于第二个图，振幅为
      $
        &integral (-i g)^2 i/(q^2 - m_C^2 c^2) (2pi)^4 delta^4(p_1 + p_2 - q) (2pi)^4 delta^4(q - p_3 - p_4) dd(q, 4)/(2pi)^4 \
        =& (-i g^2)/((p_1 + p_2)^2 - m_C^2 c^2) (2pi)^4 delta^4(p_1 + p_2 - p_3 - p_4) \
      $
      得到
      $
        M_2 = g^2/((p_1 + p_2)^2 - m_C^2 c^2)
      $
    - 总振幅是二者叠加
      $
        M = M_1 + M_2 = g^2/((p_1 - p_4)^2 - m_C^2 c^2) + g^2/((p_1 + p_2)^2 - m_C^2 c^2)
      $
  + $m_A = m_B = m, m_C = 0$就有
    $
      p_1 + p_2 = mat((2 E)/c; vb(0))
    $
    从而
    $
      (p_1 + p_2)^2 = 4 E^2/c^2
    $
    同时
    $
      p_1 - p_4 = mat(0; vb(p)_1 - vb(p)_4) = mat(0; vb(p)_1 + vb(p)_3)
    $
    从而
    $
      (p_1 - p_4)^2 & = - abs(vb(p)_1 + vb(p)_3)^2 = - (vb(p)_1^2 + vb(p)_3^2 + 2 vb(p)_1 dot vb(p)_3) \
                    & = -(2 vb(p)^2 + 2 vb(p)^2 cos theta) = -4 vb(p)^2 cos^2(theta/2)
    $
    可以计算振幅
    $
      M = g^2/4 (c^2/E^2 - 1/(vb(p)^2 cos^2(theta/2)))
    $
    带入微分截面公式
    $
      dv(sigma, Omega) &= ((hbar c)/(8pi))^2 (S abs(M)^2)/(E_1 + E_2)^2 abs(vb(p)_f)/abs(vb(p)_i) = ((hbar c)/(8pi))^2 (abs(M)^2)/(4 E^2)\
      &= ((hbar c)/(8pi))^2 1/(2E)^2 g^4/16 (c^2/E^2 - 1/(vb(p)^2 cos^2(theta/2)))^2
    $
    注意到
    $
      vb(p)^2 = E^2/c^2 - m^2 c^2
    $
    则
    $
      dv(sigma, Omega) & = ((hbar c)/(8pi))^2 1/(2E)^2 g^4/64 (c^2/E^2 - 1/((E^2/c^2 - m^2 c^2) cos^2(theta/2)))^2 \
                       & = ((hbar c g^2)/(64 pi E))^2 (c^2/E^2 - c^2/(E^2 - m^2 c^4) sec^2(theta/2))^2
    $
  + 在实验室系中，$B$比$A$重很多且保持静止，$A$以能量$E$入射，则
    $
      dv(sigma, Omega) = ((hbar c)/(8pi))^2 (abs(M)^2)/(m_B c^2)^2
    $
    继续算$M$
    $
      p_1 = mat(E/c; vb(p)_1), p_2 = mat(m_B c; vb(0)), p_3 = mat(E/c; vb(p)_3), p_4 = mat(m_B c; vb(0))
    $
    $
      p_1 - p_4 = mat((E - m_B c^2)/c; vb(p)_1), p_1 + p_2 = mat((E + m_B c^2)/c; vb(p)_1)
    $
    其中
    $
      vb(p)_1^2 = E^2/c^2 - m_A^2 c^2 approx E^2/c^2
    $
    从而
    $
      (p_1 - p_4)^2 - m_C^2 c^2 = (E - m_B c^2)^2/c^2 - vb(p)_1^2 approx m_B^2 c^2 - 2 E m_B
    $
    而
    $
      (p_1 + p_2)^2 - m_C^2 c^2 = (E + m_B c^2)^2/c^2 - vb(p)_1^2 approx m_B^2 c^2 + 2 E m_B
    $
    则
    $
      M & = g^2/(m_B^2 c^2 - 2 E m_B) + g^2/(m_B^2 c^2 + 2 E m_B) = (g^2)/(m_B) (1/(m_B c^2 - 2 E) + 1/(m_B c^2 + 2 E)) \
        & = (g^2)/(m_B) (2 m_B c^2)/((m_B c^2)^2 - (2 E)^2) = (2 g^2 c^2)/((m_B c^2)^2 - 4 E^2)
    $
    从而
    $
      dv(sigma, Omega) = ((hbar c)/(8pi))^2 (abs(M)^2)/(m_B c^2)^2 = ((hbar g^2)/(4 pi m_B^2 c))^2 1/((m_B c^2)^2 - 4 E^2)^2
    $
  + 计算上一问的总截面$sigma$
    $
      sigma = integral dv(sigma, Omega) = 4 pi dv(sigma, Omega) = 1/pi ((hbar g^2)/(2 m_B^2 c))^2 1/((m_B c^2)^2 - 4 E^2)^2
    $
]
