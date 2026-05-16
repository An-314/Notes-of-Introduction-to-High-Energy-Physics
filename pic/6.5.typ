#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

#let ext_line(p1, p2, w: 1.1pt) = {
  draw.line(p1, p2, stroke: w + black)
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

  // 箭杆
  draw.line((x1, y1), (x2, y2), stroke: w + black)

  // 箭头两翼
  let hx1 = x2 - head_len * tx + head_wid * nx
  let hy1 = y2 - head_len * ty + head_wid * ny

  let hx2 = x2 - head_len * tx - head_wid * nx
  let hy2 = y2 - head_len * ty - head_wid * ny

  draw.line((hx1, hy1), (x2, y2), stroke: w + black)
  draw.line((hx2, hy2), (x2, y2), stroke: w + black)
}

// 虚线椭圆 blob
#let dashed_ellipse(center, rx: 1.0, ry: 1.55, w: 1.0pt) = {
  let cx = center.at(0)
  let cy = center.at(1)

  let pts = ()
  let n = 180
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
      paint: black,
      thickness: w,
      dash: "dashed",
    ),
  )
}

#let blob_scattering(scale: 1cm) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let O = (0, 0)

    // 中间 blob
    dashed_ellipse(O, rx: 1.0, ry: 1.55, w: 1.0pt)

    // 椭圆左右连接点
    let L1 = (-1.0, 0.95)
    let L2 = (-1.0, 0.00)
    let L3 = (-1.0, -0.95)

    let R1 = (1.0, 0.95)
    let R2 = (1.0, 0.00)
    let R3 = (1.0, -0.95)

    // 六条外腿终点
    let E1 = (-2.75, 2.05)
    let E2 = (-2.95, 0.00)
    let E3 = (-2.75, -2.05)

    let E4 = (2.75, 2.05)
    let E5 = (2.95, 0.00)
    let E6 = (2.75, -2.05)

    // 外腿
    ext_line(E1, L1)
    ext_line(E2, L2)
    ext_line(E3, L3)

    ext_line(R1, E4)
    ext_line(R2, E5)
    ext_line(R3, E6)

    // 动量箭头
    // 左边：入射，指向 blob
    mom_arrow((-2.35, 1.62), (-1.38, 1.02))
    mom_arrow((-2.45, 0.00), (-1.35, 0.00))
    mom_arrow((-2.35, -1.62), (-1.38, -1.02))

    // 右边：出射，背离 blob
    mom_arrow((1.38, 1.02), (2.35, 1.62))
    mom_arrow((1.35, 0.00), (2.45, 0.00))
    mom_arrow((1.38, -1.02), (2.35, -1.62))

    // 标签
    content((-2.02, 1.88), [$p_1$])
    content((-2.55, 0.36), [$p_2$])
    content((-2.02, -1.28), [$p_3$])

    content((1.95, 1.88), [$p_4$])
    content((2.35, 0.36), [$p_5$])
    content((1.95, -1.28), [$p_6$])
  })
}

// 用法
#blob_scattering(scale: 1cm)
