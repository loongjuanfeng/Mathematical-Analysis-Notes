#import "../../libs.typ": *

#show: ilm.with(
  title: [Mathematical Analysis],
  date: datetime.today(),
  author: "Junfeng Lve",
  abstract: [Exercise/Extra notes on Chapter 9 of _数学分析_，陈纪修.],
)
#show: setup

// #todo[补全][
//   从 $ n / 3^n $ 的求和推广到 $ P(n) / s^n $ 的求和（级数）
// ]

= 指数分母配多项式分子的级数

#example[$sum_(n = 1)^oo n / 3^n$][P7 Q1.(8)][
  求
  $
    sum_(i = 1)^oo n / 3^n
  $

  先从几何级数
  $
    sum_(n = 1)^oo x^n = x / (1 - x), quad abs(x) < 1
  $
  出发。对上式求导并乘以 $x$，得到
  $
    sum_(n = 1)^oo n x^n = x (dif) / (dif x) (x / (1 - x)) = x / (1 - x)^2
  $
  取 $x = 1 / 3$，便有
  $
    sum_(n = 1)^oo n / 3^n = (1 / 3) / (1 - 1 / 3)^2 = 3 / 4
  $
]

#theorem[$P(n) / s^n$ 型级数的一般结论][
  设 $P(n)$ 是次数为 $m$ 的多项式，且 $abs(s) > 1$。令 $x = 1 / s$，则
  $
    sum_(n = 1)^oo P(n) x^n = (x Q(x)) / (1 - x)^(m + 1), quad abs(x) < 1
  $
  其中 $Q(x)$ 是次数不超过 $m$ 的多项式，由以下递推确定：对 $deg P = 0$ 时分母为 $(1-x)$；每将 $P$ 升一次，对 $(1-x) F_P(x)$ 作差分 $Delta P(n) = P(n) - P(n-1)$（次数降1），再由归纳假设得到分母升一次。因而级数收敛，其和是 $s$ 的有理函数。

  实际计算时，对
  $
    sum_(n=1)^oo x^n = x / (1 - x)
  $
  反复施用算子 $x dif / (dif x)$，每作用一次分子多出一阶 $n$：
  $
    sum_(n=1)^oo n x^n = x / (1-x)^2, quad
    sum_(n=1)^oo n^2 x^n = x(1+x) / (1-x)^3, quad dots
  $
  再将 $P(n)$ 分解为 $1, n, n^2, dots$ 的线性组合，逐项代入后叠加即得。
]

#proof[][]
记
$
  F_P(x) = sum_(n = 1)^oo P(n) x^n, quad abs(x) < 1
$
对多项式次数作归纳。

当 $deg P = 0$ 时，$P(n) = c$ 为常数，于是
$
  F_P(x) = c sum_(n = 1)^oo x^n = c x / (1 - x)
$
结论成立。

设结论对次数不超过 $m - 1$ 的多项式都成立。现令 $deg P = m$，则
$
  (1 - x) F_P(x)
  = P(1) x + sum_(n = 2)^oo (P(n) - P(n - 1)) x^n
$
这里
$
  Delta P(n) = P(n) - P(n - 1)
$
仍是一个多项式，而且它的次数恰好降为 $m - 1$。由归纳假设，存在次数不超过 $m - 1$ 的多项式 $R(x)$，使得
$
  P(1) x + sum_(n = 2)^oo (P(n) - P(n - 1)) x^n
  = x R(x) / (1 - x)^m
$
因而
$
  F_P(x) = x R(x) / (1 - x)^(m + 1)
$
这就完成了归纳证明。

最后取 $x = 1 / s$。因为 $abs(s) > 1$，故 $abs(x) < 1$，于是
$
  sum_(n = 1)^oo P(n) / s^n = F_P(1 / s)
$
收敛，且其值是 $s$ 的有理函数。


#remark[如何实际求值][
  真正计算时，最方便的做法通常有两种：

  + 把 $P(n)$ 展开成 $1, n, n^2, dots, n^m$ 的线性组合，分别求和后再相加。
  + 或者直接对
    $
      sum x^n = x / (1 - x)
    $
    反复使用 $x (dif) / (dif x)$，每作用一次，分子就多出一阶 $n$。

  例如再作用一次便得到
  $
    sum_(n = 1)^oo n^2 x^n = x (dif) / (dif x) (x / (1 - x)^2) = x (1 + x) / (1 - x)^3
  $
  所以
  $
    sum_(n = 1)^oo n^2 / 3^n = (1 / 3) (1 + 1 / 3) / (1 - 1 / 3)^3 = 3 / 2
  $
]

// #todo[补全][
//   $ sum_(i = 0)^oo cos(n theta) (theta eq.not 0) $ 的求和如何估计有界？
// ]

#proposition[余弦振荡项的部分和估计][P7 Q1.(9)][
  记
  $
    C_N(theta) = sum_(n = 0)^N cos(n theta)
  $
  若 $theta = 2 k pi$，其中 $k$ 为整数，则 $C_N(theta) = N + 1$，故部分和不有界。

  若 $theta != 2 k pi$ 对任意整数 $k$ 都成立，则
  $
    C_N(theta)
    = sin(((N + 1) theta) / 2) cos((N theta) / 2) / sin(theta / 2)
  $
  从而
  $
    abs(C_N(theta)) <= 1 / abs(sin(theta / 2))
  $
  因而对每个固定的这类 $theta$，部分和数列 $C_N(theta)$ 有界。
]

#proof[][
  利用恒等式
  $
    2 sin(theta / 2) cos(n theta)
    = sin((n + 1 / 2) theta) - sin((n - 1 / 2) theta)
  $
  从 $n = 0$ 到 $N$ 求和，得到
  $
    2 sin(theta / 2) C_N(theta)
    = sin((N + 1 / 2) theta) + sin(theta / 2)
  $
  再用
  $
    sin alpha + sin beta = 2 sin((alpha + beta) / 2) cos((alpha - beta) / 2)
  $
  便得
  $
    C_N(theta)
    = sin(((N + 1) theta) / 2) cos((N theta) / 2) / sin(theta / 2)
  $
  于是
  $
    abs(C_N(theta)) <= 1 / abs(sin(theta / 2))
  $
  证毕。
]

#remark[与Dirichlet判别法的关系][
  这里真正有用的，不是无穷级数
  $
    sum_(n = 0)^oo cos(n theta)
  $
  本身收敛，而是振荡因子
  $
    a_n = cos(n theta)
  $
  的部分和有界。于是只要再乘上一个单调趋于 $0$ 的因子 $b_n$，就可由Dirichlet判别法推出
  $
    sum_(n = 0)^oo cos(n theta) b_n
  $
  收敛。
]

// #todo[][
//   $ sum_(n = 0)^oo q^n cos(n theta) quad (abs(q) < 1) $ 求和
// ]

#example[$sum_(n = 0)^oo q^n cos(n theta)$][P7 Q1.(9)][
  设
  $
    S = sum_(n = 0)^oo q^n cos(n theta), quad abs(q) < 1
  $
  考虑复几何级数
  $
    sum_(n = 0)^oo q^n e^(i n theta)
    = sum_(n = 0)^oo (q e^(i theta))^n
    = 1 / (1 - q e^(i theta))
  $
  其中用到了 $abs(q e^(i theta)) = abs(q) < 1$。

  将右端分母有理化，得
  $
    1 / (1 - q e^(i theta))
    = (1 - q e^(-i theta)) / (1 - 2 q cos theta + q^2)
  $
  左端的实部正是
  $
    sum_(n = 0)^oo q^n cos(n theta)
  $
  而右端的实部为
  $
    (1 - q cos theta) / (1 - 2 q cos theta + q^2)
  $
  故
  $
    sum_(n = 0)^oo q^n cos(n theta)
    = (1 - q cos theta) / (1 - 2 q cos theta + q^2)
  $
]

#remark[与上一题的区别][
  当 $abs(q) < 1$ 时，因子 $q^n$ 已提供指数衰减，所以级数本身直接收敛，而且能化成几何级数求出闭式。

  当 $q = 1$ 时，就退化成
  $
    sum_(n = 0)^oo cos(n theta)
  $
  型，这时一般不收敛；真正有用的是它的部分和有界，这正是Dirichlet判别法里要用到的信息。
]
