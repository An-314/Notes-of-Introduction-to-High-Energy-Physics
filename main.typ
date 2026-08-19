#import "@preview/scripst:1.1.2": *


#show: scripst.with(
  template: "book",
  title: [粒子物理导论],
  author: ("Anzreww",),
  time: "丙午春夏于清华园",
  contents: true,
  font-size: 12pt,
  par-leading: 0.8em,
  content-depth: 3,
  matheq-depth: 3,
  lang: "zh",
)

#outline(target: figure.where(kind: table), title: [表格索引])
#outline(target: figure.where(kind: image), title: [图像索引])
#pagebreak()
#include "chap1.typ"
#pagebreak()
#include "chap2.typ"
#pagebreak()
#include "chap3.typ"
#pagebreak()
#include "chap4.typ"
#pagebreak()
#include "chap5.typ"
#pagebreak()
#include "chap6.typ"
#pagebreak()
#include "chap7.typ"
#pagebreak()
#include "chap8.typ"
#pagebreak()
#include "chap9.typ"
#pagebreak()
#include "chap10.typ"
