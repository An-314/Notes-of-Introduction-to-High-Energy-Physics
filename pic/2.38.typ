#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

// =========================
// 基础绘图函数
// =========================

#let line_black(p1, p2, w: 1.0pt) = {
  draw.line(p1, p2, stroke: w + black)
}

#let dot(p, r: 1.8pt) = {
  draw.circle(p, radius: r, fill: black, stroke: 0.5pt + black)
}

#let qcurve(p0, c, p1, w: 1.0pt) = {
  let x0 = p0.at(0)
  let y0 = p0.at(1)
  let xc = c.at(0)
  let yc = c.at(1)
  let x1 = p1.at(0)
  let y1 = p1.at(1)

  let pts = ()
  let n = 100
  for i in range(0, n + 1) {
    let t = i / n
    let x = (1 - t) * (1 - t) * x0 + 2 * (1 - t) * t * xc + t * t * x1
    let y = (1 - t) * (1 - t) * y0 + 2 * (1 - t) * t * yc + t * t * y1
    pts.push((x, y))
  }
  draw.line(..pts, stroke: w + black)
}

// 更像胶子线的“卷回去”的螺旋线
#let coil(p0, p1, height: 0.18, loops: 10, back: 0.6, w: 1.0pt) = {
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

  let step = len / loops
  let tang = back * step

  let pts = ()
  let n = 260
  for i in range(0, n + 1) {
    let t = i / n
    let phi = t * loops * 360deg

    // 切向也振荡，形成“往回卷”的感觉
    let s = len * t - tang * calc.sin(phi)

    // 法向鼓起
    let off = height * 0.5 * (1 - calc.cos(phi))

    let x = x0 + tx * s + nx * off
    let y = y0 + ty * s + ny * off
    pts.push((x, y))
  }

  draw.line(..pts, stroke: w + black)
}

#let ellipse_outline(center, rx: 0.52, ry: 0.80, w: 1.0pt) = {
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
  draw.line(..pts, stroke: w + black)
}

#let pion_bubble(center, top_q, bot_q, pion) = {
  ellipse_outline(center)
  draw.content((center.at(0), center.at(1) + 0.28), top_q)
  draw.content((center.at(0), center.at(1) - 0.28), bot_q)
  draw.content((center.at(0) + 0.95, center.at(1)), pion)
}


#let ccbar_to_DD(scale: 0.85cm) = {
  cetz.canvas(length: scale, {
    let Cin = (0.8, 2.45)
    let Cbin = (0.8, 0.55)

    let V1 = (4.2, 2.05)
    let V2 = (5.1, 1.20)

    line_black(Cin, (3.2, 2.45))
    qcurve((3.2, 2.45), (3.9, 2.45), V1)

    line_black(Cbin, (3.4, 0.55))
    qcurve((3.4, 0.55), (4.4, 0.35), (8.6, -0.85))

    draw.content((0.55, 2.75), [$c$])
    draw.content((0.35, 0.10), [$overline(c)$])

    dot(V1)
    dot(V2)

    coil(V1, V2)
    draw.content((4.65, 1.60), [$G$])

    line_black(V1, (8.2, 3.25)) // c
    line_black(V2, (8.1, 2.10)) // dbar
    line_black(V2, (8.2, 0.95)) // d
    line_black((8.6, -0.85), (8.9, -0.95)) // cbar continuation

    draw.content((8.30, 3.45), [$c$])
    draw.content((8.10, 2.25), [$overline(d)$])
    draw.content((8.20, 1.10), [$d$])
    draw.content((8.55, -0.65), [$overline(c)$])

    draw.content((9.35, 3.05), [$D^+$])
    draw.content((9.35, -0.85), [$D^-$])
  })
}

#ccbar_to_DD(scale: 0.85cm)
