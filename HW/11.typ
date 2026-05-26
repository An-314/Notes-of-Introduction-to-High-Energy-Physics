#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第十一次作业],
  author: "Anzreww",
  time: "2026年5月",
)

#exercise(subname: [例10.1 标量(自旋-0)场的Klein-Gordon Lagrange量])[
  $
    cal(L) = 1/2 partial_mu phi partial^mu phi - 1/2 ((m c)/hbar)^2 phi^2
  $
]

#newpara()
标量场$phi$，它只有一个分量，对应自旋$s=0$的场。
$
  cal(L) = 1/2 partial_mu phi partial^mu phi - 1/2 ((m c)/hbar)^2 phi^2
$
其中
$
  partial_mu phi = pdv(phi, x^mu)
$
场论中的Lagrange方程为
$
  partial_mu pdv(cal(L), (partial_mu phi_i)) = pdv(cal(L), phi_i)
$
注意到
$
  pdv(cal(L), (partial_0 phi)) & = partial_0 phi = partial^0 phi \
  pdv(cal(L), (partial_i phi)) & = - partial_i phi = partial^i phi, i = 1, 2, 3 \
$
即
$
  pdv(cal(L), (partial_mu phi)) = partial^mu phi
$
以及
$
  pdv(cal(L), phi) & = - ((m c)/hbar)^2 phi
$
从而由Lagrange方程得到
$
  partial_mu partial^mu phi + ((m c)/hbar)^2 phi = 0
$
这即是标量场的Klein-Gordon方程。

#exercise(subname: [例10.1 旋量(自旋-1/2)场的Dirac Lagrange量])[
  $
    cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi
  $
]

#newpara()
旋量场$psi$，它有四个分量，对应自旋$s=1/2$的场。
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi
$
其中$gamma^mu$是Dirac矩阵，满足反对易关系
$
  {gamma^mu, gamma^nu} = 2 g^(mu nu) I
$
场论中的Lagrange方程为
$
  partial_mu pdv(cal(L), (partial_mu psi_i)) = pdv(cal(L), psi_i)
$
注意到
$
            pdv(cal(L), (partial_mu psi)) & = i hbar c overline(psi) gamma^mu \
  pdv(cal(L), (partial_mu overline(psi))) & = 0
$
以及
$
            pdv(cal(L), psi) & = - m c^2 overline(psi) \
  pdv(cal(L), overline(psi)) & = i hbar c gamma^mu partial_mu psi - m c^2 psi
$
从而由Lagrange方程得到
$
  i hbar c gamma^mu partial_mu psi - m c^2 psi = 0\
  i hbar c partial_mu overline(psi) gamma^mu + m c^2 overline(psi) = 0
$
为Dirac方程和其伴随方程。


#exercise(subname: [])[
  局域规范不变性
]

#newpara()

系统可以做一个整体的相位变换，而没有实际变换。例如：对旋量场做一个变化
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi \
  psi -> e^(i alpha) psi, overline(psi) -> e^(- i alpha) overline(psi)
$
$phi$是时空无关的常数，称为规范变换的参数。这个变换叫做整体规范变换，Lagrange量在这个变换下保持不变，称为*整体规范不变性*，即全局$"U"(1)$相位不变性。

如果变换是时空相关的：
$
  psi -> e^(i theta(x)) psi
$
则有
$
  partial_mu psi -> partial_mu (e^(i theta(x)) psi) = e^(i theta(x)) (partial_mu + i partial_mu theta(x)) psi
$
旋量场Lagrange量
$
  cal(L) -> &i hbar c overline(psi) gamma^mu (partial_mu + i partial_mu theta(x)) psi - m c^2 overline(psi) psi\
  &= i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi + hbar c overline(psi) gamma^mu psi partial_mu theta(x)
$
做符号替换
$
  lambda(x) = - (hbar c)/q theta(x)
$
则有
$
  cal(L) -> i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi - q overline(psi) gamma^mu psi partial_mu lambda
$
自由Dirac Lagrange量不满足局域规范不变性。

为了使它满足规范不变性，引入*规范场*
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi - q overline(psi) gamma^mu psi A_mu
$
并要求新引入的场$A$的规范变换为
$
  A_mu -> A_mu + partial_mu lambda(x)
$
则有
$
  cal(L) -> i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi - q overline(psi) gamma^mu psi partial_mu lambda - q overline(psi) gamma^mu psi (A_mu + partial_mu lambda) \
  = i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi - q overline(psi) gamma^mu psi A_mu
$
后两项消掉，引入场$A$后新定义的Lagrange量在*局域规范变换下不变*，这引入了相互作用。即光子场是由局域规范不变性要求出来的。

还需要引入规范场的自由项满足完备性，但$A^mu$本身也应该是一个可以传播的场，所以还要给它加自由项。对于矢量场，考虑Proca Lagrange量
$
  cal(L) = - 1/(16 pi) F^(mu nu) F_(mu nu) + 1/(8 pi) ((m c)/hbar)^2 A^mu A_mu\
  F^(mu nu) = partial^mu A^nu - partial^nu A^mu
$
但是现在有一个重要限制：规范场要满足局域规范不变性。在规范变换下：
$
  A_mu -> A_mu + partial_mu lambda(x) \
$
场强张量变成
$
  F^(mu nu) -> F^(mu nu) + partial^mu partial_nu lambda(x) - partial^nu partial_mu lambda(x) = F^(mu nu)
$
因此
$
  F^(mu nu) F_(mu nu) -> F^(mu nu) F_(mu nu)
$
规范不变，但质量项
$
  A^mu A_mu -> (A^mu + partial^mu lambda) (A_mu + partial_mu lambda)
$
不是规范不变的，从而$A$必须是无质量的场；于是完整的QED型Lagrange量为
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi - q overline(psi) gamma^mu psi A_mu - 1/(16 pi) F^(mu nu) F_(mu nu)
$
局域规范不变性自然产生了相互作用，但同时要求规范场是无质量的。从旋量场出发，由局域规范不变性，引入了规范场，以及规范场和旋量场的相互作用。

定义协变导数$cal(D)$
$
  cal(D)_mu = partial_mu + i q/(hbar c) A_mu
$
则有
$
  cal(D)_mu psi -> e^(- i/(hbar c) q lambda(x)) cal(D)_mu psi
$
这只是一个符号替换，用了协变导数替代后，是局域规范变化不变的
$
  cal(L) = i hbar c overline(psi) gamma^mu cal(D)_mu psi - m c^2 overline(psi) psi - 1/(16 pi) F^(mu nu) F_(mu nu)
$
对于一个带电旋量场$psi$，如果要求它在局域$"U"(1)$变换下不变
$
  psi -> e^(i theta(x)) psi
$
那么必须引入一个规范场$A_mu$，并把普通导数换成协变导数：
$
  cal(D)_mu = partial_mu + i q/(hbar c) A_mu
$
于是自然出现了相互作用项
$
  - q overline(psi) gamma^mu psi A_mu
$
这个结构在 QED 里对应：
- $psi$带电粒子场，例如电子场
- $A_mu$光子场

#exercise(subname: [])[
  质量项
]

#newpara()
在标量场的特殊势能项，使得极小值不再在原点
$
  cal(L) = 1/2 (partial_mu phi) (partial^mu phi) + 1/2 mu^2 phi^2 - 1/4 lambda phi^4
$
第二项这看起来像是质量，但符号不对，$mu,lambda$都是实数。这个势能的形状不是普通的单谷，而是“双谷”形状。原点$phi=0$不是最低点，而是一个不稳定点。
$
  U = -1/2 mu^2 phi^2 + 1/4 lambda phi^4
$
对$U$在极小值附近展开
$
  phi(U_min) = plus.minus mu/lambda
$
势能最低点不在原点，而是在左右两个对称的位置。

我们就不应该围绕$phi=0$描述小振动，而应该围绕某一个真空重新定义场。例如选右边的真空
$
  phi_0 = mu/lambda
$
定义
$
  eta = phi - phi_0
$
把场重新定义为偏离真空值的小涨落。从而引入
$
  eta = phi plus.minus mu/lambda
$
对$U$展开
$
  cal(L) = 1/2 (partial_mu eta) (partial^mu eta) - mu^2 eta^2 plus.minus mu lambda eta^3 - 1/4 lambda eta^4 + 1/4 (mu/lambda)
$
其中$- mu^2 eta^2$为质量项，和
$
  - 1/2 ((m c)/hbar)^2 phi^2
$
比较得到
$
  m = sqrt(2) mu hbar/c
$
剩下的是新耦合项（三、四相互作用顶角）和常数项。
