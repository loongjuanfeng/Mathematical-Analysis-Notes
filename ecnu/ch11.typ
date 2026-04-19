#import "../../libs.typ": *
#import "../syms.typ": *

#show: ilm.with(
  title: [Mathematical Analysis],
  date: datetime.today(),
  author: "Junfeng Lve",
  abstract: [Study notes on Chapter 11 of _数学分析_，陈纪修.],
)
#show: setup

// #todo[补全][
//   = Euclid空间上的基本定理
//   = 多元连续函数
//   = 多元连续函数的性质
// ]

= Euclid空间上的基本定理

#motivation[为什么先讨论Euclid空间][]
一元函数建立在数轴上，多元函数则建立在 $RR^m$ 这样的Euclid空间上。要讨论多元极限与连续性，先得把“点彼此靠近”“集合是否封闭”“闭且有界是否足够好”这些几何直觉整理成可运算的定理。

#definition[Euclid空间与距离][
  记
  $
    RR^m = {(x_1, x_2, dots, x_m) : x_i in RR, i = 1, 2, dots, m}
  $
  上的点 $vc(x) = (x_1, x_2, dots, x_m)$ 与 $vc(y) = (y_1, y_2, dots, y_m)$ 之间的距离为
  $
    rho(vc(x), vc(y)) = norm(vc(x) - vc(y)) = (sum_(i = 1)^m (x_i - y_i)^2)^(1 / 2)
  $
  带有这个距离的 $RR^m$ 称为 $m$ 维Euclid空间。
]

#definition[邻域、内点、聚点][
  + 对 $vc(a) in RR^m$ 与 $r > 0$，集合
    $
      U(vc(a), r) = {vc(x) in RR^m : norm(vc(x) - vc(a)) < r}
    $
    称为 $vc(a)$ 的 $r$ 邻域。
  + 若存在 $r > 0$ 使 $U(vc(a), r) subset.eq E$，则称 $vc(a)$ 为 $E$ 的内点。
  + 若对任意 $r > 0$，总存在 $x in E$，使
    $
      0 < norm(vc(x) - vc(a)) < r
    $
    则称 $vc(a)$ 为 $E$ 的聚点。
]

#definition[开集、闭集、有界集、紧集][
  + 若 $E$ 的每一点都是内点，则称 $E$ 为开集。
  + 若 $E$ 的补集是开集，则称 $E$ 为闭集。
  + 若存在 $M > 0$，使对一切 $vc(x) in E$ 都有 $norm(vc(x)) <= M$，则称 $E$ 有界。
  + 在 $RR^m$ 中，若 $E$ 中的任意点列都能抽出收敛于 $E$ 中某点的子列，则称 $E$ 为紧集。
]

#remark[Euclid空间里“近”的含义][]
在有限维空间里，点靠近既可以从整体距离看，也可以逐坐标地看。Euclid范数把这两种观点统一了：坐标差都很小，整体距离就很小；整体距离很小，每个坐标差也必很小。

#theorem[坐标判别][
  设 $vc(x)_(n) = (x_(n 1), x_(n 2), dots, x_(n m))$，$vc(a) = (a_1, a_2, dots, a_m)$。则
  $
    vc(x)_(n) -> vc(a)
  $
  当且仅当对每个 $i = 1, 2, dots, m$，都有
  $
    x_(n i) -> a_i
  $
]

#theorem[闭集的序列判别][
  集合 $F subset.eq RR^m$ 为闭集，当且仅当对任意点列 $vc(x)_(n) in F$，只要
  $
    vc(x)_(n) -> vc(a)
  $
  就必有 $vc(a) in F$。
]

#theorem[Bolzano-Weierstrass定理][
  $RR^m$ 中的任意有界点列都存在收敛子列。
]

#theorem[Heine-Borel定理][
  在 $RR^m$ 中，集合 $K$ 紧，当且仅当 $K$ 闭且有界。
]

#remark[这条定理的重要性][]
在一般度量空间里，“闭且有界”未必推出紧，但在Euclid空间里却成立。这使许多一元分析中的好性质完整地延续到多元情形：只要把定义域限制在闭有界集上，就能期待极值存在、一致连续以及子列收敛等结论。

#theorem[Cantor套定理的Euclid空间版本][
  设 $K_1, K_2, dots$ 是一列非空紧集，且对每个 $n$ 都有
  $
    K_(n + 1) subset.eq K_n
  $
  则这些紧集的公共部分非空。若再有各集的直径趋于 $0$，则这个公共部分恰好只含一个点。
]

= 多元连续函数

#motivation[多元极限比一元更微妙][]
一元极限只有左右两个方向，多元极限却允许沿无穷多条路径逼近同一点。因此“每个坐标各自看起来没问题”还不够，必须检查所有可能的接近方式是否给出同一个极限。

#definition[多元函数][
  设 $E subset.eq RR^m$，若对每个 $vc(x) in E$ 都唯一对应一个实数 $u$，则称映射
  $
    f : E -> RR
  $
  为定义在 $E$ 上的 $m$ 元实函数，常记作
  $
    u = f(x_1, x_2, dots, x_m)
  $
]

#definition[多元函数的极限][
  设 $vc(a)$ 是 $E$ 的聚点。若存在实数 $A$，使对任意 $epsilon > 0$，总存在 $delta > 0$，当 $vc(x) in E$ 且
  $
    0 < norm(vc(x) - vc(a)) < delta
  $
  时都有
  $
    abs(f(vc(x)) - A) < epsilon
  $
  则称当 $vc(x) -> vc(a)$ 时，$f(vc(x))$ 的极限为 $A$，记作
  $
    lim_(vc(x) -> vc(a)) f(vc(x)) = A
  $
]

#definition[连续性][
  若 $vc(a) in E$ 且
  $
    lim_(vc(x) -> vc(a)) f(vc(x)) = f(vc(a))
  $
  则称 $f$ 在点 $vc(a)$ 连续。若 $f$ 在 $E$ 的每一点都连续，则称 $f$ 在 $E$ 上连续。
]

#theorem[连续的等价刻画][
  设 $vc(a) in E$。以下命题等价：
  + $f$ 在 $vc(a)$ 连续。
  + 对任意点列 $vc(x)_(n) in E$，若 $vc(x)_(n) -> vc(a)$，则 $f(vc(x)_(n)) -> f(vc(a))$。
  + 对任意 $epsilon > 0$，存在 $delta > 0$，使得 $vc(x) in E$ 且 $norm(vc(x) - vc(a)) < delta$ 时，必有 $abs(f(vc(x)) - f(vc(a))) < epsilon$。
]

#theorem[极限的四则运算][
  若
  $
    lim_(vc(x) -> vc(a)) f(vc(x)) = A, quad lim_(vc(x) -> vc(a)) g(vc(x)) = B
  $
  则
  + $lim_(vc(x) -> vc(a)) (f(vc(x)) plus.minus g(vc(x))) = A plus.minus B$
  + $lim_(vc(x) -> vc(a)) f(vc(x)) g(vc(x)) = A B$
  + 当 $B != 0$ 且 $g(vc(x)) != 0$ 在 $vc(a)$ 附近成立时，有
    $
      lim_(vc(x) -> vc(a)) f(vc(x)) / g(vc(x)) = A / B
    $
]

#theorem[复合函数的连续性][
  若 $f$ 在 $vc(a)$ 连续，而 $phi(t)$ 在 $t = f(vc(a))$ 处连续，则复合函数
  $
    phi(f(vc(x)))
  $
  在 $vc(a)$ 连续。更一般地，若 $g : E -> RR^n$ 在 $vc(a)$ 连续，$phi : RR^n -> RR$ 在 $g(vc(a))$ 连续，则 $phi o g$ 在 $vc(a)$ 连续。
]

#remark[用路径证否极限][]
若沿两条不同路径趋于同一点时得到不同的极限值，则总极限不存在。这是多元极限中最常用的反证方式，因为极限若存在，就必须与逼近路径无关。

#example[沿不同路径得到不同极限][
  令
  $
    f(x, y) = x y / (x^2 + y^2) quad ((x, y) != (0, 0))
  $
  当沿直线 $y = x$ 趋于原点时，
  $
    f(x, x) = x^2 / (2 x^2) = 1 / 2
  $
  当沿直线 $y = - x$ 趋于原点时，
  $
    f(x, - x) = - x^2 / (2 x^2) = - 1 / 2
  $
  两条路径给出不同结果，所以
  $
    lim_((x, y) -> (0, 0)) x y / (x^2 + y^2)
  $
  不存在。
]

#example[多项式与有理函数的连续性][
  任意多元多项式都在整个 $RR^m$ 上连续；任意多元有理函数在其分母不为 $0$ 的点上连续。这是因为它们都可由坐标函数与常数函数经有限次四则运算复合得到。
]

= 多元连续函数的性质

#motivation[连续性的价值不止于“极限存在”][]
连续性真正重要的地方在于它能把定义域的几何性质传递到函数值上。局部上，它保证函数不会突然跳变；整体上，在紧集与连通集上，它又能推出极值、界与介值等一整套结论。

#theorem[局部有界性与保号性][
  若 $f$ 在点 $vc(a)$ 连续，则：
  + 存在 $vc(a)$ 的某个邻域，使 $f$ 在该邻域内有界。
  + 若 $f(vc(a)) > 0$，则存在 $vc(a)$ 的某个邻域，使 $f(vc(x)) > 0$；若 $f(vc(a)) < 0$，则存在邻域使 $f(vc(x)) < 0$。
]

#remark[局部性质的直观理解][]
连续意味着当自变量只发生很小扰动时，函数值也只能发生很小扰动。所以一个正值不可能立刻变成负值，一个有限值附近也不可能突然爆到无穷大。

#theorem[紧集上的连续像仍紧][
  若 $K subset.eq RR^m$ 为紧集，$f : K -> RR^n$ 连续，则 $f(K)$ 是 $RR^n$ 中的紧集。
]

#corollary[有界性与最值定理][
  若 $K subset.eq RR^m$ 闭且有界，$f : K -> RR$ 连续，则：
  + $f$ 在 $K$ 上有界；
  + 存在 $vc(x)_(min), vc(x)_(max) in K$，使得对一切 $vc(x) in K$ 都有
    $
      f(vc(x)_(min)) <= f(vc(x)) <= f(vc(x)_(max))
    $
]

#theorem[Cantor定理][
  若 $K subset.eq RR^m$ 为紧集，$f : K -> RR$ 连续，则 $f$ 在 $K$ 上一致连续。
]

#remark[为什么紧性会升级成一致连续][]
在非紧集上，不同点附近所需的 $delta$ 可以差别很大；而紧性保证只需有限个局部邻域就能覆盖整个集合，于是这些局部控制可以拼成一个全局统一的控制尺度。

#theorem[连通集的连续像仍连通][
  若 $E subset.eq RR^m$ 连通，$f : E -> RR$ 连续，则 $f(E)$ 是 $RR$ 中的连通集，因而必为区间。
]

#corollary[介值性质][
  若区域 $D subset.eq RR^m$ 连通，$f : D -> RR$ 连续，且存在 $vc(a), vc(b) in D$ 使
  $
    f(vc(a)) < c < f(vc(b))
  $
  则存在 $vc(xi) in D$ 满足
  $
    f(vc(xi)) = c
  $
]

#example[闭球上的距离函数一定取到最值][
  设 $K = {vc(x) in RR^m : norm(vc(x) - vc(a)) <= r}$，取定一点 $vc(b) in RR^m$。函数
  $
    d(vc(x)) = norm(vc(x) - vc(b))
  $
  在 $K$ 上连续，而 $K$ 闭且有界，因此 $d$ 在 $K$ 上必取到最大值与最小值。这正是最值定理在几何问题中的直接应用。
]

多元连续函数的理论本质上仍是“一元观点加上空间几何”。一方面，连续性仍由 $epsilon$ 与 $delta$ 控制；另一方面，Euclid空间中的紧致性、连通性与路径多样性，使得多元极限与连续性的判别比一元情形更依赖整体几何结构。
