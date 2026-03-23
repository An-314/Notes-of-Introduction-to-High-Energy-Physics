#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

#let dashed = (paint: black, thickness: 0.45pt, dash: "dashed")
#let solid = 1.0pt + black

#let meson_node(x, y, label, r) = {
  draw.circle(
    (x, y),
    radius: r,
    stroke: 0.6pt + black,
    fill: white,
  )
  draw.content((x, y), label)
}

#let boxed_label(x, y, txt, w: 2.2, h: 0.75) = {
  draw.rect(
    (x - w / 2, y - h / 2),
    (x + w / 2, y + h / 2),
    stroke: 0.8pt + black,
    fill: white,
  )
  draw.content((x, y), txt)
}

// 直线 y = y0 + m(x - x0)，按上下 y 边界裁剪
#let diag_line_ybounded(x0, y0, m, y_min, y_max) = {
  let x_top = x0 + (y_max - y0) / m
  let x_bot = x0 + (y_min - y0) / m
  draw.line(
    (x_top, y_max),
    (x_bot, y_min),
    stroke: dashed,
  )
}

#let pseudoscalar_octet(
  scale: 1cm,
  outer_r: 2.2pt,
  inner_r: 2.0pt,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let x1 = 1.46
    let xh = x1 / 2
    let y1 = 1.26
    let m = -y1 / xh

    let O = (0.0, 0.0)

    let L = (-x1, 0.0)
    let UL = (-xh, y1)
    let UR = (xh, y1)
    let R = (x1, 0.0)
    let LR = (xh, -y1)
    let LL = (-xh, -y1)

    let C1 = (-0.28, 0.18)
    let C2 = (0.00, -0.28)
    let C3 = (0.28, 0.18)

    let y_top = 2.2
    let y_bot = -2.2

    // 三条水平虚线
    line((-2.2, y1), (2.8, y1), stroke: dashed)
    line((-2.2, 0.0), (2.8, 0.0), stroke: dashed)
    line((-2.2, -y1), (2.8, -y1), stroke: dashed)

    // 三条斜虚线
    diag_line_ybounded(-x1, 0.0, m, y_bot, y_top)
    diag_line_ybounded(0.0, 0.0, m, y_bot, y_top)
    diag_line_ybounded(x1, 0.0, m, y_bot, y_top)

    // 六边形边框
    line(L, UL, stroke: solid)
    line(UL, UR, stroke: solid)
    line(UR, R, stroke: solid)
    line(R, LR, stroke: solid)
    line(LR, LL, stroke: solid)
    line(LL, L, stroke: solid)

    // 六个外围节点都与原点相连
    line(O, L, stroke: solid)
    line(O, UL, stroke: solid)
    line(O, UR, stroke: solid)
    line(O, R, stroke: solid)
    line(O, LR, stroke: solid)
    line(O, LL, stroke: solid)

    // 节点
    meson_node(-x1, 0.0, [$pi^-$], outer_r)
    meson_node(-xh, y1, [$K^0$], outer_r)
    meson_node(xh, y1, [$K^+$], outer_r)
    meson_node(x1, 0.0, [$pi^+$], outer_r)
    meson_node(xh, -y1, [$macron(K)^0$], outer_r)
    meson_node(-xh, -y1, [$K^-$], outer_r)

    meson_node(C1.at(0), C1.at(1), [$eta$], inner_r)
    meson_node(C2.at(0), C2.at(1), [$pi^0$], inner_r)
    meson_node(C3.at(0), C3.at(1), [$eta'$], inner_r)

    // 文字
    // 在 ±1/2 处画短刻度
    line((-xh, -0.08), (-xh, 0.08), stroke: 0.6pt + black)
    line((xh, -0.08), (xh, 0.08), stroke: 0.6pt + black)
    // 刻度文字
    content((-xh, -0.22), [$-1/2$])
    content((xh, -0.22), [$+1/2$])
    // 轴标签
    content((1.98, -0.10), [$I_3$])

    content((3.05, y1), [$S = +1$])
    content((3.05, 0.0), [$S = 0$])
    content((3.05, -y1), [$S = -1$])

    content((-1.10, -2.08), [$Q = -1$])
    content((0.10, -2.08), [$Q = 0$])
    content((1.55, -2.08), [$Q = +1$])
  })
}

#let vector_octet(
  scale: 1cm,
  outer_r: 2.2pt,
  inner_r: 2.0pt,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let x1 = 1.46
    let xh = x1 / 2
    let y1 = 1.26
    let m = -y1 / xh

    let O = (0.0, 0.0)

    let L = (-x1, 0.0)
    let UL = (-xh, y1)
    let UR = (xh, y1)
    let R = (x1, 0.0)
    let LR = (xh, -y1)
    let LL = (-xh, -y1)

    let C1 = (-0.28, 0.18)
    let C2 = (0.00, -0.28)
    let C3 = (0.28, 0.18)

    let y_top = 2.2
    let y_bot = -2.2

    // 三条水平虚线
    line((-2.2, y1), (2.8, y1), stroke: dashed)
    line((-2.2, 0.0), (2.8, 0.0), stroke: dashed)
    line((-2.2, -y1), (2.8, -y1), stroke: dashed)

    // 三条斜虚线
    diag_line_ybounded(-x1, 0.0, m, y_bot, y_top)
    diag_line_ybounded(0.0, 0.0, m, y_bot, y_top)
    diag_line_ybounded(x1, 0.0, m, y_bot, y_top)

    // 六边形边框
    line(L, UL, stroke: solid)
    line(UL, UR, stroke: solid)
    line(UR, R, stroke: solid)
    line(R, LR, stroke: solid)
    line(LR, LL, stroke: solid)
    line(LL, L, stroke: solid)

    // 六个外围节点都与原点相连
    line(O, L, stroke: solid)
    line(O, UL, stroke: solid)
    line(O, UR, stroke: solid)
    line(O, R, stroke: solid)
    line(O, LR, stroke: solid)
    line(O, LL, stroke: solid)

    // 中间节点只和原点相连
    line(O, C1, stroke: solid)
    line(O, C2, stroke: solid)
    line(O, C3, stroke: solid)

    // 节点
    meson_node(-x1, 0.0, [$rho^-$], outer_r)
    meson_node(-xh, y1, [$K^(*0)$], outer_r)
    meson_node(xh, y1, [$K^(*+)$], outer_r)
    meson_node(x1, 0.0, [$rho^+$], outer_r)
    meson_node(xh, -y1, [$macron(K)^(*0)$], outer_r)
    meson_node(-xh, -y1, [$K^(*-)$], outer_r)

    meson_node(C1.at(0), C1.at(1), [$phi$], inner_r)
    meson_node(C2.at(0), C2.at(1), [$omega$], inner_r)
    meson_node(C3.at(0), C3.at(1), [$rho^0$], inner_r)

    // 文字
    // 在 ±1/2 处画短刻度
    line((-xh, -0.08), (-xh, 0.08), stroke: 0.6pt + black)
    line((xh, -0.08), (xh, 0.08), stroke: 0.6pt + black)
    // 刻度文字
    content((-xh, -0.22), [$-1/2$])
    content((xh, -0.22), [$+1/2$])
    // 轴标签
    content((1.98, -0.10), [$I_3$])

    content((3.05, y1), [$S = +1$])
    content((3.05, 0.0), [$S = 0$])
    content((3.05, -y1), [$S = -1$])

    content((-1.10, -2.08), [$Q = -1$])
    content((0.10, -2.08), [$Q = 0$])
    content((1.55, -2.08), [$Q = +1$])
  })
}

// 用法
#stack(dir: ltr)[
  #pseudoscalar_octet(scale: 1.3cm, outer_r: 10pt, inner_r: 10pt)][
  #vector_octet(scale: 1.3cm, outer_r: 10pt, inner_r: 10pt)]
