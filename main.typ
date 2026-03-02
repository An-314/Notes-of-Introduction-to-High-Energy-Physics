#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  template: "book",
  title: [粒子物理导论],
  author: ("Anzreww",),
  time: "丙午春夏于清华园",
  contents: true,
  content-depth: 3,
  matheq-depth: 3,
  lang: "zh",
)

#include "chap1.typ"
#pagebreak()
#outline(target: figure, title: [图表目录])

