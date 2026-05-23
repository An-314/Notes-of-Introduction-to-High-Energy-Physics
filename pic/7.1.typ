#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

#let blue = rgb("#000000")

#let ext_line(p1, p2, w: 1.15pt, color: blue) = {
  draw.line(p1, p2, stroke: w + color)
}

#let dot(p, r: 1.9pt) = {
  draw.circle(p, radius: r, fill: black, stroke: 0.5pt + black)
}

// 手动画清楚的箭头
#let mom_arrow(p1, p2, w: 0.9pt, head_len: 0.16, head_wid: 0.09) = {
  let x1 = p1.at(0)
  let y1 = p1.at(1)
  let x2 = p2.at(0)
  let y2 = p2.at(1)

  let dx = x2 - x1
  let dy = y2 - y1
  let len = calc.sqrt(dx * dx + dy * dy)

  let tx = dx / len
  let ty = dy / len
  let nx = -ty
  let ny = tx

  draw.line((x1, y1), (x2, y2), stroke: w + black)

  let hx1 = x2 - head_len * tx + head_wid * nx
  let hy1 = y2 - head_len * ty + head_wid * ny
  let hx2 = x2 - head_len * tx - head_wid * nx
  let hy2 = y2 - head_len * ty - head_wid * ny

  draw.line((hx1, hy1), (x2, y2), stroke: w + black)
  draw.line((hx2, hy2), (x2, y2), stroke: w + black)
}

// 一般波浪线（光子线）
#let wavy_line(p0, p1, amp: 0.12, waves: 6, w: 1.2pt, color: blue) = {
  let x0 = p0.at(0)
  let y0 = p0.at(1)
  let x1 = p1.at(0)
  let y1 = p1.at(1)

  let dx = x1 - x0
  let dy = y1 - y0
  let len = calc.sqrt(dx * dx + dy * dy)

  let tx = dx / len
  let ty = dy / len
  let nx = -ty
  let ny = tx

  let pts = ()
  let n = 180
  for i in range(0, n + 1) {
    let t = i / n
    let x = x0 + dx * t + amp * nx * calc.sin(t * waves * 360deg)
    let y = y0 + dy * t + amp * ny * calc.sin(t * waves * 360deg)
    pts.push((x, y))
  }
  draw.line(..pts, stroke: w + color)
}

// 虚线椭圆 blob
#let dashed_ellipse(center, rx: 1.02, ry: 1.58, w: 1.0pt, color: blue) = {
  let cx = center.at(0)
  let cy = center.at(1)

  let pts = ()
  let n = 220
  for i in range(0, n + 1) {
    let t = i / n
    let ang = t * 360deg
    let x = cx + rx * calc.cos(ang)
    let y = cy + ry * calc.sin(ang)
    pts.push((x, y))
  }

  draw.line(
    ..pts,
    stroke: (
      paint: color,
      thickness: w,
      dash: "dashed",
    ),
  )
}

#let blob_with_photons(scale: 1cm) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let O = (0, 0)

    // 中间虚线椭圆
    dashed_ellipse(O, rx: 1.02, ry: 1.58)

    // 椭圆附近连接点
    let L1 = (-1.02, 0.98)
    let VL = (-1.08, -0.05) // 左边黑点顶点
    let L3 = (-1.02, -0.98)

    let R1 = (1.02, 0.98)
    let R2 = (1.02, 0.00)
    let VR = (1.08, -0.62) // 右下黑点顶点

    // 外腿端点
    let E1 = (-2.80, 2.02)
    let E2 = (-2.95, 0.00)
    let E3 = (-2.78, -1.92)

    let E4 = (2.78, 1.98)
    let E5 = (2.98, 0.00)
    let E6 = (2.70, -1.82)

    // 外腿
    ext_line(E1, L1)
    // ext_line(E2, VL)
    ext_line(E3, L3)

    ext_line(R1, E4)
    ext_line(R2, E5)
    // ext_line(VR, E6)

    // 左入射波浪线、右下出射波浪线
    wavy_line((-3.45, -0.18), VL, amp: 0.11, waves: 5)
    wavy_line(VR, (2.90, -2.38), amp: 0.11, waves: 5)

    // 两个黑点
    dot(VL)
    dot(VR)

    // 动量箭头：左边入射
    mom_arrow((-2.22, 1.55), (-1.28, 1.02)) // p1
    mom_arrow((-2.28, 0.00), (-1.28, 0.00)) // p2
    mom_arrow((-2.18, -1.45), (-1.25, -0.98)) // p3

    // 动量箭头：右边出射
    mom_arrow((1.28, 1.02), (2.22, 1.55)) // p4
    mom_arrow((1.28, 0.00), (2.32, 0.00)) // p5
    mom_arrow((1.30, -0.98), (2.22, -1.45)) // p6

    // 标签
    content((-2.00, 1.85), [$p_1$])
    content((-2.45, 0.34), [$p_2$])
    content((-2.02, -1.16), [$p_3$])

    content((1.88, 1.85), [$p_4$])
    content((2.28, 0.34), [$p_5$])
    content((1.92, -1.16), [$p_6$])
  })
}

// 用法
#blob_with_photons(scale: 1cm)
