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

#let phi_to_3pi(scale: 0.9cm) = {
  cetz.canvas(length: scale, {
    let M1 = (8.35, 3.00)
    let M2 = (8.35, 1.70)
    let M3 = (8.35, 0.40)

    pion_bubble(M1, [$u$], [$overline(d)$], [$pi^+$])
    pion_bubble(M2, [$d$], [$overline(d)$], [$pi^0$])
    pion_bubble(M3, [$d$], [$overline(u)$], [$pi^-$])

    let P1u = (7.78, 3.35)
    let P1d = (7.78, 2.65)
    let P2u = (7.78, 2.05)
    let P2d = (7.78, 1.35)
    let P3u = (7.78, 0.75)
    let P3d = (7.78, 0.05)

    let Sin = (0.90, 2.95)
    let Sbin = (0.90, 0.45)

    let X1 = (3.15, 2.95)
    let X2 = (3.15, 0.45)

    line_black(Sin, X1)
    line_black(Sbin, X2)
    line_black(X1, X2)

    draw.content((0.35, 1.70), [$phi$])
    draw.content((1.02, 3.25), [$s$])
    draw.content((0.95, 0.05), [$overline(s)$])

    let G1 = (4.55, 2.55)
    let G2 = (4.55, 1.70)
    let G3 = (4.55, 0.85)

    coil((3.15, 2.55), G1)
    coil((3.15, 1.70), G2)
    coil((3.15, 0.85), G3)

    // 六条末态线
    // pi+
    line_black(G1, P1u)
    qcurve(G2, (6.00, 2.55), P1d)

    // pi0
    qcurve(G1, (6.15, 2.20), P2u)
    qcurve(G3, (6.15, 1.20), P2d)

    // pi-
    qcurve(G2, (6.00, 0.95), P3u)
    line_black(G3, P3d)
  })
}

#phi_to_3pi(scale: 0.9cm)

