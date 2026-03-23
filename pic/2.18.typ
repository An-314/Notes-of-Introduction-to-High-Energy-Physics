#set page(height: auto, width: auto, margin: 0.5cm)
#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

#let qline(p1, p2, stroke: 1pt + black) = {
  draw.line(p1, p2, stroke: stroke, end: ">")
}

#let dot(p, r: 1pt) = {
  draw.circle(p, radius: r, fill: black, stroke: 0.6pt + black)
}

// 任意方向的胶子线（波浪/卷曲近似）
#let gluon(p1, p2, amp: 0.08, waves: 7, stroke: 1pt + black) = {
  let x1 = p1.at(0)
  let y1 = p1.at(1)
  let x2 = p2.at(0)
  let y2 = p2.at(1)

  let dx = x2 - x1
  let dy = y2 - y1
  let len = calc.sqrt(dx * dx + dy * dy)
  let nx = -dy / len
  let ny = dx / len

  let pts = ()
  let n = 140
  for i in range(0, n + 1) {
    let t = i / n
    let x = x1 + dx * t + amp * nx * calc.sin(t * waves * 360deg)
    let y = y1 + dy * t + amp * ny * calc.sin(t * waves * 360deg)
    pts.push((x, y))
  }
  draw.line(..pts, stroke: stroke)
}

#let quark_exchange(scale: 0.45cm, dot_r: 2pt) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    // -------------------------
    // 左边六条外腿（你给的 L1..L6）
    // -------------------------
    let L1 = (-5.2, 2.5)
    let L2 = (-4.4, 2.5)
    let L3 = (-3.6, 2.5)

    let L4 = (-5.2, -2.5)
    let L5 = (-4.4, -2.5)
    let L6 = (-3.6, -2.5)

    // -------------------------
    // 左边内部四点（La..Ld）
    // -------------------------
    let La = (-4.1, 0.9)
    let Lb = (-3.2, 0.15)
    let Lc = (-2.2, 0.9)
    let Ld = (-2.2, -0.9)

    // -------------------------
    // 右边内部四点（Ra..Rd）
    // -------------------------
    let Rc = (2.2, 0.9)
    let Rd = (2.2, -0.9)
    let Ra = (3.2, 0.15)
    let Rb = (4.1, -0.15)

    // -------------------------
    // 右边六条外腿（R1..R6）
    // -------------------------
    let R1 = (5.2, 2.5)
    let R2 = (6.0, 2.5)
    let R3 = (6.8, 2.5)

    let R4 = (5.2, -2.5)
    let R5 = (6.0, -2.5)
    let R6 = (6.8, -2.5)

    // -------------------------
    // 左边外腿标签
    // -------------------------
    draw.content((-5.35, 2.8), [$d$])
    draw.content((-4.55, 2.8), [$u$])
    draw.content((-3.75, 2.8), [$u$])

    draw.content((-5.35, -2.95), [$d$])
    draw.content((-4.55, -2.95), [$u$])
    draw.content((-3.75, -2.95), [$u$])

    // -------------------------
    // 右边外腿标签
    // -------------------------
    draw.content((5.05, 2.8), [$u$])
    draw.content((5.85, 2.8), [$u$])
    draw.content((6.65, 2.8), [$d$])

    draw.content((5.05, -2.95), [$u$])
    draw.content((5.85, -2.95), [$u$])
    draw.content((6.65, -2.95), [$d$])

    // -------------------------
    // 按你给的连接关系画线
    // -------------------------

    // L1 -> La
    qline(L1, La)
    // L4 -> La
    qline(L4, La)

    // L2 -> Lb
    qline(L2, Lb)
    // L5 -> Lb
    qline(L5, Lb)

    // L3 -> Lc
    qline(L3, Lc)
    // L6 -> Ld
    qline(L6, Ld)

    // La -> Lc (gluon)
    gluon(La, Lc)
    // Lb -> Ld (gluon)
    gluon(Lb, Ld)

    // Lc -> Rc
    qline(Lc, Rc)
    // Ld -> Rd
    qline(Ld, Rd)

    // Rc -> Ra (gluon)
    gluon(Rc, Ra)
    // Rd -> Rb (gluon)
    gluon(Rd, Rb)

    // Rc -> R1
    qline(Rc, R1)
    // Ra -> R2
    qline(Ra, R2)
    // Rb -> R3
    qline(Rb, R3)

    // Rd -> R4
    qline(Rd, R4)
    // Ra -> R5
    qline(Ra, R5)
    // Rb -> R6
    qline(Rb, R6)

    // -------------------------
    // 顶点点
    // -------------------------
    dot(La, r: dot_r)
    dot(Lb, r: dot_r)
    dot(Lc, r: dot_r)
    dot(Ld, r: dot_r)

    dot(Ra, r: dot_r)
    dot(Rb, r: dot_r)
    dot(Rc, r: dot_r)
    dot(Rd, r: dot_r)
  })
}

// 用法
#quark_exchange(scale: 0.45cm, dot_r: 1pt)
