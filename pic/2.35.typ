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

// =========================
// 图 1：omega -> 3pi
// =========================

#let omega_to_3pi(scale: 0.9cm) = {
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

    let Uin = (0.90, 2.95)
    let Ubin = (0.90, 0.45)

    let A = (3.15, 2.95)
    let B = (3.15, 0.45)

    let G1 = (4.45, 2.55)
    let G2 = (4.45, 0.85)

    line_black(Uin, A)
    line_black(Ubin, B)

    draw.content((0.35, 1.70), [$omega$])
    draw.content((1.02, 3.25), [$u$])
    draw.content((0.95, 0.05), [$overline(u)$])

    coil(A, G1)
    coil(B, G2)

    // 六条末态线
    // pi+
    line_black(A, P1u)
    qcurve(G1, (6.0, 2.65), P1d)

    // pi0
    qcurve(G1, (6.0, 2.15), P2u)
    qcurve(G2, (6.0, 1.25), P2d)

    // pi-
    qcurve(G2, (6.0, 0.85), P3u)
    line_black(B, P3d)
  })
}

// =========================
// 图 2：phi -> 3pi
// =========================

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

    coil((3.15, 2.55), G1, height: 0.16, loops: 4.5, back: 0.24)
    coil((3.15, 1.70), G2, height: 0.11, loops: 5.0, back: 0.24)
    coil((3.15, 0.85), G3, height: 0.16, loops: 4.5, back: 0.24)

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

// =========================
// 图 3：(a) c cbar -> 3pi
// =========================

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

    line_black(Cin, (3.0, 2.35))
    qcurve((3.0, 2.35), (3.55, 2.35), Ltop)

    line_black(Cbin, (3.0, 0.55))
    qcurve((3.0, 0.55), (3.55, 0.55), Lbot)

    draw.content((0.55, 2.60), [$c$])
    draw.content((0.35, 0.15), [$overline(c)$])

    coil(Ltop, Rtop, height: 0.10, loops: 4.5, back: 0.22)
    coil(Lmid, Rmid, height: 0.10, loops: 4.5, back: 0.22)
    coil(Lbot, Rbot, height: 0.10, loops: 4.5, back: 0.22)

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

// =========================
// 图 4：(b) c cbar -> D+ D-
// =========================

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

    coil(V1, V2, height: 0.12, loops: 4.0, back: 0.24)
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

// =========================
// 使用示例
// =========================

#omega_to_3pi(scale: 0.9cm)
// #phi_to_3pi(scale: 0.9cm)
// #ccb_to_3pi(scale: 0.85cm)
// #ccbar_to_DD(scale: 0.85cm)
