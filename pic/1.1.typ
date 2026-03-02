#import "@preview/cetz:0.4.2"
#let panel(
  left_top: [],
  left_bot: [],
  right_top: [],
  right_bot: [],
  pion_label: [],
  pion_y1: [],
  pion_y2: [],
  dx: 0cm,
) = {
  cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // x 坐标：左核子线 x=0，右核子线 x=3
    let xL = 0
    let xR = 2
    // 画核子世界线（竖线）
    set-style(stroke: 1pt)
    line((xL, 0), (xL, 3))
    line((xR, 0), (xR, 3))
    // 画π介子虚线（可斜可水平）
    line((xL, pion_y1), (xR, pion_y2), stroke: (dash: "dashed"))
    // 端点标注（上：y=3.1，下：y=-0.25）
    content((xL - 0.25, 3.1), left_top)
    content((xL - 0.25, -0.25), left_bot)
    content((xR + 0.05, 3.1), right_top)
    content((xR + 0.05, -0.25), right_bot)
    // π 标注：放在线段中点附近
    content(((xL + xR) / 2 - 0.2, (pion_y1 + pion_y2) / 2 + 0.1), pion_label)
  })
}
#stack(
  dir: ltr,
  spacing: 1.2cm,
  // π+：左 p->n，右 n->p（斜线）
  [#panel(
    left_top: [$n$],
    left_bot: [$p$],
    right_top: [$p$],
    right_bot: [$n$],
    pion_label: [$pi^+$],
    pion_y1: 0.9,
    pion_y2: 2.1,
  )],
  // π-：左 n->p，右 p->n（斜线）
  [#panel(
    left_top: [$n$],
    left_bot: [$p$],
    right_top: [$p$],
    right_bot: [$n$],
    pion_label: [$pi^-$],
    pion_y1: 2.1,
    pion_y2: 0.9,
  )],
  // π0：左 p->p，右 n->n（水平线）
  [#panel(
    left_top: [$p$],
    left_bot: [$p$],
    right_top: [$n$],
    right_bot: [$n$],
    pion_label: [$pi^0$],
    pion_y1: 1.5,
    pion_y2: 1.5,
  )],
)
