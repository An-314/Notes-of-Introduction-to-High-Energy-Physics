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

= 规范理论

在前面的内容后，我们很好奇一些问题
- 相互作用怎么产生的？
- Feynman图怎么产生的？
- 怎么产生胶子场？
- 怎么产生光子场？
- $W$，$Z$怎么获取质量
- Higgs怎么了？为什么这么出名？

== 经典粒子力学的Lagrange体系

Newton第二定律给出
$
  vb(F) = m vb(a)
$
对保守力，表达为标量势$U$的梯度
$
  m vb(a) = - grad U => m dv(vb(v), t) = - grad U
$
Lagrange量定义为
$
  L = T - U
$
其中$T$是动能，$U$是势能。Lagrange方程为
$
  dv(, t)(dv(L, dot(q)_i)) = dv(L, q_i)
$
代入
$
  L = T - U = 1/2 m vb(v)^2 - U(q)
$
则有
$
  dv(, t)(dv(L, dot(q)_i)) = dv(L, q_i) => m dv(vb(v), t) = - grad U
$
这正是保守体系的Newton第二定律。

事实上，Hamilton最小作用量原理、Lagrange方程、Newton定律是等价的。Lagrange体系的优点在于它可以很方便地推广到相对论场论中。

== 相对论场论中的Lagrange量

场论里，基本变量不再是有限个坐标$q_i (t)$，而是分布在时空每一点的场
$
  phi_i (x), x^mu = mat(t, vb(x))
$
场论中的Lagrange方程为
$
  dot(q)_i -> partial_mu phi_i
$
$
  partial_mu pdv(cal(L), (partial_mu phi_i)) = pdv(cal(L), phi_i)
$
其中$cal(L)$是Lagrange量密度，$phi_i$是场变量。对时间的微商与对其他时空指标的微商，等权的。

*标量场的 Klein–Gordon Lagrange量*：标量场$phi$，它只有一个分量，对应自旋$s=0$的场。
$
  cal(L) = 1/2 partial_mu phi partial^mu phi - 1/2 ((m c)/hbar)^2 phi^2
$
代入场的Lagrange方程，得到Klein–Gordon方程，注意到
$
  pdv(cal(L), (partial_0 phi)) & = partial_0 phi = partial^0 phi \
  pdv(cal(L), (partial_i phi)) & = - partial_i phi = partial^i phi, i = 1, 2, 3 \
              pdv(cal(L), phi) & = - ((m c)/hbar)^2 phi
$
从而
$
  partial_mu partial^mu phi + ((m c)/hbar)^2 phi = 0
$
这即是标量场的Klein–Gordon方程。

*旋量场的 Klein–Gordon Lagrange量*：旋量场$psi$，它有四个分量，对应自旋$s=1/2$的场。
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - m c^2 overline(psi) psi
$
代入场的Lagrange方程，得到Dirac方程，注意到
$
            pdv(cal(L), (partial_mu psi)) & = i hbar c overline(psi) gamma^mu \
                         pdv(cal(L), psi) & = - m c^2 overline(psi) \
  pdv(cal(L), (partial_mu overline(psi))) & = 0 \
               pdv(cal(L), overline(psi)) & = i hbar c gamma^mu partial_mu psi - m c^2 psi
$
得到Dirac方程和其伴随方程
$
  i hbar c gamma^mu partial_mu psi - m c^2 psi = 0 \
  i hbar c partial_mu overline(psi) gamma^mu + m c^2 overline(psi) = 0
$
#newpara()

*矢量场的Proca Lagrange量*：矢量场$A^mu$，它有四个分量，对应自旋$s=1$的场。
$
  cal(L) = - 1/(16 pi) (partial^mu A^nu - partial^nu A^mu) (partial_mu A_nu - partial_nu A_mu) + 1/(8 pi) ((m c)/hbar)^2 A^mu A_mu
$
对它应用Lagrange方程，得到Proca方程，注意到
$
  partial_mu (partial^mu A^nu - partial^nu A^mu) + ((m c)/hbar)^2 A^nu = 0
$
Proca方程，后来将用于光子场，胶子场。缩写为
$
  F^(mu nu) = partial^mu A^nu - partial^nu A^mu
$
$
  cal(L) = - 1/(16 pi) F^(mu nu) F_(mu nu) + 1/(8 pi) ((m c)/hbar)^2 A^mu A_mu
$

== 局域规范不变性

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
旋量场拉氏量
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
后两项消掉，引入场$A$后新定义的拉氏量在*局域规范变换下不变*，这引入了相互作用。光子场是由局域规范不变性要求出来的。

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
这只是一个符号替换，核心概念是用了协变导数替代后，是局域规范变化不变的
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
也就是说，光子场和电磁相互作用可以看成是由局域$"U"(1)$规范不变性要求出来的。考虑到
$
  "带电粒子"⟷"光子场", "带色粒子"⟷"胶子场"
$
也就是：
- $psi$对应夸克场
- $A_mu$对应胶子场
但强相互作用比电磁相互作用复杂，因为电荷只有一种，而色荷有三种：红、绿、蓝。因此不能只用一个简单的$"U"(1)$相位变换，而要用更复杂的群变换。

== Yang-Mills理论

引入两个旋量场，没有相互作用
$
  cal(L) = i hbar c overline(psi_1) gamma^mu partial_mu psi_1 - m_1 c^2 overline(psi_1) psi_1 + i hbar c overline(psi_2) gamma^mu partial_mu psi_2 - m_2 c^2 overline(psi_2) psi_2
$
并将它们引入到一个列矢量
$
  psi = mat(psi_1; psi_2)
$
并且让两个质量相等（为什么要要求质量相等？因为后面要允许$psi_1,psi_2$彼此混合。如果两者质量不同，混合之后质量项就不再保持原样，对称性会被破坏。）
$
  M = mat(m_1, 0; 0, m_2)
$
Lagrange量为
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - M c^2 overline(psi) psi
$
$psi$是一个矢量，它的每一个分量再是一个四矢量。变换如下：
$
  psi -> U psi
$
最一般的情况
$
  U = e^(i H), H = theta + vb(sigma) dot vb(a)
$
$H$是Hermitian矩阵，$theta$是一个实数，$vb(a)$是一个实三维矢量，是时空依赖的，$vb(sigma)$是三个Pauli矩阵。这个变换对应一个$"U"(2)$群。Lagrange量在这个变换下保持不变，称为整体$"U"(2)$规范不变性。

现在像前面QED那样，把变换参数变成时空函数。
$
  psi -> S psi, S = e^(- u/(hbar c) q vb(sigma) dot vb(lambda)(x))
$
其中
$
  partial_mu psi -> S partial_mu psi + (partial_mu S) psi
$
再次使用协变导数的形式取消除定域$"SU"(2)$变换的影响
$
  cal(D)_mu = partial_mu + i q/(hbar c) vb(sigma) dot vb(A)_mu
$
引入三维的规范场$vb(A)_mu$，它是一个三维矢量，每个分量又是一个四矢量。Lagrange量为
$
  cal(L) &= i hbar c overline(psi) gamma^mu cal(D)_mu psi - M c^2 overline(psi) psi - 1/(16 pi) F^(mu nu) dot F_(mu nu)\
  &= i hbar c overline(psi) gamma^mu partial_mu psi - M c^2 overline(psi) psi - q overline(psi) gamma^mu vb(sigma) dot vb(A)_mu - 1/(16 pi) F^(mu nu) dot F_(mu nu)
$
这个式子和 QED 的式子非常像。区别在于，QED 只有一个规范场$A_mu$，而$"SU"(2)$有三个规范场$vb(A)_mu$。而且中间多了 Pauli 矩阵$σ$，它告诉我们规范场如何在内部二重态空间里作用。

非Abel理论真正的新东西——规范场也会自相互作用。在$"U"(1)$理论里，规范场场强是
$
  F^(mu nu) = partial^mu A^nu - partial^nu A^mu
$
光子本身不带电，所以光子之间没有直接的三光子、四光子顶角。但在非Abel理论里，场强不只是简单的导数差，还会多出规范场自身的项。形式上类似：
$
  F_(mu nu)^a = partial_mu A_nu^a - partial_nu A_mu^a + g f^(a b c) A_mu^b A_nu^c
$
这里$f^(a b c)$是群的结构常数。这个额外项意味着：非阿贝尔规范场本身也携带相应“*荷*”，因此规范场之间可以自相互作用。这对于 QCD 特别重要，因为胶子本身带色荷，所以胶子可以和胶子相互作用。这也是强相互作用很多特殊性质的来源，比如渐近自由、禁闭等。

两个同质量的旋量场，$"SU"(2)$变换，独立参数三个，三个生成
元，引入了三个场；同时引入了两个旋量场和规范场的相互作用；但这三个场仍然无法获得质量。Yang-Mills理论原本是为了$p$和$n$准备的，直到我们有了色荷和$"SU"(3)$，才真正有了Yang-Mills理论的应用。
- QED: 局域$"U"(1)$⇒一个规范场$A_mu$⇒光子
- Yang–Mills: 局域$"SU"(2)$⇒三个规范场$vb(A)_mu$
- 更一般地：规范群有几个生成元，就需要几个规范场

== 色动力学

现在对QCD来说，基本对象不是两个场，而是同一种夸克的三种颜色状态
$
  psi_1, psi_2, psi_3
$
三个没有相互作用的自由Dirac场
$
  cal(L) = i hbar c overline(psi_1) gamma^mu partial_mu psi_1 - m c^2 overline(psi_1) psi_1 + i hbar c overline(psi_2) gamma^mu partial_mu psi_2 - m c^2 overline(psi_2) psi_2 + i hbar c overline(psi_3) gamma^mu partial_mu psi_3 - m c^2 overline(psi_3) psi_3
$
$psi_1, psi_2, psi_3$对应一种夸克的三个颜色，拥有相同的质量，在它们内部可以进行$"SU"(3)$变换，正好Yang-Mills场的要求。实际上，有六个味道的夸克，上面的符号要复制6次。

考虑
$
  psi = mat(psi_1; psi_2; psi_3), M = m I
$
Lagrange量为
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - M c^2 overline(psi) psi
$
同样给出局域$"SU"(3)$变换
$
  psi -> S psi, S = e^(- u/(hbar c) q vb(lambda) dot vb(a))
$
引入八个规范场$A_mu^a$，以及它们的相互作用项
$
  cal(L) = i hbar c overline(psi) gamma^mu partial_mu psi - M c^2 overline(psi) psi - q overline(psi) gamma^mu vb(lambda) psi vb(A)_mu - 1/(16 pi) F^(mu nu)^a F_(mu nu)^a
$
要求局域$"SU"(3)$颜色规范不变性⇒必须引入8个胶子场。

因为颜色有三种：$r,g,b$。如果想象胶子负责把一种颜色变成另一种颜色，似乎可以有：$3 times 3=9$种组合，比如：
$
  r overline(r), r overline(g), r overline(b) \
$
那为什么QCD说有8个胶子？

原因是QCD的规范群是$"SU"(3)$，不是$"U"(3)$。$"U"(3)$的生成元数是9，但它可以分解为：
$
  "U"(3)≃"SU"(3)times.o "U"(1).
$
其中$"SU"(3)$有8个生成元；额外的$"U"(1)$对应一个颜色单态的组合，类似：
$
  1/sqrt(3) (r overline(r) + g overline(g) + b overline(b))
$
这个颜色单态不属于$"SU"(3)$的八重态胶子。如果存在这种额外的无质量$"U"(1)$胶子，会带来一种额外的长程强相互作用，但实验上没有看到。所以实际QCD取的是$"SU"(3)$，因此有 8 个胶子。

== Feynman规则

事实上Feynman图的规则从Lagrange量里就可以推导出来：
- Lagrange量的相互作用项$=>$顶角规则
- Lagrange量的自由项$=>$传播子规则

电磁相互作用QED的Lagrange量为
$
  cal(L)_"int" = - q overline(psi) gamma^mu psi A_mu
$
给出顶角因子
$
  i g_e gamma^mu
$
#newpara()
强相互作用QCD的Lagrange量为
$
  cal(L)_"int" = - (q overline(psi) gamma^mu vb(lambda) psi) dot vb(A)_mu
$
给出顶角因子
$
  i g_s gamma^mu lambda^a = i g_s gamma^mu T^a
$

== 质量项

前面规范理论带来的一个重大问题：
- 局域规范不变性可以自然产生相互作用：局域规范不变性⇒规范场⇒相互作用项
- 但是有一个麻烦：规范场不能直接加质量项。
对于矢量场，直接质量项一般形式为
$
  1/2 m^2 A^mu A_mu
$
规范变换下
$
  A^mu A_mu -> (A^mu + partial^mu lambda)(A_mu + partial_mu lambda)
$
破坏局域规范不变性。这对光子和胶子没有问题，因为光子、胶子都是无质量的。但对弱相互作用的$W_plus.minus,Z^0$就有问题，因为它们实验上是有质量的。

以往生成Lagrange量和质量项有任意性，基于猜测。局域规范不变性产生了相互作用和规范场，都有了相应的产生规则，例如电磁相互作用QED，强相互作用QCD。很遗憾：局域规范不变性产生的规范场必须是
无质量的，否则会破坏这种不变性。在势能项的最小值附近展开试试，认为最小值才是真空所在的位置，可能不是原点。

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
其中$- mu^2 eta^2$为质量项，剩下的是新耦合项（三、四相互作用顶角）和常数项。

就是Higgs机制的思想雏形。后面会进一步把这个标量场和局域规范场结合起来。那时不仅标量场自己的涨落会获得质量，规范场$A_mu$也会因为标量场的非零真空期望值而获得质量。

== 对称性自发破缺

先考虑两个实标量场
$
  cal(L) = 1/2 (partial_mu phi_1) (partial^mu phi_1) + 1/2 (partial_mu phi_2) (partial^mu phi_2) + 1/2 mu^2 (phi_1^2 + phi_2^2) - 1/4 lambda (phi_1^2 + phi_2^2)^2
$
因为Lagrange量只依赖于组合$phi_1^2 + phi_2^2$，所以它在$phi_1, phi_2$平面中的旋转下不变。势能项是
$
  U = - 1/2 mu^2 (phi_1^2 + phi_2^2) + 1/4 lambda (phi_1^2 + phi_2^2)^2
$
同上地，有最小值在
$
  r^2 = phi_1^2 + phi_2^2 = mu^2/lambda^2
$
势能最低点是一整圈真空。Lagrange量本身有旋转对称性，因为它只依赖$phi_1^2 + phi_2^2$，但是系统真正的真空必须选在极小值圆环上的某一个点。例如
$
  phi_1 = mu/lambda, phi_2 = 0
$
这个选择本身不再具有完整的旋转对称性。因为一旦选定这个点，场空间里的不同方向就不等价了。即*拉氏量有对称性，但真空态没有同样的对称性*，这就是对称性自发破缺。

自发的意思是：不是外部人为加了一个不对称项，而是势能形状本身让系统必须选择某一个最低点。每一个最低点都等价，但一旦选定其中一个，原来的连续对称性就被真空破坏了。

重新定义场
$
  eta = phi_1 - mu/lambda, xi = phi_2
$
Lagrange量为
$
  cal(L) = & (1/2 (partial_mu eta) (partial^mu eta) - mu^2 eta^2) + (1/2 (partial_mu xi) (partial^mu xi)) \
           & + (mu lambda(eta^3 + eta xi^2) - lambda^2/4 (eta^4 + 2 eta^2 xi^2 + xi^4)) + mu^4/(4 lambda^2)
$
这里有两个方向：$eta$是沿着径向方向的涨落，也就是从圆环向外或向内动；$xi$是沿着圆环切向方向的涨落，也就是在一圈真空之间滑动。两者物理性质不同。径向方向上，势能会升高，所以$eta$对应有质量粒子。切向方向上，沿着圆环移动仍然在势能最低处，所以没有恢复力，因此$xi$是无质量粒子。

$eta$获得了质量，$xi$仍无质量，这就是Goldstone模式。一般来说：连续整体对称性自发破缺⇒出现无质量 Goldstone 玻色子。在这个例子里，$xi$就是Goldstone场。

== Higgs机制

Higgs机制结合了：
- *定域规范不变性*，要求引入规范场
  $
    partial_mu -> cal(D)_mu = partial_mu + i q/(hbar c) A_mu
  $
  从而自然产生相互作用。
- *对称性自发破缺*，会让场在非零真空附近展开，并产生质量项。
Higgs 机制就是把这两者结合起来。结果是：规范粒子可以在不显式破坏规范不变性的前提下获得质量；这正是弱相互作用中$W^(plus.minus),Z^0$获得质量的机制。

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
