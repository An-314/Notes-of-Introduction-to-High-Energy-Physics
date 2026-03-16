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

= 基本粒子动力学

== 四种力

*粒子物理成为一门独立的学科*
- 粒子之间如何相互作用
  - 为什么原子能稳定存在，为什么核反应会发生，为什么粒子会衰变
  - 这些问题的答案都来自相互作用（interaction）
- 在自然界目前已知的基本相互作用只有四种：
  - 强相互作用（Strong interaction）
    - 例如，核子之间的强核力，夸克之间的强色力
    - 强子是强相互作用的复合粒子，胶子是强相互作用的媒介粒子
  - 电磁相互作用（Electromagnetic interaction）
    - 例如，带电粒子之间的库仑力，光与物质的相互作用
    - 光子是电磁相互作用的媒介粒子，电荷是电磁相互作用的源
  - 弱相互作用（Weak interaction）
    - 例如，$beta$衰变，$W$和$Z$玻色的交换
    - 弱相互作用是唯一能够改变粒子味道（flavor）的相互作用
    - 带电轻子、中性轻子和夸克的衰变都由弱相互作用介导
  - 引力相互作用（Gravitational interaction）
    - 例如，物体之间的万有引力，宇宙的膨胀
  - 这四种力支配了从原子核到宇宙尺度的一切物理过程

*四种相互作用*
#figure(
  three-line-table[
    | 相互作用 | 相对强度  | 理论         | 媒介粒子    |
    | ---- | ----- | ---------- | ------- |
    | 强作用  | 1     | 量子色动力学 QCD | 胶子 $g$    |
    | 电磁作用 | 10⁻²  | 量子电动力学 QED | 光子 $gamma$    |
    | 弱作用  | 10⁻¹⁰ | 电弱理论/味动力学/规范场论 | $W^+$ $W^-$ $Z$ |
    | 引力   | 10⁻³⁹ | 广义相对论      | （假设引力子） |
  ],
  caption: [四种基本相互作用],
)
- 媒介粒子（force carrier）
  - 现代粒子物理认为：力是粒子的交换
  - 例如：两个电子互相排斥，实际上是交换虚光子
- 其中QED、QCD、弱作用构成了标准模型的核心内容，引力则是一个尚未完全理解的领域
#figure(
  three-line-table[
    | \ | < |粒子 | 自旋 | 统计 | 作用 |
    | -- |-- | --- | -- | -- |-- |
    | 光子 | < |$gamma$ | $1$ | boson | 电磁 |
    | 轻子 | < |$e$ $mu$ $tau$ | $1/2$ | fermion | 电磁，弱 |
    | 强子 | 重子 | $p$ $n$ | $1/2$ | fermion | 强 |
    | ^ | 介子 | $pi$ | $1$ | boson | 强 |
  ],
  caption: [不同粒子参与的相互作用],
)

== 量子电动力学QED

QED是描述*带电粒子与电磁场相互作用*的量子场论。它解决的问题是：
- 电子如何与光子相互作用
- 带电粒子如何散射
- 粒子如何产生或湮灭
简单来说：电磁力 = 带电粒子通过交换光子产生的作用。

例如两个电子互相排斥：
$
  e^- -> gamma -> e^-
$
本质是：虚光子的交换。

*电磁相互作用*
- $pi^0$衰变
  $
    pi^0 -> gamma + gamma
  $
- $gamma$衰变
  $
    ch("^137_56 Ba")^* -> ch("^137_56 Ba") + gamma
  $
- 所有涉及光子的过程，自旋和磁场的耦合

*Feynman图*
- Feynman图给出了相互作用的图示
- 根据对应的计算规则，每一张图还对应这一个特定的计算过程和结果

*描述相互作用的方法*
- *电磁相互作用*
  - *外线（external lines）*：表示真实粒子：光子，正电子，负电子（$mu$，夸克等）
    #stack(
      dir: ttb,
      spacing: 0.6cm,
      [
        #feynman(length: 0.5cm, (
          vertex("a"),
          vertex("b"),
          edge("a", "b", type: "fermion"),
        ))
      ],
      [
        #feynman(length: 0.5cm, (
          vertex("a"),
          vertex("b"),
          edge("a", "b", type: "antifermion"),
        ))
      ],
      [
        #feynman(length: 0.5cm, (
          vertex("a"),
          vertex("b"),
          edge("a", "b", type: "photon"),
        ))
      ],
    )
    - 直线带箭头，常用来画电子、夸克等Fermion的传播，箭头方向表示粒子流动的方向
    - 反直线带箭头，常用来画正电子、反夸克等Antifermion的传播，箭头方向表示反粒子流动的方向
    - 波浪线，常用来画光子等Boson的传播，没有箭头，因为它们是自己的反粒子
  - *内线（internal lines）*：表示虚粒子
    - 内线表示虚粒子传播子，不是可直接探测到的自由粒子
    - 光子是自己的反粒子，所以光子内线和外线的波浪线画法一致
    - 对Fermion内线，标准场论图里保留箭头，因为箭头不仅是“运动方向”，还编码了场的收缩方向、Fermion数流等信息
    #stack(
      dir: ttb,
      spacing: 0.6cm,

      [
        #feynman(length: 0.5cm, (
          vertex("a"),
          vertex("b"),
          edge("a", "b", type: "fermion"),
        ))
      ],

      [
        #feynman(length: 0.5cm, (
          vertex("a"),
          vertex("b"),
          edge("a", "b", type: "antifermion"),
        ))
      ],

      [
        #feynman(length: 0.5cm, (
          vertex("a"),
          vertex("b"),
          edge("a", "b", type: "photon"),
        ))
      ],
    )
  - *顶点（vertex）*：相互作用发生的位置
    - 在 QED 中：一个顶点表示电子与光子相互作用
    - 电荷耦合常数$e$，满足电荷守恒
    #figure(
      include "pic/2.1.typ",
      caption: [$e macron(e) gamma$顶点示例],
    )
    - 横向是时间轴，竖向是空间轴
    - 顶点处的粒子满足能量动量守恒，电荷守恒等规律
    - 这个顶角表示 QED 相互作用的基本耦合：$e macron(e) gamma$
      - 电子发射或吸收一个光子
      - 正电子发射或吸收一个光子
      - 电子—正电子湮灭产生光子
      - 光子也可以转化为电子—正电子对（若满足运动学条件）
    - 在Feynman规则里，这个顶角对应的耦合常数是$- i e gamma^mu$，其中$e$是电荷，$gamma^mu$是Dirac矩阵，编码了自旋结构；$alpha$是强调电磁相互作用强度，通常$alpha = e^2 / (4 pi)$是精细结构常数，约等于$1/137$
- *散射过程*
  - Møller scattering
    $
      e^- e^- -> e^- e^-
    $
    #figure(
      include "pic/2.2.typ",
      caption: [Møller scattering的Feynman图示例],
    )
    - 电子—电子散射
    - 两条电子线之间交换一个虚光子，因此属于*电磁散射*
    - t-道交换图，每个顶点都是一个QED顶角，所以振幅里会出现两个电磁耦合
  - Annihilation
    $
      e^+ e^- -> gamma + gamma
    $
    #figure(
      include "pic/2.3.typ",
      caption: [Annihilation的Feynman图示例],
    )
    - 电子—正电子湮灭成两个光子
    - 初态的$e^+ e^-$消失，末态变成两个光子
    - 中间那条Fermion内线是虚电子传播子
  - Pair Production
    $
      gamma + gamma -> e^+ e^-
    $
    #figure(
      include "pic/2.4.typ",
      caption: [Pair Production的Feynman图示例],
    )
  - Bhabha scattering
    $
      e^+ e^- -> e^+ e^-
    $
    #figure(
      include "pic/2.5.typ",
      caption: [Bhabha scattering的Feynman图示例],
    )
    - 这个过程在树级有两张典型图：
      - *湮灭道*（s-channel）：先$e^+ e^-$湮灭成虚光子，再变回$e^+ e^-$
        $
          e^+ e^- -> gamma^* -> e^+ e^-
        $
      - *交换道*（t-channel）：电子和正电子之间交换一个虚光子而散射
    - 同样的初末态，但中间过程不一样
    - 正负电子对撞机上的主要过程
  - Compton scattering
    $
      e^- gamma -> e^- gamma
    $
    #figure(
      include "pic/2.6.typ",
      caption: [Compton scattering的Feynman图示例],
    )
    - s-道图
      - 电子先吸收一个光子变成虚电子，再发射一个光子变回电子
    - u-道图
      - 电子和光子交换一个虚电子
    - 轫致辐射，同步辐射等
  - 给定同样的初末态，量子场论中往往不止一张Feynman图贡献

    Bhabha散射既可以理解为电子—正电子先湮灭再产生，也可以理解为它们交换虚光子而散射；Compton散射则有两张电子传播子图，对应光子耦合顺序的不同。真正的散射振幅不是单独某一张图，而是所有允许树图振幅的和。
- *高阶图*
  - 上面的图都是树图（tree-level diagram），即没有闭合环路的图
  - 还有一些图包含闭合环路，称为高阶图（loop diagram）
    #figure(
      include "pic/2.7.typ",
      caption: [高阶图示例],
    )
  - 高阶图对应着更高阶的微扰展开，通常贡献较小，但在某些情况下可能非常重要，例如：
    - 量子电动力学的精确计算，如电子的磁矩异常
    - 量子色动力学中的强耦合常数的能量依赖性（渐近自由）
  - 高阶图的收敛性
    - 每一个顶角贡献一个$alpha$因子，$alpha=1/137$
    - 四个顶角的图对总的贡献$alpha^4$越来越小，最终收敛，可以用微扰论来计算
    - 一般在高精度的结果要求中采用
- *不被允许的连接*
  - QED的基本顶角只有一种：*两个Fermion和一个光子*
    - 一个电子 + 两个光子接在同一个点 $gamma gamma e$
      - QED 基本相互作用里没有这种三点耦合
      - 电子当然可以和两个光子发生作用，但必须通过两个普通顶角来实现
    - 一个电子 + 一个光子接在一个点 $gamma e$
      - 同样没有这种两点耦合
      - 原因是相互作用顶角必须表示“某个粒子变成别的粒子”或者“几个粒子相互转换”，至少要满足相互作用项的场结构
    - 一个电子 + 三个光子接在同一个点 $gamma gamma gamma e$
      - 同样没有这种四点耦合
      - 这种过程可以通过多个顶角的组合来实现，但不能直接在一个顶点上发生
  - *能动量守恒及运动学许可*
    - $e^- -> e^- gamma$
      - 破坏能量守恒
      - 电子质心系中能量是$m$，无法再衰变到同质量$m$的电子和光子了
    - $e^- e^+ -> gamma$
      - 正负电子质心系中，末态能量不为零，动量为零，不符合光子0质量的性质
      - 也就是*顶角$e macron(e) -> gamma$不能单独存在*
        #feynman(
          layout: "layered",
          length: 0.3cm,
          (
            vertex("e1", label: $e^-$),
            vertex("e2", label: $e^+$),
            vertex("v", shape: "dot", label: $alpha$),
            vertex("g", label: $gamma$),
            edge("e1", "v", type: "fermion"),
            edge("e2", "v", type: "antifermion"),
            edge("v", "g", type: "photon"),
          ),
        )
- *虚粒子*
  - 实粒子：满足能量动量关系$E^2 = p^2 + m^2$，可以被直接探测到
  - *虚粒子*：不满足能量动量关系，存在于内线，无法直接探测，但对散射振幅有贡献
    - 例如：$e^- e^+ -> gamma^* -> e^- e^+$的s-道交换图中，内线的电子是一个虚粒子；$e^- + gamma -> (e^-)^* -> e^- + gamma$的s-道图中，内线的电子也是一个虚粒子
    - $e, gamma$都可以是虚粒子
  - 中间过程的虚粒子，$e, gamma$：不必在质量壳上，不要求$E^2 = p^2 + m^2$，因此可以是任意能量动量的状态，但最终的外线粒子必须是实粒子，满足能量动量关系
  - 虚粒子是量子涨落的产物
- *其他带电粒子的电磁相互作用*
  - 内线外线可以是其他夸克或者其他带电轻子（$mu$，$tau$等）
    #figure(
      include "pic/2.8.typ",
      caption: [其他带电粒子的电磁相互作用示例],
    )
  - 例如：$pi^0 -> gamma gamma$ 实际上是一对夸克$u macron(u)$或$d macron(d)$的湮灭过程
    - 中间的虚粒子只能是$u$或$d$夸克，因为顶角$u macron(e) gamma$不存在，$u$和$e$没有直接的电磁耦合
    #figure(
      include "pic/2.12.typ",
      caption: [$pi^0 -> gamma gamma$的Feynman图示例],
    )

== 量子色动力学QCD

*量子色动力学（QCD）*是描述：夸克与胶子之间强相互作用的量子场论。其基本思想是强作用是夸克之间通过交换胶子产生的作用。

*QCD基本过程*
- *基础顶角*
  - *夸克→夸克+胶子*
    - $q macron(q) g$
      #figure(
        include "pic/2.9.typ",
        caption: [$q macron(q) g$顶点示例],
      )
  - 相互作用顶角是$alpha_s$
  - 夸克间的散射过程通过胶子来完成
    #figure(
      include "pic/2.10.typ",
      caption: [$q macron(q) -> q macron(q)$的Feynman图示例],
    )

*颜色交换*
- QCD的基本顶角结构决定了颜色在相互作用中发生交换，但不改变味道和电荷
- 夸克和胶子都带有色荷（color charge），是强相互作用的源
  - 胶子是色-反色态，夸克是单色态，在相互作用中颜色可以交换，但总的颜色保持不变
- 量子色动力学的顶角结构使得*颜色在相互作用中发生交换，但不改变味道和电荷*
  #figure(
    include "pic/2.11.typ",
    caption: [颜色交换$q(#t-r($r$)) -> q(#t-b($b$)) + g(#t-r($r$)#t-b-inv($macron(b)$))$的Feynman图示例],
  )
  #figure(
    include "pic/2.13.typ",
    caption: [颜色交换$q(#t-b($b$)) -> q(#t-r($r$)) + g(#t-b($b$)#t-r-inv($macron(r)$))$的Feynman图示例],
  )

*胶子胶子自相互作用*
- 除了夸克之间的相互作用，QCD还包含胶子之间的自相互作用，这是QCD与QED的一个重要区别
- 三胶子顶点
  #figure(
    include "pic/2.14.typ",
    caption: [三胶子顶点的Feynman图示例],
  )
- 四胶子顶点
  #figure(
    include "pic/2.15.typ",
    caption: [四胶子顶点的Feynman图示例],
  )
- 光子不带电荷，没有光子的自相互作用
- 但胶子带颜色，所以胶子之间会相互作用

*跑动耦合常数$alpha_s$*
- 耦合常数不是绝对不变的，它会随着探测的距离尺度或能量尺度变化
  - 短距离 ↔ 高能量，长距离 ↔ 低能量
    $
      alpha -> alpha(Q^2)
    $
  - 小距离（小于质子$p$尺寸）：$alpha_s$减小
    - *渐近自由*，Feynman算法有效，微扰论有效
    - 深度非弹实验
  - 大距离：$alpha_s$增加
    - 微扰论无效，Feynman算法不收敛
    - 夸克无法分离，夸克禁闭，强子物理
      - 强子是夸克和胶子的束缚态，无法单独存在的自由夸克
- 电磁相互作用的跑动耦合常数
  - QED也有跑动耦合常数，但变化非常缓慢，$alpha$在大范围能量下几乎保持不变
  - 真空极化与屏蔽效应
    - 但量子场论里，真空并非空，它会不断出现、湮灭一些虚粒子对，比如：$e^- e^+$
    - 虚粒子对由于Coulomb相互作用，虚正电子更容易靠近这个真实电子、虚电子更倾向被排斥到更远处，形成一种*极化云*
    - 因为靠近真实电子的位置，虚正电子偏多，它们会部分抵消真实电子的电场向外的表现，这就是*屏蔽效应*，使得在较大距离上观察到的电荷比真实电荷更小
    - 真空极化图（vacuum polarization loop）
      #figure(
        include "pic/2.16.typ",
        caption: [电磁相互作用的真空极化图示例],
      )
      所以光子的传播不再是简单传播：过程中，会产生虚电子对
      $
        gamma -> e^- e^+ -> gamma
      $
      这是电磁相互作用跑动的来源
  - 这就是介电常数$epsilon$，它描述了电荷在介质中的屏蔽程度，$epsilon$越大，屏蔽越强，观察到的电荷越小
    - 低距离上，$epsilon=1$较小，电荷屏蔽较弱，$alpha$较大
    - 高距离上，$epsilon$增大，电荷屏蔽增强，$alpha$减小
    - 但总体接近精细结构常数$1/137$，变化不大
- QCD的跑动耦合常数
  - QCD 的跑动方向和电磁完全相反
  - 夸克胶子的强相互作用也有真空极化作用
    - 夸克环
      - 类似于QED的真空极化图，但内部是胶子环而非电子环
        $
          g -> q macron(q) -> g
        $
      - 这个效应：类似电磁作用，屏蔽色荷
    - 胶子环
      - 胶子本身带色荷，所以胶子也能极化真空
      - *胶子自相互作用*起到反屏蔽作用，增强色荷
    #figure(
      include "pic/2.17.typ",
      caption: [胶子自相互作用的真空极化图示例——胶子环],
    )

  - 基于6种味道，3种颜色的计算，*QCD的$alpha_s$在短距离减小*
    - *渐进自由*的理论基础
  - 如果两个夸克距离拉大，$alpha_s$增大到微扰论不再适用，于是夸克不能像电子那样轻易分离出去——*夸克禁闭*，因此我们只能观察到由夸克和胶子组成的强子，而不是自由的夸克

*自然界只有无色的介子和重子*
- 无法找到单独的夸克，即*实验上找不到无单独的色荷*
- 只有无色的介子和重子
  #figure(
    include "pic/2.18.typ",
    caption: [质子质子散射，这个图看起来像交换了$pi$介子，前后都是无色的],
  )
- 强子散射中的$pi$交换与产生
  - 在强子的相互作用中，我们经常使用$pi$交换，或者使用$pi$作为媒介粒子考虑问题
  - Yukawa理论
    #figure(
      include "pic/2.19.typ",
      caption: [Yukawa理论示例],
    )
    - 在核子层次上，我们把核力近似理解成：
      $
        N N -> N N
      $
      中间交换一个$pi$介子
  - 考虑胶子交换
    - 质子、 中子不是基本粒子，而是夸克组成的 $p = u u d$，$n = u d d$
    - $pi^+$也不是基本粒子，而是 $pi^+ = u macron(d)$ 组成的
    - 交换$pi^+$从夸克层面看，其实是：
      - 两个强子内部的夸克重新重组
      - 通过强相互作用把一个$u macron(d)$对从一个核子传到另一个核子
      #figure(
        include "pic/2.20.typ",
        caption: [从夸克层面看$pi^+$交换的Feynman图示例],
      )
- *夸克禁闭*
  - 实验上一直拿不到自由夸克，可以用无穷大的相互作用势来解释
  - 当两个夸克分离足够大的时候，如强子的对撞产生，会从*真空中抓取夸克对，形成新的强子对*

== 弱作用


== 衰变与守恒定律


== 统一方案
