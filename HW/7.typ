#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第七次作业],
  author: "Anzreww",
  time: "2026年4月",
)

#exercise(subname: [])[
  简述Goldharber实验测量中微子螺旋性的原理和方法。
]

#solution[
  利用角动量守恒 + $gamma$射线偏振得到中微子螺旋性对应关系

  初态核（Eu-152m）无自旋（J=0），发生电子俘获：
  $
    e^- + p -> n + nu
  $
  产生中微子和激发态核（Sm-152m）。由于初态总角动量为0：中微子的自旋方向必须与核反冲自旋配对（角动量守恒）。反冲核随后发射$gamma$射线，其圆偏振方向与核自旋有关。

  #figure(
    image("pic/2026-04-26-15-40-02.png", width: 40%),
    numbering: none,
  )

  测量$gamma$射线的偏振
  - 磁化铁片：只允许某一方向偏振的$gamma$射线通过（类似偏振片），利用磁化材料中电子自旋选择性吸收
  - 反射器（能量选择）：使用共振吸收，只选取特定能量$gamma$
  - 探测器：测量通过偏振器的$gamma$射线强度，分析其偏振状态，从而推断中微子螺旋性

  最终结果表明，中微子是左旋的（螺旋性为-1），反中微子是右旋的（螺旋性为+1）。
]


#exercise(subname: [4.23])[
  对自旋$1$我们有三个态$(m_s = +1, 0, -1)$，我们可以用列矢量分别代表它们
  $
    mat(1; 0; 0), mat(0; 1; 0), mat(0; 0; 1)
  $
  唯一的问题是构造$3 times 3$矩阵$S_x,S_y,S_z$。后者很容易：
  - 构造自旋$1$的$S_z$。为获得$S_+$和$S_-$最容易的是用“升”和“降”算符，$S_plus.minus = S_x plus.minus i S_y$，它具有性质
    $
      S_(plus.minus) ket(s\, m) = hbar sqrt(s(s+1) - m(m plus.minus 1)) ket(s\, m plus.minus 1)
    $
  - 构造自旋$1$的$S_+$和$S_-$矩阵
  - 从$S_+$和$S_-$矩阵构造$S_x$和$S_y$矩阵
  - 对自旋$3/2$完成同样的构造
]

#solution[
  + 考虑到本征态
    $
      hat(S)_z ket(s\, m) = m hbar ket(s\, m)
    $
    其中
    $
      ket(1\, 1) = mat(1; 0; 0), ket(1\, 0) = mat(0; 1; 0), ket(1\, -1) = mat(0; 0; 1)
    $
    就有
    $
      S_z = hbar mat(1, 0, 0; 0, 0, 0; 0, 0, -1)
    $
  + 升降算符满足
    $
      hat(S)_plus.minus ket(s\, m) = hbar sqrt(s(s+1) - m(m plus.minus 1)) ket(s\, m plus.minus 1)
    $
    $
      S_+ ket(1\, 1) = 0, S_+ ket(1\, 0) = hbar sqrt(2) ket(1\, 1), S_+ ket(1\, -1) = hbar sqrt(2) ket(1\, 0)
    $
    $
      S_- ket(1\, 1) = hbar sqrt(2) ket(1\, 0), S_- ket(1\, 0) = hbar sqrt(2) ket(1\, -1), S_- ket(1\, -1) = 0
    $
    得到
    $
      S_+ = hbar mat(0, sqrt(2), 0; 0, 0, sqrt(2); 0, 0, 0), S_- = hbar mat(0, 0, 0; sqrt(2), 0, 0; 0, sqrt(2), 0)
    $
  + 于是可以得到
    $
      S_x = (S_+ + S_-)/2 = hbar mat(0, sqrt(2)/2, 0; sqrt(2)/2, 0, sqrt(2)/2; 0, sqrt(2)/2, 0)
    $
    $
      S_y = (S_+ - S_-)/(2i) = hbar mat(0, -sqrt(2)i/2, 0; sqrt(2)i/2, 0, -sqrt(2)i/2; 0, sqrt(2)i/2, 0)
    $
  + 同理地，对于自旋为$3/2$的情况
    $
      ket(3/2\, 3/2) = mat(1; 0; 0; 0), ket(3/2\, 1/2) = mat(0; 1; 0; 0), ket(3/2\, -1/2) = mat(0; 0; 1; 0), ket(3/2\, -3/2) = mat(0; 0; 0; 1)
    $
    $
      S_z = hbar mat(3/2, 0, 0, 0; 0, 1/2, 0, 0; 0, 0, -1/2, 0; 0, 0, 0, -3/2)
    $
    $
      S_+ = hbar mat(0, sqrt(3), 0, 0; 0, 0, 2, 0; 0, 0, 0, sqrt(3); 0, 0, 0, 0), S_- = hbar mat(0, 0, 0, 0; sqrt(3), 0, 0, 0; 0, 2, 0, 0; 0, 0, sqrt(3), 0)
    $
    $
      S_x = (S_+ + S_-)/2 = hbar mat(0, sqrt(3)/2, 0, 0; sqrt(3)/2, 0, 1, 0; 0, 1, 0, sqrt(3)/2; 0, 0, sqrt(3)/2, 0)\
      S_y = (S_+ - S_-)/(2i) = hbar mat(0, -sqrt(3)/2i, 0, 0; sqrt(3)/2i, 0, -i, 0; 0, i, 0, -sqrt(3)/2i; 0, 0, sqrt(3)/2i, 0)
    $
]

#exercise(subname: [4.28])[
  让我们考虑$pi$核散射，$pi N -> pi N$。有六个弹性过程：
  #set enum(numbering: "(a)")
  + $pi^+ + p -> pi^+ + p$
  + $pi^0 + p -> pi^0 + p$
  + $pi^- + p -> pi^- + p$
  + $pi^+ + n -> pi^+ + n$
  + $pi^0 + n -> pi^0 + n$
  + $pi^- + n -> pi^- + n$
  四个电荷交换过程：
  #set enum(start: 7)
  + $pi^+ + n -> pi^0 + p$
  + $pi^0 + p -> pi^+ + n$
  + $pi^0 + n -> pi^- + p$
  + $pi^- + p -> pi^0 + n$
  由于$pi$携带$I=1$，而核子携$I = 1/2$，总同位旋可以是$3/2$或$1/2$。因此这里只有两个可区分的振幅：对$I=3/2$地$cal(M)_3$和对$I=1/2$的$cal(M)_1$。从 Clebsch-Gordan 表我们找到如下分解：
  $
    pi^+ + p: & ket(1\, 1) ket(1/2\, 1/2) = ket(3/2\, 3/2) \
    pi^0 + p: & ket(1\, 0) ket(1/2\, 1/2) = sqrt(2/3) ket(3/2\, 1/2) - sqrt(1/3) ket(1/2\, 1/2) \
    pi^- + p: & ket(1\, -1) ket(1/2\, 1/2) = sqrt(1/3) ket(3/2\, -1/2) - sqrt(2/3) ket(1/2\, -1/2) \
    pi^+ + n: & ket(1\, 1) ket(1/2\, -1/2) = sqrt(1/3) ket(3/2\, 1/2) + sqrt(2/3) ket(1/2\, 1/2) \
    pi^0 + n: & ket(1\, 0) ket(1/2\, -1/2) = sqrt(2/3) ket(3/2\, -1/2) + sqrt(1/3) ket(1/2\, -1/2) \
    pi^- + n: & ket(1\, -1) ket(1/2\, -1/2) = ket(3/2\, -3/2)
  $
  反应(a)和(f)是纯$I= 3/2$的：
  $
    cal(M)_a = cal(M)_f = cal(M)_3
  $<eq1>
  其他都是混合的；例如，
  $
    cal(M)_c = 1/3 cal(M)_3 + 2/3 cal(M)_1\
    cal(M)_j = sqrt(2)/3 cal(M)_3 - sqrt(2)/3 cal(M)_1
  $<eq2>
  而截面由如下比率代表
  $
    sigma_a : sigma_c: sigma_j = 9 abs(cal(M)_3)^2 : abs(cal(M)_3 + 2 cal(M)_1)^2 : 2 abs(cal(M)_3 - cal(M)_1)^2
  $<eq3>
  在一个质心能量1232MeV处，1951年首先由Fermi等人在$pi$-核散射看到了一个著名戏剧性的鼓包；这里$pi$和核结合形成了一个短寿命的“共振 态——$Delta$。我们知道$Delta$携带$I = 3/2$，因此我们期待在此能量$cal(M)_3 >> cal(M)_1$，就有
  $
    sigma_a : sigma_c: sigma_j = 9 : 1 : 2
  $<eq4>


  - 对方程 @eq1 和方程 @eq2，计算出所有$pi N$散射振幅，用$cal(M)_1$和$cal(M)_2$表达$cal(M)_a$和$cal(M)_f$
  - 推广方程 @eq3 包括进所有10个截面
  - 用同样的方式，推广方程 @eq4
]

#solution[
  - 方程 @eq1 和方程 @eq2 给出
    $
      cal(M)_a = cal(M)_f = cal(M)_3\
    $
    $
      cal(M)_b = cal(M)_e = 2/3 cal(M)_3 + 1/3 cal(M)_1\
    $
    $
      cal(M)_c = cal(M)_d = 1/3 cal(M)_3 + 2/3 cal(M)_1\
    $
    $
      cal(M)_g = cal(M)_h = cal(M)_i = cal(M)_j = sqrt(2)/3 cal(M)_3 - sqrt(2)/3 cal(M)_1
    $
  - 方程 @eq3 推广为
    $
      &sigma_a : sigma_b : sigma_c : sigma_d : sigma_e : sigma_f : sigma_g : sigma_h : sigma_i : sigma_j\
      = &9 abs(cal(M)_3)^2 : abs(2 cal(M)_3 + cal(M)_1)^2 : abs(cal(M)_3 + 2 cal(M)_1)^2 : abs(cal(M)_3 + 2 cal(M)_1)^2 : abs(2 cal(M)_3 + cal(M)_1)^2 : 9 abs(cal(M)_3)^2 : \
      &2 abs(cal(M)_3 - cal(M)_1)^2 : 2 abs(cal(M)_3 - cal(M)_1)^2 : 2 abs(cal(M)_3 - cal(M)_1)^2 : 2 abs(cal(M)_3 - cal(M)_1)^2
    $
  - 方程 @eq4 推广为
    $
        & sigma_a : sigma_b : sigma_c : sigma_d : sigma_e : sigma_f : sigma_g : sigma_h : sigma_i : sigma_j \
      = & 9 : 4: 1 : 1 : 4 : 9 : 2 : 2 : 2 : 2
    $
]

#exercise(subname: [4.32])[
  $Sigma^(*0)$可以衰变到$Sigma^+ + pi^-$，$Sigma^0 + pi^0$或$Sigma^- + pi^+$（还有$Lambda^0+pi^0$，但我们这里不涉及它）。假定你观察到$100$个这样的衰变，每种衰变你会看到几个？
]

#solution[
  $
    Sigma^(*0): ket(1\, 0)
  $
  $
    Sigma^+ + pi^- & : ket(1\, 1) ket(1\, -1) = sqrt(1/6) ket(2\, 0) + sqrt(1/2) ket(1\, 0) + sqrt(1/3) ket(0\, 0) \
    Sigma^0 + pi^0 & : ket(1\, 0) ket(1\, 0) = sqrt(2/3) ket(2\, 0) - sqrt(1/3) ket(0\, 0) \
    Sigma^- + pi^+ & : ket(1\, -1) ket(1\,1) = sqrt(1/6) ket(2\, 0) - sqrt(1/2) ket(1\, 0) + sqrt(1/3) ket(0\, 0)
  $
  从而
  $
    cal(M)_a & = sqrt(1/2) cal(M)_1 \
    cal(M)_b & = 0 \
    cal(M)_c & = - sqrt(1/2) cal(M)_1
  $
  因此
  $
    sigma_a : sigma_b : sigma_c = 1 : 0 : 1
  $
  会看到大约$50$个$Sigma^+ + pi^-$衰变，$0$个$Sigma^0 + pi^0$衰变和$50$个$Sigma^- + pi^+$衰变。
]

#exercise(subname: [4.38])[
  两个强子相互转化$A<==>B$，它们必须具有同样的质量(在实际中这意味它们必须互为反粒子)，同样的电荷和同样的重子数。在标准模型中，以通常的三代，证明$A$和$B$应必须是中性介子，并鉴别它们可能的夸克内容。那么候选的介子是哪些？为什么中子不和反中子混合，就像$K^0$和$macron(K)^0$混合产生$K_1$和$K_2$那样？为什么我们没看到中性奇异矢量介子$K^(0*)$和$macron(K)^(0*)$的混合？
]

#solution[
  要发生$A<->B$混合，二者必须有相同的守恒量。若$B$是$A$的反粒子，则要求：
  $
    M_A = M_B, Q_A = Q_B, B_A = B_B
  $
  而正反粒子有
  $
    B_A = -B_B, Q_A = -Q_B
  $
  从而
  $
    B_A = 0, Q_A = 0
  $
  从而$A$是中性介子。

  考虑通常三代夸克：$u,c,t;d,s,b$，一个非自共轭中性介子应为
  $
    q_i macron(q)_j, i != j
  $
  并且要求两个夸克电荷相同。对于下型夸克$d,s,b, Q=-1/3$可有
  $
    d macron(s) <-> s macron(d), d macron(b) <-> b macron(d), s macron(b) <-> b macron(s)\
    K^0 <-> macron(K)^0, B^0 <-> macron(B)^0, B_s^0 <-> macron(B)_s^0
  $
  对于上型夸克$u,c,t, Q=2/3$可有
  $
    u macron(c) <-> c macron(u)\
    D^0 <-> macron(D)^0
  $
  含顶夸克的介子不作为候选，因为顶夸克寿命太短，来不及形成强子束缚态。所以候选中性介子是：
  $
    K^0, B^0, B_s^0, D^0
  $
  及其反粒子。

  中子是重子
  $
    B(n) = 1
  $
  而反中子是反重子
  $
    B(macron(n)) = -1
  $
  如果发生$n <-> macron(n)$混合，则改变了重子数。

  中性奇异矢量介子$K^(0*)$主要通过强相互作用衰变：
  $
    K^(0*) -> K + pi
  $
  强衰变寿命极短，看不到混合。
]
