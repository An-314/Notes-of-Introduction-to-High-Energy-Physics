#set page(height: auto, width: auto, margin: 0.5cm)

#import "@preview/cetz:0.4.2"
#import cetz.draw as draw

#let blue = rgb("#000000")

#let ext_line(p1, p2, w: 1.1pt) = {
  draw.line(p1, p2, stroke: w + blue)
}

// 手动画箭头，保证箭头头清楚
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

// 左图：直接道图
#let direct_channel(scale: 1cm) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let vt = (0.0, 1.0)
    let vb = (0.0, -1.0)

    let lt = (-1.8, 2.2)
    let lb = (-1.8, -2.2)

    let rt = (1.8, 2.2)
    let rb = (1.8, -2.2)

    // 外线
    ext_line(lt, vt)
    ext_line(lb, vb)
    ext_line(vt, rt)
    ext_line(vb, rb)

    // 内线
    ext_line(vb, vt)

    // 动量箭头
    mom_arrow((-1.15, 1.55), (-0.35, 1.05)) // p2
    mom_arrow((-1.15, -1.55), (-0.35, -1.05)) // p1
    mom_arrow((0.35, 1.05), (1.15, 1.55)) // p4
    mom_arrow((0.35, -1.05), (1.15, -1.55)) // p3
    mom_arrow((0.0, -0.55), (0.0, 0.55)) // q

    // 标签
    content((-2.25, 1.55), [$A$])
    content((-2.25, -1.55), [$A$])
    content((2.25, 1.55), [$B$])
    content((2.25, -1.55), [$B$])

    content((-1.15, 2.55), [$p_2$])
    content((-1.15, -2.45), [$p_1$])
    content((0.95, 2.55), [$p_4$])
    content((0.95, -2.45), [$p_3$])

    content((-0.38, 0.0), [$q$])
    content((0.28, 0.0), [$C$])
  })
}

// 右图：交叉末态图
#let crossed_channel(scale: 1cm) = {
  cetz.canvas(length: scale, {
    import cetz.draw: *

    let vt = (-0.35, 1.0)
    let vb = (-0.35, -1.0)

    let lt = (-2.2, 2.2)
    let lb = (-2.2, -2.2)

    let rt = (2.2, 2.2)
    let rb = (2.2, -2.2)

    // 左边入射
    ext_line(lt, vt)
    ext_line(lb, vb)

    // 右边交叉出射
    ext_line(vb, rt)
    ext_line(vt, rb)

    // 内线
    ext_line(vb, vt)

    // 动量箭头
    mom_arrow((-1.55, 1.55), (-0.70, 1.05)) // p2
    mom_arrow((-1.55, -1.55), (-0.70, -1.05)) // p1
    mom_arrow((0.70, 1.05), (1.55, 1.55)) // p4
    mom_arrow((0.70, -1.05), (1.55, -1.55)) // p3
    mom_arrow((-0.35, -0.55), (-0.35, 0.55)) // q

    // 标签
    content((-2.55, 1.55), [$A$])
    content((-2.55, -1.55), [$A$])
    content((2.55, 1.55), [$B$])
    content((2.55, -1.55), [$B$])

    content((-1.55, 2.55), [$p_2$])
    content((-1.55, -2.45), [$p_1$])
    content((1.20, 2.55), [$p_4$])
    content((1.20, -2.45), [$p_3$])

    content((-0.75, 0.0), [$q$])
    content((-0.08, 0.0), [$C$])
  })
}

// 并排排版
#grid(
  columns: 2,
  column-gutter: 1.6cm,
  [
    #direct_channel(scale: 1cm)
  ],
  [
    #crossed_channel(scale: 1cm)
  ],
)
