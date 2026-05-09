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

= Feynman算法

== 散射截面

=== 截面

粒子和物质的相互作用中，对微观粒子来讲，物质无非是许许多多小颗粒的集合。粒子与粒子的相互作用用*截面*表示$sigma$，面积量纲，数值上很小，用的单位是barn（$1 "barn" = 10^(24) "cm"^2$）。

我们讨论一个薄层物质薄层：
$
  N times sigma << A
$
其中$N$该物质中总的粒子数，$A$该物质的总面积。
- 则当一个粒子穿过该物质时，相互作用的概率为
  $
    (N sigma)/A
  $
- 两束粒子对撞，总的碰撞概率是（束团截面$A$）
  $
    N_1 N_2 sigma / A
  $

=== 对撞机的亮度

对撞机的重要指标：*亮度*$L$
$
  L = f n (N_1 N_2) / A
$
其中
- $N_1,N_2$：两个对撞束流中的每个粒子团中的粒子数
- $A$：束流的对撞截面积
- $n$在环形对撞机（储存环）中的粒子团个数
- $f$：粒子团的环绕数量
- 单位为$"barn"^(-1)$
则观测到的*反应事例数（率）*
$
  R = sigma L
$
其中$sigma$是某个特定反应的截面。实验上经常是已知某一物理过程的理论截面，根据探测到的事例数去刻度对撞机的*瞬时亮度*和*积分亮度*。

=== 微分散射截面

微分散射截面$dv(sigma, Omega)$是指粒子以某个特定的方式散射的概率。比如，粒子以某个特定的角度散射，或者以某个特定的能量散射。微分散射截面通常用来描述粒子在不同条件下的散射行为。
- 硬球散射
  $
    dv(sigma, Omega) = R^2/4
  $
- Rutherford散射
  $
    dv(sigma, Omega) = ((q_1 q_2)/(4 E sin^2 (theta/2)))^2
  $

== 黄金规则

=== 衰变的黄金规则

衰变的黄金规则是指一个粒子衰变成其他粒子的概率。对于一个粒子$1$衰变成$2,3,...,n$粒子的过程
$
  1 -> 2 + 3 + ... + n
$
我们计算粒子的寿命$tau$，即衰变率（宽度）$Gamma = 1/tau$；衰变率由以下公式计算：
$
  Gamma = S/(2 hbar m_1) integral abs(M)^2 (2 pi)^4 delta^4(p_1 - sum_(i=2)^n p_i) product_(j=2)^n 2 pi delta(p_j^2 - m_j^2 c^2) theta(p_j^0) dd(p_j 4)/(2 pi)^4
$
这里的$p_j$表示第$j$个粒子的四动量。我们在粒子1的静止系考虑这一问题，$delta^4(p_1 - sum_(i=2)^n p_i)$保证了整体的能动量守恒，$delta(p_j^2 - m_j^2 c^2)$全部的外线粒子都在质量壳上，$theta(p_j^0)$保证了每个粒子都是正能量的$p_j^0 = E_j/c$，$abs(M)^2$是衰变振幅模平方，包含动力学的部分，$S$是一个全同粒子$S = 1/s!$
- 考虑粒子$a$衰变到$b,c,d$，其中$b,c,d$可以区分，则衰变振幅
  $
    M = abs(A(b,c,d)) dd(p_b, p_c, p_d)
  $
- 考虑粒子$a$衰变到$b, c,c$，其中有两个$c$，不可以区分，则衰变振幅$M$为
  $
    abs(A(b,c_1,c_2)+A(b,c_2,c_1)) dd(p_b, p_c_1, p_c_2)
  $
  $c$到动量1区间，$c$到动量2区间的两个振幅必须相干叠加。但是这样会重复计算了整体振幅两次，所以$abs(M)^2$必须除以2
- 考虑粒子$a$衰变到$c,c,c$，其中有三个$c$，不可以区分，则衰变振幅$M$为
  $
    abs(A(c_1,c_2,c_3)+A(c_1,c_3,c_2)+A(c_2,c_1,c_3)+A(c_2,c_3,c_1)+A(c_3,c_1,c_2)+A(c_3,c_2,c_1))\ dd(p_c_1, p_c_2, p_c_3)
  $
  $c$到动量1区间，$c$到动量2区间，$c$到动量3区间的六个振幅必须相干叠加。但是这样会重复计算了整体振幅六次，所以$abs(M)^2$必须除以$3!$

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

=== 衰变到两粒子的情形

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

=== 散射过程

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

=== 散射到两粒子的情形

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

== 玩具理论的Feynman规则
