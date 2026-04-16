#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/inknertia:0.1.0": feynman
#import feynman: *

#show: scripst.with(
  title: [高能物理导论],
  info: [第六次作业],
  author: "Anzreww",
  time: "2026年4月",
)

#exercise(subname: [第3章讲义])[
  *$Lambda$粒子自旋$1/2$*，考察$p$和$pi^-$的角分布
  $
    Lambda -> p + pi^-
  $
  - $Lambda$的自旋是$1/2$，$p$的自旋也是$1/2$，$pi^-$的自旋是$0$
  - 给定$z$轴，$Lambda$的自旋是沿着该轴的$+1/2$；沿着$z$轴，如果$p$向上发射，它必须也是右手的，这个振幅为$a$
  - 给定$z$轴，$Lambda$的自旋是反向沿着该轴的$-1/2$；沿着$z$轴，如果$p$向上发射，它必须也是左手的，这个振幅为$b$
  - 给定$z'$轴，$Lambda$的沿着$z$轴的$1/2$自旋投影到$z'$
    $
      braket(z'\, + 1/2, z\, 1/2) = cos(theta/2), braket(z'\, - 1/2, z\, 1/2) = sin(theta/2)
    $
    在$theta$方向的概率为两个振幅的概率和：
    $
      P(theta) = abs(a)^2 cos^2(theta/2) + abs(b)^2 sin^2(theta/2) = (a^2 + b^2)/2 + (a^2-b^2)/2 cos theta = beta(1 + alpha cos theta)
    $
    为什么这利用概率相加而非振幅相加？
]

#solution[
  当若干路径对应的是同一个不可区分的末态时，要先把振幅相加；当它们对应的是彼此正交、可区分的末态，或者初态本来就是非相干混合时，要把概率相加。
  - 振幅相加：不同路径通向同一个最终量子态，而且这些路径在实验上不可区分
    $
      P = abs(sum_i A_i)^2
    $
  - 概率相加：不同路径通向不同的最终量子态，或者这些路径在实验上可区分；或者初态不是相干叠加，而是统计混合
    $
      P = sum_i abs(A_i)^2
    $
  这里概率相加是因为两个路径对应的末态是可区分的，$p$的自旋向上和向下是不同的末态。
]

#exercise(subname: [第3章讲义])[
  问题：$Lambda -> p + pi^-$，已知末态$p$在$Λ$质心系中的角分布，$Λ$在实验室系中以一定的速度运动，以该运动方向为$x$轴，求质子在实验室系的角分布。

  质心系角分布$W(theta^*, phi^*)$与实验室系角分布$W(theta, phi)$的关系
  $
             W(theta, phi) dd(Omega) & = W(theta^*, phi^*) dd(Omega^*) \
    W(theta, phi) dd(cos theta, phi) & = W(theta^*, phi^*) dd(cos theta^*, phi^*)
  $
  在两个参考系，选Lorentz变换方向取$phi$角：
  $
    dd(phi) = dd(phi^*)
  $
  则有
  $
    W(theta, phi) = W(theta^*, phi^*) dv(cos theta^*, cos theta)
  $
  其中
  $
    p^*_x & = gamma (p_x - beta E) & ==> & p^* cos theta^* & = gamma (p cos theta - beta E) \
      E^* & = gamma (E - beta p_x) & ==> & E^*             & = gamma (E - beta p cos theta)
  $
  质心系中的$E^*$和$p^*$应该与实验室系速度无关
  $
    dv(E^*, cos theta) = dv(p^*, cos theta) = 0
  $
  都对$cos theta$求微分，
  $
    p^* dv(cos theta^*, cos theta) & = gamma (p + cos theta dv(p, cos theta) - beta p/E dv(p, cos theta)) \
                                 0 & = gamma (p/E dv(p, cos theta) - beta p - beta cos theta dv(p, cos theta)) \
  $
  则有
  $
    dv(cos theta^*, cos theta) = p^2/(gamma p^*(p - beta E cos theta))
  $
  从而
  $
    W(theta, phi) = W(theta^*, phi^*) p^2/(gamma p^*(p - beta E cos theta))
  $
  将$p,E$表示为$p^*, E^*$的函数。
]

#solution[
  先用从质心系到实验室系的Lorentz变换关系
  $
    p_x = gamma (p^*_x + beta E^*), p_y = p^* sin theta^*, E = gamma (E^* + beta p^*_x)
  $
  因此
  $
    p cos theta & = gamma (p^* cos theta^* + beta E^*) \
    p sin theta & = p^* sin theta^* \
  $
  从而
  $
    p = sqrt(p^(*2) sin^2 theta^* + gamma^2 (p^* cos theta^* + beta E^*)^2)
  $
  同时也得到角度关系
  $
    tan theta = (p^* sin theta^*) / (gamma (p^* cos theta^* + beta E^*))
  $
  有
  $
    cos theta = (p^* cos theta^* + beta E^*) / sqrt(p^(*2) sin^2 theta^* + gamma^2 (p^* cos theta^* + beta E^*)^2)
  $
  代入有
  $
    W(theta, phi) = W(theta^*, phi^*) (p^(*2) sin^2 theta^* + gamma^2 (p^* cos theta^* + beta E^*)^2)^(3/2) / (gamma p^* (p^* + beta E^* cos theta^*))
  $
  其中
  $
    tan theta = (p^* sin theta^*) / (gamma (p^* cos theta^* + beta E^*))
  $
]

#exercise(subname: [第4章讲义])[
  $"SU(2)"$的任意群元素可以用pauli矩阵的指数来表示
  $
    e^(- i vb(alpha) dot vb(sigma)) = e^mat(-i/2 alpha_3, -i/2(alpha_1 - i alpha_2); -i/2(alpha_1 + i alpha_2), i/2 alpha_3)
  $
]

#solution[
  $"SU"(2)$的群元可以用Euler角来表征，三个参数
  $
    u(alpha, beta, gamma) = u_3 (alpha) u_2 (beta) u_3 (gamma)
  $
  其中
  $
    u_1 (alpha) = mat(cos alpha/2, -i sin alpha/2; -i sin alpha/2, cos alpha/2), u_2 (beta) = mat(cos beta/2, - sin beta/2; sin beta/2, cos beta/2), u_3 (gamma) = mat(e^(- i gamma/2), 0; 0, e^(i gamma/2))
  $
  对Lie代数$"su"(2)$，生成元是Pauli矩阵
  $
    sigma_1 = mat(0, 1; 1, 0), sigma_2 = mat(0, -i; i, 0), sigma_3 = mat(1, 0; 0, -1)
  $
  从而有
  $
    u_i = e^(- i/2 sigma_i alpha_i)
  $
  这是因为（以$u_1$为例）
  $
    e^(- i/2 sigma_i alpha_i) &= sum_(n=0)^oo (- i/2 sigma_i alpha_i)^n / n! = sum_(n=0)^oo (- i/2 alpha_i)^(2n) / (2n)! + sum_(n=0)^oo (- i/2 alpha_i)^(2n+1) / (2n+1)! sigma_i \
    &= cos(alpha_i/2) - i sin(alpha_i/2) sigma_i\
    &= mat(cos alpha_i/2, -i sin alpha_i/2; -i sin alpha_i/2, cos alpha_i/2)
  $
  #newpara()
  注意到$[sigma_i, sigma_j] = 2i epsilon_(i j k) sigma_k$，不对易，从而一般没有
  $
    e^A e^B = (sum_(n=0)^oo A^n / n!) (sum_(m=0)^oo B^m / m!) =^? sum_(n=0)^oo (A + B)^n / n! = e^(A+B)
  $
  没有
  $
    e^(i/2 alpha_1 sigma_1) e^(i/2 alpha_2 sigma_2) e^(i/2 alpha_3 sigma_3) = e^(i/2 (alpha_1 sigma_1 + alpha_2 sigma_2 + alpha_3 sigma_3))
  $
  但是对于$"SU"(2)$，有$"su"(2)$生成元的线性组合$vb(r) dot vb(sigma)$，满足
  $
    u = e^(- i vb(r) dot vb(sigma))
  $
]

#exercise(subname: [第4章讲义])[
  验证$"SU"(2)$群与$"SO"(3)$群有对应关系
  $
    u_3(alpha) vb(sigma) u^dagger_3 (alpha) = U_z (alpha) vb(sigma)
  $
]

#proof[
  Pauli矩阵为
  $
    sigma_1 = mat(0, 1; 1, 0), sigma_2 = mat(0, -i; i, 0), sigma_3 = mat(1, 0; 0, -1)
  $
  先计算左边
  $
    u_3(alpha) sigma_1 u^dagger_3 (alpha) &= mat(e^(- i alpha/2), 0; 0, e^(i alpha/2)) mat(0, 1; 1, 0) mat(e^(i alpha/2), 0; 0, e^(- i alpha/2)) = mat(0, e^(- i alpha); e^(i alpha), 0) \
    u_3(alpha) sigma_2 u^dagger_3 (alpha) &= mat(e^(- i alpha/2), 0; 0, e^(i alpha/2)) mat(0, -i; i, 0) mat(e^(i alpha/2), 0; 0, e^(- i alpha/2)) = mat(0, -i e^(- i alpha); i e^(i alpha), 0) \
    u_3(alpha) sigma_3 u^dagger_3 (alpha) &= mat(e^(- i alpha/2), 0; 0, e^(i alpha/2)) mat(1, 0; 0, -1) mat(e^(i alpha/2), 0; 0, e^(- i alpha/2)) = mat(1, 0; 0, -1)
  $
  从而
  $
    u_3(alpha) vb(sigma) u^dagger_3 (alpha) = mat(mat(0, e^(- i alpha); e^(i alpha), 0); mat(0, -i e^(- i alpha); i e^(i alpha), 0); mat(1, 0; 0, -1))
  $
  再计算右边
  $
    U_z (alpha) vb(sigma) = mat(cos alpha, -sin alpha, 0; sin alpha, cos alpha, 0; 0, 0, 1) mat(sigma_1; sigma_2; sigma_3) = mat(cos alpha sigma_1 - sin alpha sigma_2; sin alpha sigma_1 + cos alpha sigma_2; sigma_3) = mat(mat(0, e^(- i alpha); e^(i alpha), 0); mat(0, -i e^(- i alpha); i e^(i alpha), 0); mat(1, 0; 0, -1))
  $
  从而验证了$"SU"(2)$群与$"SO"(3)$群有对应关系
  $
    u_3(alpha) vb(sigma) u^dagger_3 (alpha) = U_z (alpha) vb(sigma)
  $
]

#exercise(subname: [4.2])[
  构造三角群$D_3$的 “乘法表”。在第$i$行、第$j$列，放进积$R_i R_j$，这是Abel群吗？
]

#solution[
  #import "@preview/tablex:0.0.9": colspanx, gridx, hlinex, rowspanx, tablex, vlinex
  $D_3 = {e, f, g, a, b, c}$，其中操作为沿着三个轴的旋转和反射，$abs(D_3) = 6$，这是非Abel群。
  #three-line-table[
    | 群元素 | 空间操作 |
    | ------ | -------- |
    | $e$ | 没有操作 |
    | $d$ | 沿着$z$轴旋转$(2pi)/3$ |
    | $f$ | 沿着$z$轴旋转$(4pi)/3$ |
    | $a$ | 沿着$1$轴反射 |
    | $b$ | 沿着$2$轴反射 |
    | $c$ | 沿着$3$轴反射 |
  ]
  乘法运算定义为：连续两次操作。其乘法表是
  #let tab = (
    ([$$], vlinex(), [$e$], [$d$], [$f$], [$a$], [$b$], [$c$]),
    hlinex(),
    ([$e$], [$e$], [$d$], [$f$], [$a$], [$b$], [$c$]),
    ([$d$], [$d$], [$f$], [$e$], [$c$], [$a$], [$b$]),
    ([$f$], [$f$], [$e$], [$d$], [$b$], [$c$], [$a$]),
    ([$a$], [$a$], [$b$], [$c$], [$e$], [$d$], [$f$]),
    ([$b$], [$b$], [$c$], [$a$], [$f$], [$e$], [$d$]),
    ([$c$], [$c$], [$a$], [$b$], [$d$], [$f$], [$e$]),
  )
  #tablex(columns: 7, align: center, auto-vlines: false, auto-hlines: false, ..tab.flatten())
  #figure(
    image("pic/6.1.png", width: 80%),
    numbering: none,
  )
  从乘法表可以看出$D_3$不是Abel群，因为例如$a b = d, b a = f$，$a b != b a$。
]

#exercise(subname: [4.6], lab: "4.6")[
  考虑一个二维矢量$vb(A)$。假设其对Descartes轴$x,y$的分量是$(a_x, a_y)$。当系统逆时针相对$x-y$系统转动角度$theta$，其在$x',y'$的分量$(a'_x, a'_y)$是多少？用$2 times 2$矩阵$R(theta)$表达你的答案：
  $
    mat(a'_x; a'_y) = R(theta) mat(a_x; a_y)
  $
  证明$R(theta)$是正交矩阵。它的行列式是多少？所有这样的转动构成一个群，这个群的名字是什么？通过相乘证明$R(theta_1) R(theta_2) = R(theta_1 + theta_2)$，这是Abel群吗？
]

#solution[
  当系统逆时针相对$x-y$系统转动角度$theta$，其在$x',y'$的分量$(a'_x, a'_y)$为
  $
    mat(a'_x; a'_y) = mat(cos theta, -sin theta; sin theta, cos theta) mat(a_x; a_y)
  $
  证明$R(theta)$是正交矩阵：
  $
    R^TT R = mat(cos theta, sin theta; -sin theta, cos theta) mat(cos theta, -sin theta; sin theta, cos theta) = mat(1, 0; 0, 1)
  $
  $R(theta)$的行列式为
  $
    det(R) = cos^2 theta + sin^2 theta = 1
  $
  所有这样的转动构成一个群，这个群的名字是$"SO"(2)$。
  验证$R(theta_1) R(theta_2) = R(theta_1 + theta_2)$：
  $
    R(theta_1) R(theta_2) & = mat(cos theta_1, -sin theta_1; sin theta_1, cos theta_1) mat(cos theta_2, -sin theta_2; sin theta_2, cos theta_2) \
    & = mat(cos (theta_1 + theta_2), -sin (theta_1 + theta_2); sin (theta_1 + theta_2), cos (theta_1 + theta_2)) \
    & = R(theta_1 + theta_2)
  $
  因此$"SO"(2)$是一个Abel群，因为任意两个元素的乘积满足交换律。
]

#exercise(subname: [4.7])[
  考虑矩阵$mat(1, 0; 0, -1)$，它在$"O"(2)$中吗？，$"SO"(2)$呢？其作用在@4.6 中的矢量$vb(A)$的效果如何？它描写了平面中的一个可能的转动吗？
]

#solution[
  矩阵$mat(1, 0; 0, -1)$在$"O"(2)$中，但不在$"SO"(2)$中，因为它的行列式为-1，而$"SO"(2)$要求行列式为1。

  它作用在@4.6 中的矢量$vb(A)$的效果是将$x$分量保持不变，将$y$分量取反，即
  $
    mat(1, 0; 0, -1) mat(a_x; a_y) = mat(a_x; -a_y)
  $
  它描写了一个反射，而不是一个转动。
]
