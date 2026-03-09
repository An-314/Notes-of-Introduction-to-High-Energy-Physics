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

// 过两点作线，并按给定 y 范围裁剪
#let line_through_points_ybounded(p1, p2, y_min, y_max) = {
  let x1 = p1.at(0)
  let y1 = p1.at(1)
  let x2 = p2.at(0)
  let y2 = p2.at(1)

  let m = (y2 - y1) / (x2 - x1)
  let x_top = x1 + (y_max - y1) / m
  let x_bot = x1 + (y_min - y1) / m

  draw.line(
    (x_top, y_max),
    (x_bot, y_min),
    stroke: dashed,
  )
}

#let baryon_decuplet(
  scale: 1cm,
  outer_r: 2.2pt,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    // 格点参数
    let dx = 0.95
    let dy = 0.83

    // 各层
    let y0 = 0.0
    let y1 = -dy
    let y2 = -2 * dy
    let y3 = -3 * dy

    // 顶层 Δ
    let Dm = (-1.5 * dx, y0)
    let D0 = (-0.5 * dx, y0)
    let Dp = (0.5 * dx, y0)
    let Dpp = (1.5 * dx, y0)

    // 第二层 Σ*
    let Sm = (-1.0 * dx, y1)
    let S0 = (0.0 * dx, y1)
    let Sp = (1.0 * dx, y1)

    // 第三层 Ξ*
    let Xm = (-0.5 * dx, y2)
    let X0 = (0.5 * dx, y2)

    // 底层 Ω
    let Om = (0.0, y3)

    // 水平虚线
    line((-2, y0), (2, y0), stroke: dashed)
    line((-2, y1), (2, y1), stroke: dashed)
    line((-2, y2), (2, y2), stroke: dashed)
    line((-2, y3), (2, y3), stroke: dashed)

    // 三条斜虚线：严格穿过三条粒子链
    let y_top = y0 + 0.45
    let y_bot = y3 - 0.45

    // 左链：Δ- -> Σ*- -> Ξ*- -> Ω-
    line_through_points_ybounded(Dm, Om, y_bot, y_top)

    // 中链：Δ0 -> Σ*0 -> Ξ*0
    line_through_points_ybounded(D0, X0, y_bot, y_top)

    // 右链：Δ+ -> Σ*+
    line_through_points_ybounded(Dp, Sp, y_bot, y_top)

    // 实线骨架
    line(Dm, Sm, stroke: solid)
    line(D0, Sm, stroke: solid)
    line(D0, S0, stroke: solid)
    line(Dp, S0, stroke: solid)
    line(Dp, Sp, stroke: solid)
    line(Dpp, Sp, stroke: solid)

    line(Sm, Xm, stroke: solid)
    line(S0, Xm, stroke: solid)
    line(S0, X0, stroke: solid)
    line(Sp, X0, stroke: solid)

    line(Xm, Om, stroke: solid)
    line(X0, Om, stroke: solid)

    line(Dm, D0, stroke: solid)
    line(D0, Dp, stroke: solid)
    line(Dp, Dpp, stroke: solid)

    line(Sm, S0, stroke: solid)
    line(S0, Sp, stroke: solid)

    line(Xm, X0, stroke: solid)

    // 节点
    baryon_node(Dm.at(0), Dm.at(1), [$Delta^-$], outer_r)
    baryon_node(D0.at(0), D0.at(1), [$Delta^0$], outer_r)
    baryon_node(Dp.at(0), Dp.at(1), [$Delta^+$], outer_r)
    baryon_node(Dpp.at(0), Dpp.at(1), [$Delta^(++)$], outer_r)

    baryon_node(Sm.at(0), Sm.at(1), [$Sigma^(*-)$], outer_r)
    baryon_node(S0.at(0), S0.at(1), [$Sigma^(*0)$], outer_r)
    baryon_node(Sp.at(0), Sp.at(1), [$Sigma^(*+)$], outer_r)

    baryon_node(Xm.at(0), Xm.at(1), [$Xi^(*-)$], outer_r)
    baryon_node(X0.at(0), X0.at(1), [$Xi^(*0)$], outer_r)

    baryon_node(Om.at(0), Om.at(1), [$Omega^(*-)$], outer_r)

    // 左侧奇异数
    content((-2.55, y0), [$0$])
    content((-2.70, y1), [$-1$])
    content((-2.70, y2), [$-2$])
    content((-2.70, y3), [$-3$])

    content((-2.45, y3 - 0.9), [奇异数])
  })
}

// 用法
#baryon_decuplet(scale: 1.5cm, outer_r: 10pt)
