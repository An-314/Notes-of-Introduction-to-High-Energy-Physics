#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第三次作业],
  author: "Anzreww",
  time: "2026年3月",
)

#exercise(subname: [2.1])[
  计算两个静止电子之间的吸引力对电排斥力的比值。(我需要告诉你它俩应离开多远吗?)
]

#solution[
  吸引力遵循Newton定律
  $
    F_g = (G m_e^2) / r^2
  $
  电排斥力遵循Coulomb定律
  $
    F_e = e^2/(4 pi epsilon_0 r^2) e^2 / r^2
  $
  因此它们的比值是
  $
    F_g / F_e = (4 pi epsilon_0 G m_e^2) / e^2 approx 2.4 times 10^(-43)
  $
]

#exercise(subname: [2.2])[
  画出Delbrunk散射的最低阶Feynman图
  $
    gamma + gamma -> gamma + gamma
  $
  (这个光光散射的过程没有其经典电动力学的类似物)
]

#solution[
  由于每个顶角必须是$gamma e e$，因此最低阶的Feynman图至少要有四个顶角。以下是其中一个可能的图：
  #figure(
    feynman(
      // orientation: "horizontal",
      // layout: "layered",
      length: 0.3cm,
      (
        vertex("i1"),
        vertex("i2"),
        vertex("a", shape: "dot"),
        vertex("b", shape: "dot"),
        vertex("c", shape: "dot"),
        vertex("d", shape: "dot"),
        vertex("f1"),
        vertex("f2"),
        edge("i1", "a", type: "photon"),
        edge("i2", "b", type: "photon"),
        edge("a", "b", type: "fermion"),
        edge("b", "c", type: "fermion"),
        edge("c", "d", type: "fermion"),
        edge("d", "a", type: "fermion"),
        edge("d", "f1", type: "photon"),
        edge("c", "f2", type: "photon"),
      ),
    ),
    numbering: none,
  )
]

#exercise(subname: [2.3])[
  画出所有四阶(四个顶角)的Compton散射的Feynman图。(有17个，不连接图不算)
]

#solution[
  Compton散射的过程是
  $
    gamma + e^- -> gamma + e^-
  $
  二阶的Feynman图有两个，四阶的Feynman图可以由二阶的图通过添加两个顶角来构造。

  我们可以在每个Fermion边添加顶点，并用Photon连接这两个顶点；也可以在Photon加Fermion的Loop。

  对于
  #feynman(
    orientation: "horizontal",
    length: 0.3cm,
    (
      vertex("g_in"),
      vertex("em_in"),
      vertex("v1", shape: "dot"),
      vertex("v2", shape: "dot"),
      vertex("g_out"),
      vertex("em_out"),
      edge("em_in", "v1", type: "fermion"),
      edge("v1", "v2", type: "fermion"),
      edge("v2", "em_out", type: "fermion"),
      edge("g_in", "v1", type: "photon"),
      edge("v2", "g_out", type: "photon"),
    ),
  )
  可以变为
  #grid(columns: (1fr, 1fr))[
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("a1"),
        vertex("a2"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "a1", type: "photon"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "fermion")),
        ),
        edge("a2", "v1", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v2", "em_out", type: "fermion"),
        edge("v2", "g_out", type: "photon"),
      ),
    )
  ][
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v1", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v2", "a1", type: "photon"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "fermion")),
        ),
        edge("v2", "em_out", type: "fermion"),
        edge("a2", "g_out", type: "photon"),
      ),
    )
  ][
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "a1", type: "fermion"),
        edge("a1", "v1", type: "fermion"),
        edge("g_in", "v1", type: "photon"),
        edge("v1", "a2", type: "fermion"),
        edge("a2", "v2", type: "fermion"),
        edge("a1", "a2", type: "photon"),
        edge("v2", "em_out", type: "fermion"),
        edge("v2", "g_out", type: "photon"),
      ),
    )
  ][
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "a1", type: "fermion"),
        edge("a1", "v1", type: "fermion"),
        edge("g_in", "v1", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v2", "a2", type: "fermion"),
        edge("a2", "em_out", type: "fermion"),
        edge("a1", "a2", type: "photon"),
        edge("v2", "g_out", type: "photon"),
      ),
    )
  ][
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v1", type: "photon"),
        edge("v1", "a1", type: "fermion"),
        edge("a1", "v2", type: "fermion"),
        edge("v2", "a2", type: "fermion"),
        edge("a2", "em_out", type: "fermion"),
        edge("v2", "g_out", type: "photon"),
        edge("a1", "a2", type: "photon"),
      ),
    )
  ][
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "a1", type: "fermion"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "photon")),
        ),
        edge("a2", "v1", type: "fermion"),
        edge("g_in", "v1", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v2", "em_out", type: "fermion"),
        edge("v2", "g_out", type: "photon"),
      ),
    )
  ][
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v1", type: "photon"),
        edge("v1", "a1", type: "fermion"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "photon")),
        ),
        edge("a2", "v2", type: "fermion"),
        edge("v2", "em_out", type: "fermion"),
        edge("v2", "g_out", type: "photon"),
      ),
    )
  ][
    #feynman(
      orientation: "horizontal",
      length: 0.3cm,
      (
        vertex("g_in"),
        vertex("em_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v1", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v2", "a1", type: "fermion"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "photon")),
        ),
        edge("a2", "em_out", type: "fermion"),
        edge("v2", "g_out", type: "photon"),
      ),
    )
  ]
  #newpara()
  对于
  #feynman(
    orientation: "vertical",
    length: 0.3cm,
    (
      vertex("em_in"),
      vertex("g_in"),
      vertex("v1", shape: "dot"),
      vertex("v2", shape: "dot"),
      vertex("g_out"),
      vertex("em_out"),
      edge("em_in", "v1", type: "fermion"),
      edge("v1", "v2", type: "fermion"),
      edge("v2", "em_out", type: "fermion"),
      edge("g_in", "v2", type: "photon"),
      edge("v1", "g_out", type: "photon"),
    ),
  )
  可以变为
  #grid(columns: (1fr, 1fr), row-gutter: 10pt)[
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("a1"),
        vertex("a2"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "a1", type: "photon"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "fermion")),
        ),
        edge("a2", "v2", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v1", "g_out", type: "photon"),
        edge("v2", "em_out", type: "fermion"),
      ),
    )
  ][
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("g_out"),
        vertex("em_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v2", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v1", "a1", type: "photon"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "fermion")),
        ),
        edge("a2", "g_out", type: "photon"),
        edge("v2", "em_out", type: "fermion"),
      ),
    )
  ][
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("em_out"),
        vertex("g_out"),
        edge("em_in", "a1", type: "fermion"),
        edge("a1", "v1", type: "fermion"),
        edge("g_in", "v2", type: "photon"),
        edge("v1", "a2", type: "fermion"),
        edge("a2", "v2", type: "fermion"),
        edge("a1", "a2", type: "photon"),
        edge("v1", "g_out", type: "photon"),
        edge("v2", "em_out", type: "fermion"),
      ),
    )
  ][
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("em_out"),
        vertex("g_out"),
        edge("em_in", "a1", type: "fermion"),
        edge("a1", "v1", type: "fermion"),
        edge("g_in", "v2", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v1", "g_out", type: "photon"),
        edge("v2", "a2", type: "fermion"),
        edge("a1", "a2", type: "photon"),
        edge("a2", "em_out", type: "fermion"),
      ),
    )
  ][
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("em_out"),
        vertex("g_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v2", type: "photon"),
        edge("v1", "a1", type: "fermion"),
        edge("a1", "v2", type: "fermion"),
        edge("v1", "g_out", type: "photon"),
        edge("v2", "a2", type: "fermion"),
        edge("a1", "a2", type: "photon"),
        edge("a2", "em_out", type: "fermion"),
      ),
    )
  ][
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("g_out"),
        vertex("a1"),
        vertex("a2"),
        vertex("em_out"),
        edge("em_in", "a1", type: "fermion"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "photon")),
        ),
        edge("a2", "v1", type: "photon"),
        edge("g_in", "v2", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v1", "g_out", type: "photon"),
        edge("v2", "em_out", type: "fermion"),
      ),
    )
  ][
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("a1"),
        vertex("a2"),
        vertex("em_out"),
        vertex("g_out"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v2", type: "photon"),
        edge("v1", "a1", type: "fermion"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "photon")),
        ),
        edge("a2", "v2", type: "fermion"),
        edge("v1", "g_out", type: "photon"),
        edge("v2", "em_out", type: "fermion"),
      ),
    )
  ][
    #feynman(
      orientation: "vertical",
      length: 0.3cm,
      (
        vertex("em_in"),
        vertex("g_in"),
        vertex("v1", shape: "dot"),
        vertex("v2", shape: "dot"),
        vertex("em_out"),
        vertex("a1"),
        vertex("g_out"),
        vertex("a2"),
        edge("em_in", "v1", type: "fermion"),
        edge("g_in", "v2", type: "photon"),
        edge("v1", "v2", type: "fermion"),
        edge("v2", "a1", type: "fermion"),
        edge("v1", "g_out", type: "photon"),
        edge("a2", "em_out", type: "fermion"),
        loop(
          (vertex("a1"), (type: "fermion")),
          (vertex("a2"), (type: "photon")),
        ),
      ),
    )
  ]
  #newpara()
  除此之外还有一幅Photon的出入在同一侧的图
  #feynman(
    orientation: "vertical",
    length: 0.3cm,
    (
      vertex("em_in"),
      vertex("g_in"),
      vertex("a1"),
      vertex("a2"),
      vertex("v1", shape: "dot"),
      vertex("v2", shape: "dot"),
      vertex("em_out"),
      vertex("g_out"),
      edge("g_in", "a1", type: "photon"),
      edge("a1", "v1", type: "fermion"),
      edge("v1", "a2", type: "fermion"),
      edge("a2", "a1", type: "fermion"),
      edge("a2", "g_out", type: "photon"),
      edge("v1", "v2", type: "fermion"),
      edge("em_in", "v2", type: "fermion"),
      edge("v2", "em_out", type: "fermion"),
    ),
  )
  这样一共有17幅图。
]

#exercise(subname: [2.4])[
  画确定Bhabha散射的每一个最低阶图中的虚光子质量 (假设电子和正电子静止)，它的速度是多少?(注意这些回答对实光子是不可能的)
]

#solution[
  #stack(dir: ltr)[
    #feynman(
      orientation: "vertical",
      length: 0.5cm,
      (
        vertex("ep_in", label: $e^+$),
        vertex("ep_out", label: $e^-$),
        vertex("v1", shape: "dot", label: $alpha$),
        vertex("v2", shape: "dot", label: $alpha$),
        vertex("em_in", label: $e^+$),
        vertex("em_out", label: $e^-$),
        edge("ep_in", "v1", type: "antifermion"),
        edge("em_in", "v1", type: "fermion"),
        edge("v1", "v2", type: "photon", label: $gamma$),
        edge("v2", "ep_out", type: "antifermion"),
        edge("v2", "em_out", type: "fermion"),
      ),
    )][
    #feynman(orientation: "horizontal", length: 0.5cm, (
      vertex("ep_in", label: $e^+$),
      vertex("em_in", label: $e^-$),
      vertex("v1", shape: "dot", label: $alpha$),
      vertex("v2", shape: "dot", label: $alpha$),
      vertex("em_out", label: $e^-$),
      vertex("ep_out", label: $e^+$),
      edge("em_in", "v1", type: "fermion"),
      edge("ep_in", "v1", type: "antifermion"),
      edge("v2", "em_out", type: "fermion"),
      edge("v2", "ep_out", type: "antifermion"),
      edge("v1", "v2", type: "photon", label: $gamma$),
    ))
  ]
  每个顶点的能量和动量守恒。取参考系使得初态的电子和正电子都静止。
  $
    E = 2 m_e, p = 0
  $
  - 对于第一张图，初末态的电子、正电子都没有动能，也没有方向变化；于是对交换光子来说，它在每个顶点上传递的能量和动量都为0
    $
      E = 0, p = 0
    $
    从而虚光子的质量与速度为
    $
      m_(gamma^*) = 0, v_(gamma^*) = 1
    $
  - 对于第二张图，虚光子连接了入态的电子和出态的电子
    $
      e^+ + e^- -> gamma^* -> e^+ + e^-
    $
    在左顶点，电子和正电子湮灭成中间虚光子，所以由能量动量守恒
    $
      E = 2 m_e, p = 0
    $
    从而虚光子的质量与速度为
    $
      m_(gamma^*) = 2 m_e, v_(gamma^*) = 0
    $
]

#exercise(subname: [验算附录C中的公式(C.2)至(C.7)])[
  Pauli矩阵是
  $
    sigma_x = mat(0, 1; 1, 0), sigma_y = mat(0, -i; i, 0), sigma_z = mat(1, 0; 0, -1)
  $
  有乘积规则
  $
    sigma_i sigma_j = delta_(i j) + i epsilon_(i j k) sigma_k
  $
  因此，特别地
  $
    sigma_i^2 = 1
  $
  $
    sigma_x sigma_y = i sigma_z, sigma_y sigma_z = i sigma_x, sigma_z sigma_x = i sigma_y
  $
  $
    [sigma_i, sigma_j] = 2 i epsilon_(i j k) sigma_k
  $
  $
    {sigma_i, sigma_j} = 2 delta_(i j)
  $
  而对任意两个矢量$vb(a)$和$vb(b)$
  $
    (vb(a) dot vb(sigma)) (vb(b) dot vb(sigma)) = vb(a) dot vb(b) + i vb(sigma) dot (vb(a) times vb(b))
  $
]

#proof[
  首先验证乘积规则
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    inset: 10pt,
  )[$times$][$sigma_x = mat(0, 1; 1, 0)$][$sigma_y = mat(0, -i; i, 0)$][$sigma_z = mat(1, 0; 0, -1)$][
    $sigma_x = mat(0, 1; 1, 0)$][$mat(0, 1; 1, 0) = 1 + 0$][$mat(0, -i; i, 0) = i sigma_z$][$mat(1, 0; 0, -1) = i sigma_y$][
    $sigma_y = mat(0, -i; i, 0)$][$mat(0, -i; i, 0) = i sigma_z$][$mat(0, 0; 0, 0) = 1 + 0$][$mat(0, -i; i, 0) = i sigma_x$][
    $sigma_z = mat(1, 0; 0, -1)$][$mat(1, 0; 0, -1) = i sigma_y$][$mat(0, -i; i, 0) = i sigma_x$][$mat(1, 0; 0, -1) = 1 + 0$]
  这也就是
  $
    sigma_i sigma_j = delta_(i j) + i epsilon_(i j k) sigma_k
  $
  乘积规则得以验证。

  特别地，取$i = j$，有
  $
    sigma_i^2 = 1 + 0 = 1
  $
  #newpara()
  以及$i!=j$
  $
    sigma_x sigma_y = i sigma_z, sigma_y sigma_z = i sigma_x, sigma_z sigma_x = i sigma_y
  $
  这就得到对易关系
  $
    [sigma_i, sigma_j] = sigma_i sigma_j - sigma_j sigma_i = delta_(i j) + i epsilon_(i j k) sigma_k - (delta_(j i) + i epsilon_(j i k) sigma_k) = 2 i epsilon_(i j k) sigma_k
  $
  和反对易关系
  $
    {sigma_i, sigma_j} = sigma_i sigma_j + sigma_j sigma_i = 2 delta_(i j) + i epsilon_(i j k) sigma_k + i epsilon_(j i k) sigma_k = 2 delta_(i j)
  $
  #newpara()
  最后验证
  $
    (vb(a) dot vb(sigma)) (vb(b) dot vb(sigma)) &= a_i b_j sigma_i sigma_j = a_i b_j (delta_(i j) + i epsilon_(i j k) sigma_k) = a_i b_j delta_(i j) + i epsilon_(i j k) a_i b_j sigma_k \
    &= vb(a) dot vb(b) + i vb(sigma) dot (vb(a) times vb(b))
  $
  这里用到了Einstein求和约定。
]
