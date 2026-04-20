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

= 束缚态

== Schrödinger方程和氢原子

=== Schrödinger

低速情形下能动量关系
$
  E = p^2/(2m)
$
对应的Schrödinger方程
$
  i hbar pdv(psi, t) = - hbar^2/(2m) laplacian psi
$
在一个力场中，有相应的势能
$
  i hbar pdv(psi, t) = - hbar^2/(2m) laplacian psi + U(vb(r)) psi
$

=== 氢原子

*氢原子结构*
- 氢原子：电子和氢原子核的组合
  - 氢原子核：质子，$m=1$GeV，$Q=+1$，$s=1/2$
  - 核外电子：$m=0.5$MeV，$Q=-1$，$s=1/2$
- 主量子数$n=1, 2...$，轨道角动量$L=0,...,n-1$
- Schrödinger方程的解
  $
    E_n = -alpha^2 m c^2 1/(2n^2)
  $
  关于$l$简并
*精细结构*
- 相对论修正：动能
  $
    T = p^2/(2m) - p^4/(8m^3 c^2) + ...
  $
- 自旋轨道耦合
  $
    Delta E = -alpha^4 m c^2 1/(4 n^4) ((2n)/(j+1/2) - 3/2)
  $
  电子自旋，与轨道角动量；能级劈裂，和$j=l+s$有关系，$alpha^4$
*超精细结构*
- 核自旋
  $
    Delta E = m/m_p alpha^4 m c^2 gamma_p/(2 n^3) (plus.minus)/((f + 1/2)(1 + 1/2)), f = j plus.minus 1/2
  $
  能级劈裂，和$j$有关系，$alpha^4$和$m/(m_p)$压低

== 正电子偶素

*与氢原子能级结构的差异*

== 夸克偶素

== 轻夸克介子

== 重子波函数

== 重子磁矩

== 重子质量
