#import "../../libs.typ": *

#show: ilm.with(
  title: [Mathematical Analysis],
  date: datetime.today(),
  author: "Junfeng Lve",
  abstract: [Exercise/Extra notes on Chapter 9 of _数学分析_，陈纪修.],
)
#show: setup

// #todo[补全][
//   从$ n / 3^n $ 的求和推广到 $ P(n) / s^n $ 的求和（级数）
// ]

= 指数分母配多项式分子的级数

#example[$sum_(n = 1)^oo n / 3^n$][
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
