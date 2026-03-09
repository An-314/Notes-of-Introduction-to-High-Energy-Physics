#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

#let dashed = (paint: black, thickness: 0.45pt, dash: "dashed")
#let solid = 1.0pt + black

#let flavor_node(x, y, label, r) = {
  draw.circle(
    (x, y),
    radius: r,
    stroke: 0.6pt + black,
    fill: white,
  )
  draw.content((x, y), label)
}

// 过点 (x0, y0) 且斜率为 m 的虚线，按 y 范围裁剪
#let diag_line_ybounded(x0, y0, m, y_min, y_max) = {
  let x_top = x0 + (y_max - y0) / m
  let x_bot = x0 + (y_min - y0) / m
  draw.line(
    (x_top, y_max),
    (x_bot, y_min),
    stroke: dashed,
  )
}

#let quark_triangle(
  scale: 1cm,
  r: 2.4pt,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let dx = 0.6
    let dy = 1
    let m = -dy / dx

    // 三个点
    let D = (-dx, 0.0)
    let U = (dx, 0.0)
    let S = (0.0, -dy)

    // 水平虚线
    line((-1.2, 0.0), (1.2, 0.0), stroke: dashed)
    line((-1.2, -dy), (0.1, -dy), stroke: dashed)

    // 斜虚线
    diag_line_ybounded(U.at(0), U.at(1), m, -1.1, 0.35)
    diag_line_ybounded(S.at(0), S.at(1), m, -1.1, 0.35)

    // 实线三角形
    line(D, U, stroke: solid)
    line(D, S, stroke: solid)
    line(U, S, stroke: solid)

    // 节点
    flavor_node(D.at(0), D.at(1), [$d$], r)
    flavor_node(U.at(0), U.at(1), [$u$], r)
    flavor_node(S.at(0), S.at(1), [$s$], r)

    // 标注
    content((-2, 0.0), [$s = 0$])
    content((-2, -dy), [$s = -1$])

    content((2.05, -0.95), [$Q = 2/3$])
    content((1.0, -1.0), [$Q = -1/3$])
  })
}

#let antiquark_triangle(
  scale: 1cm,
  r: 2.4pt,
) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let dx = 0.6
    let dy = 1
    let m = -dy / dx

    // 三个点
    let Sbar = (0.0, dy)
    let Ubar = (-dx, 0.0)
    let Dbar = (dx, 0.0)

    // 水平虚线
    line((-1.2, dy), (0.2, dy), stroke: dashed)
    line((-1.2, 0.0), (1.2, 0.0), stroke: dashed)

    // 斜虚线
    diag_line_ybounded(Ubar.at(0), Ubar.at(1), m, -0.4, 1)
    diag_line_ybounded(Dbar.at(0), Dbar.at(1), m, -0.4, 1)

    // 实线三角形
    line(Ubar, Sbar, stroke: solid)
    line(Sbar, Dbar, stroke: solid)
    line(Ubar, Dbar, stroke: solid)

    // 节点
    flavor_node(Sbar.at(0), Sbar.at(1), [$bar(s)$], r)
    flavor_node(Ubar.at(0), Ubar.at(1), [$bar(u)$], r)
    flavor_node(Dbar.at(0), Dbar.at(1), [$bar(d)$], r)

    // 标注
    content((-2, dy), [$s = 1$])
    content((-2, 0.0), [$s = 0$])

    content((-0.4, -0.5), [$Q = -2/3$])
    content((1.5, -0.5), [$Q = 1/3$])
  })
}
#stack(
  dir: ltr,
  spacing: 1cm,
  [
    #quark_triangle(scale: 1.5cm, r: 10pt)
  ],
  [
    #antiquark_triangle(scale: 1.5cm, r: 10pt)
  ],
)
