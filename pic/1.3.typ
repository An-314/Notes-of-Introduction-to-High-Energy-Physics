#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

#let dashed = (paint: black, thickness: 0.45pt, dash: "dashed")
#let solid = 1.0pt + black

#let baryon_node(x, y, label, r) = {
  draw.circle(
    (x, y),
    radius: r,
    stroke: 0.6pt + black,
    fill: white,
  )
  draw.content((x, y), label)
}

// 给定直线 y = y0 + m(x - x0)，按上下 y 边界裁剪
#let diag_line_ybounded(x0, y0, m, y_min, y_max) = {
  let x_top = x0 + (y_max - y0) / m
  let x_bot = x0 + (y_min - y0) / m
  draw.line(
    (x_top, y_max),
    (x_bot, y_min),
    stroke: dashed,
  )
}

#let baryon_octet(
  scale: 1cm,
  outer_r: 2.2pt,
  inner_r: 2.2pt,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    // 几何参数：沿用前面介子图的对称风格
    let x1 = 1.46
    let xh = x1 / 2
    let y1 = 1.26
    let m = -y1 / xh

    let y_top = 0.55
    let y_mid = -0.75
    let y_bot = -2.05

    // 八个点
    let N = (-xh, y_top)
    let P = (xh, y_top)

    let O = (0.0, y_mid)
    let Sm = (-x1, y_mid)
    let S0 = (-0.24, y_mid)
    let La = (0.24, y_mid)
    let Sp = (x1, y_mid)

    let Xm = (-xh, y_bot)
    let X0 = (xh, y_bot)

    // 水平虚线：S = 0, -1, -2
    line((-2.2, y_top), (2.2, y_top), stroke: dashed)
    line((-2.2, y_mid), (2.2, y_mid), stroke: dashed)
    line((-2.2, y_bot), (2.2, y_bot), stroke: dashed)

    // 斜虚线：沿用和前面一致的三组平行线
    diag_line_ybounded(-x1, y_mid, m, -3.0, 1.2)
    diag_line_ybounded(0.0, y_mid, m, -3.0, 1.2)
    diag_line_ybounded(x1, y_mid, m, -3.0, 1.2)

    // 菱形实线框架
    line(N, Sm, stroke: solid)
    line(N, O, stroke: solid)
    line(P, O, stroke: solid)
    line(P, Sp, stroke: solid)

    line(Sm, Xm, stroke: solid)
    line(O, Xm, stroke: solid)
    line(O, X0, stroke: solid)
    line(Sp, X0, stroke: solid)

    // 同层连接
    line(N, P, stroke: solid)
    line(Sm, O, stroke: solid)
    line(O, Sp, stroke: solid)
    line(Xm, X0, stroke: solid)

    // 节点
    baryon_node(N.at(0), N.at(1), [$N$], outer_r)
    baryon_node(P.at(0), P.at(1), [$P$], outer_r)

    baryon_node(Sm.at(0), Sm.at(1), [$Sigma^-$], outer_r)
    baryon_node(S0.at(0), S0.at(1), [$Sigma^0$], inner_r)
    baryon_node(La.at(0), La.at(1), [$Lambda$], inner_r)
    baryon_node(Sp.at(0), Sp.at(1), [$Sigma^+$], outer_r)

    baryon_node(Xm.at(0), Xm.at(1), [$Xi^-$], outer_r)
    baryon_node(X0.at(0), X0.at(1), [$Xi^0$], outer_r)

    // 左侧文字：奇异数
    content((-2.45, y_top), [$0$])
    content((-2.55, y_mid), [$-1$])
    content((-2.55, y_bot), [$-2$])
    content((-2.35, -3.0), [奇异数])
  })
}

// 用法
#baryon_octet(scale: 1.5cm, outer_r: 10pt, inner_r: 10pt)
