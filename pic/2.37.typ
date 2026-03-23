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

#let ccb_to_3pi(scale: 0.85cm) = {
  cetz.canvas(length: scale, {
    let Cin = (0.8, 2.35)
    let Cbin = (0.8, 0.55)

    let Ltop = (3.9, 2.15)
    let Lmid = (3.9, 1.45)
    let Lbot = (3.9, 0.75)

    let Rtop = (6.2, 2.15)
    let Rmid = (6.2, 1.45)
    let Rbot = (6.2, 0.75)

    let M1 = (9.2, 3.05)
    let M2 = (9.2, 1.80)
    let M3 = (9.2, 0.55)

    pion_bubble(M1, [$u$], [$overline(d)$], [$pi^+$])
    pion_bubble(M2, [$d$], [$overline(d)$], [$pi^0$])
    pion_bubble(M3, [$d$], [$overline(u)$], [$pi^-$])

    line_black(Ltop, Lbot)
    line_black(Cin, (3.0, 2.35))
    qcurve((3.0, 2.35), (3.55, 2.35), Ltop)

    line_black(Cbin, (3.0, 0.55))
    qcurve((3.0, 0.55), (3.55, 0.55), Lbot)

    draw.content((0.55, 2.60), [$c$])
    draw.content((0.35, 0.15), [$overline(c)$])

    coil(Ltop, Rtop)
    coil(Lmid, Rmid)
    coil(Lbot, Rbot)

    dot(Ltop)
    dot(Lmid)
    dot(Lbot)
    dot(Rtop)
    dot(Rmid)
    dot(Rbot)

    draw.content((5.0, 1.55), [$3G$])

    // 六条末态线
    line_black(Rtop, (8.55, 3.40))
    line_black(Rtop, (8.55, 2.70))

    qcurve(Rmid, (7.2, 1.95), (8.55, 2.05))
    qcurve(Rmid, (7.2, 1.15), (8.55, 1.55))

    line_black(Rbot, (8.55, 1.05))
    line_black(Rbot, (8.55, -0.20))
  })
}

#ccb_to_3pi(scale: 0.85cm)

