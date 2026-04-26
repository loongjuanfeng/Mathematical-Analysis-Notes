#import "../../libs.typ": *
#import "../syms.typ": *

#show: ilm.with(
  title: [Mathematical Analysis - Midterm Exam],
  date: datetime.today(),
  author: "Junfeng Lve",
  abstract: [Review notes on midterm exam of _数学分析_.],
)
#show: setup

#human[警告][
  本文档由人类编写，可能含有错误。
]

= Chapter 10

#align(center, [WIP])

== 函数项级数的收敛性

=== 点态收敛

对于 ${s_i}_(i = 1)^oo$
$
  s_n (x) = dots
$

对于 ${u_i}_(i = 1)^oo$
$
  sum_(i = 1)^N u_i = s_N
$


首先把 $x$ 当作常数，让 $n -> oo$，如果能够收敛到相同定义域的 $s_oo$，那么这就是点态收敛的结果。

=== 一致收敛

#definition[定义][
  $
    forall epsilon, exists N in NN, forall n > N, \
    sup_(x in D) {abs(s_n (x) - s_oo (x))} < epsilon
  $
]

#theorem[Cauchy判敛][
  $
    forall epsilon, exists N in NN, forall m > n > N, \
    sup_(x in D) {abs(s_n (x) - s_m (x))} = sup_(x in D) {abs(sum_(i = n + 1)^m u_i (x))} < epsilon
  $
  适合在 $s_n (x)$ 难以求出的时候使用。
]

#theorem[Weierstrass判敛][
  #align(center, strong([找到 $u_n (x)$ 上界 ${a_n}_(n = 1)^oo$]))
  $
    exists {a_n}_(n = 1)^oo subset RR^+, forall n in NN, \
    sup_(x in D) {abs(u_n (x))} <= a_n
  $
  此时称 ${u_n (x)}_(n = 1)^oo$ 正常收敛。
]

#theorem[Abel判敛][
  #align(center, strong([震荡求和一致收敛，幅度单调趋于常数]))
  ${a_n (x)}_(n = 1)^oo, {b_n (x)}_(n = 1)^oo$ 为两个函数列。如果
  + ${a_n (x)}_(n = 1)^oo$ 关于 $n$ 单调，且一致有界。
    $
      forall n in NN, x in D, \
      abs(a_n (x)) < M
    $
  + $sum_(n = 1)^oo b_n (x)$ 一致收敛。
  则 ${sum_(i = 1)^n a_i (x) b_i (x)}_(n = 1)^oo$ 一致收敛。
]

#theorem[Dirichlet判敛][
  #align(center, strong([震荡求和一致有界，幅度单调趋于 $0$]))
  ${a_n (x)}_(n = 1)^oo, {b_n (x)}_(n = 1)^oo$ 为两个函数列。如果
  + $a_n (x)$ 关于 $n$ 单调，$a_n (x) arrows.rr 0, quad n arrow oo$
  + $sum_(i = 1)^N b_i (x)$ 一致有界。
  则 ${sum_(i = 1)^n a_i (x) b_i (x)}_(n = 1)^oo$ 一致收敛。
]

#theorem[Dini判敛][
  #align(center, strong([紧集上连续单调，则点态收敛即一致收敛]))
  在紧集 $E$ 上，$f_n : E -> R, f_n in C(E)$ 关于 $n$ 单调，$f_n -> f, f in C(E), quad n -> oo$，则 $f_n arrows.rr f, quad n -> oo$。
]

=== 不一致收敛

#corollary[定义][
  $
    exists epsilon_0, forall N in NN, exists n > N, \
    sup_(x in D) {abs(s_n (x) - s_oo (x)}) >= epsilon_0
  $
]

#strategy[对角线判"散"][
  #align(center, strong([寻找使 $abs(u_n (x_n)) >= epsilon_0$ 的 ${x_n}_(n = 1)^oo$]))
  对于 ${s_n}_(n = 1)^oo slash {u_n}_(n = 1)^oo$ 找出 ${x_n}_(n = 1)^oo$ 的点列使得
  $
    abs(s_n (x_n) - s_oo (x_n)) & arrow.not 0, quad n arrow oo \
            "or" abs(u_n (x_n)) & arrow.not 0, quad n -> oo
  $
  经常结合导数
  $
    (s_n - s_oo)'(x_n) & = 0 \
       "or" u'_n (x_n) & = 0
  $
  来求解 ${x_n}_(n = 1)^oo$。
]

#corollary[Cauchy判敛][
  #align(center, strong([分母上有 $n$ 导致难以判断一致收敛]))
  $
    exists epsilon_0, forall N in NN, exists m > n > N, \
    sup_(x in D) {abs(s_m (x) - s_n (x))} = sup_(x in D) {abs(sum_(i = n + 1)^m u_i (x))} >= epsilon_0
  $
]

#corollary[连续性定理逆用][
  如果 $forall n, s_n in C(E), s in.not C(E)$，则
  $
    s_n arrow.r.not s, quad n -> oo
  $
  在 $x^n, quad x in (0, 1)$ 这种上面很方便。
]

== 一致收敛级数的性质

#theorem[连续性][
  $
    forall n in NN, f_n in C(D) arrow.long.double lim_(n -> oo) f_n = f_oo in C(D)
  $
  其中 $D$ 可以是任何集合。另一种表示形式是
  $
    forall n in NN, f_n in C(D) arrow.long.double lim_(n -> oo) lim_(x -> x_0) f_n (x_0) = lim_(x -> x_0) lim_(n -> oo) f_n (x_0)
  $
]

#theorem[可积性][
  $
    forall n in NN, f_n : [a, b] -> RR, f_n arrows.rr f_oo arrow.double.long integral lim_(n -> oo) f_n (x) dif x = lim_(n -> oo) integral f_n (x) dif x
  $
]

#theorem[可导性][
  $
    f_n in C^1 [a, b], f'_n arrows.rr g \
    exists x_0 in [a, b], lim_(n -> oo) f_n (x_0) < oo
  $
  则有
  $
    f_n arrows.rr f, f'_n -> f' = g, quad n -> oo
  $
]

== 例题

#example[[1] Xie 14.1.4][Bendixon判敛][
  $sum_(n = 1)^oo u_n (x)$ 为 $[a, b]$ 上的可微函数项级数，且 $sum_(n = 1)^oo u'_n (x)$ 在 $[a, b]$ 上收敛。证明：$sum_(n = 1)^oo u_n (x)$ 在 $[a, b]$ 上收敛能推出 $sum_(n = 1)^oo u_n (x)$ 在 $[a, b]$ 上一致收敛。
]

#example[[4] Xie 14.1.5][
  证明：函数项级数 $sum_(n = 1)^oo (-1)^n x^n (1 - x)$ 在 $[0, 1]$ 上绝对收敛且一致收敛，但不绝对一致收敛。
]

#example[[5] Xie 14.1.7][
  级数 $sum_(n = 1)^oo (sin (n x))/n$ 在闭区间 $[a, b]$ 上一致收敛的充分必要条件是 $[a, b]$ 中不包含 $2 pi$ 的整数倍点。
]

#example[[3] Xie 14.1.8][
  设 ${b_n}_(n = 1)^oo$ 为单调减少的非负数列，证明：级数 $sum_(n = 1)^oo b_n sin(n x)$ 在 $(-oo, +oo)$ 上一致收敛的充分必要条件是 $b_n = o(1/n)$。
]

= Chapter 11

#align(center, [WIP])

= Chapter 12

== Taylor公式

#align(center, [#strong([定中心，写到够用阶，余项优先写成小 $o$])])

考试里先想三件事：在谁附近展开、要展开到几阶、最后保留什么余项。真要写条件，只需写“在展开点附近具有足够阶连续偏导”。

+ 一元函数在 $x_0$ 处的 $n$ 阶展开（背诵模板）
  $
    f(x) = f(x_0) + f'(x_0) (x - x_0) + dots + f^(n)(x_0) / n! (x - x_0)^n + o((x - x_0)^n)
  $
  特别地，$x_0 = 0$ 时就是Maclaurin公式。

+ 若题目要求Lagrange余项，写成
  $
    f(x) = sum_(k = 0)^n f^(k)(x_0) / k! (x - x_0)^k + f^(n+1)(xi) / (n + 1)! (x - x_0)^(n+1)
  $
  其中 $xi$ 在 $x_0$ 与 $x$ 之间。

+ 多元函数在 $vc(x)_0$ 处的 $n$ 阶展开，令
  $
    Delta vc(x) = vc(x) - vc(x)_0, quad D := sum_(i = 1)^m Delta x_i partial/(partial x_i)
  $
  则
  $
    f(vc(x)_0 + Delta vc(x)) = sum_(k = 0)^n (D^k f|_(vc(x) = vc(x)_0)) / k! + o(norm(Delta vc(x))^n)
  $
  若要写Lagrange余项，则
  $
    r_n = (D^(n+1) f|_(vc(x) = vc(x)_0 + theta Delta vc(x))) / (n + 1)!, quad theta in (0, 1)
  $

+ 二元二阶展开是做题最高频模板。设 $rho = norm((Delta x, Delta y))$，则
  $
    f(x_0 + Delta x, y_0 + Delta y) = f(x_0, y_0) + f_x Delta x + f_y Delta y \
    + 1 / 2 (f_(x x) Delta x^2 + 2 f_(x y) Delta x Delta y + f_(y y) Delta y^2) + o(rho^2)
  $
  这里各偏导都在 $(x_0, y_0)$ 处取值。

+ 驻点附近尤其要背
  $
    vc(nabla) f(vc(x)_0) = vc(0) => f(vc(x)_0 + Delta vc(x)) - f(vc(x)_0) = 1 / 2 sum_(i = 1)^m sum_(j = 1)^m f_(x_i x_j)(vc(x)_0) Delta x_i Delta x_j + o(norm(Delta vc(x))^2)
  $
  也就是说：一阶项消失后，符号主要由二次项决定。

+ 做题口令
  1. 极限 / 等价无穷小：通常写到第一个非零项为止。
  2. 判极值：先看一阶项是否为 $0$；若为 $0$，立刻写二阶Taylor公式。
  3. 需要估计误差大小时用Lagrange余项；只求局部等价时优先用Peano余项。

+ 几个常用的Maclaurin展开（默认 $x -> 0$）
  $
    e^x = 1 + x + x^2 / 2 + o(x^2), quad sin x = x - x^3 / 6 + o(x^3) \
    cos x = 1 - x^2 / 2 + o(x^2), quad ln(1 + x) = x - x^2 / 2 + x^3 / 3 + o(x^3) \
    (1 + x)^alpha = 1 + alpha x + alpha (alpha - 1) x^2 / 2 + o(x^2), quad 1 / (1 + x) = 1 - x + x^2 + o(x^2)
  $

#notation[偏导数][
  $F_x$ 代表函数 $F(x, dots)$ 或方程 $F(x, dots) = 0$ 对于 $x$ 的偏导（不考虑 $x$ 对其他自变量的影响，但是有歧义的时候最好使用 $F_1$ 类似的符号表示位置），等效于
  $ (partial F) / (partial x) $
]

== 隐函数求偏导

#align(center, [#strong([对"分母"求偏导，解线性方程组])])

一阶：

$
  F(x, u) = 0, quad u = u(x)
$

$
  F_x + F_u u_x = 0 => (partial u) / (partial x) = u_x = - F_x/F_u
$

二阶：

$
  cases(F(x, y, u, v) = & 0, G(x, y, u, v) = & 0) quad u = u(x, y), v = v(x, y)
$

$
  cases(F_x + F_u u_x + F_v v_x & = 0, G_x + G_u u_x + G_v v_x & = 0) => cases(F_u u_x + F_v v_x & = -F_x, G_u u_x + G_v v_x & = -G_x) => mat(F_u, F_v; G_u, G_v) vec(u_x, v_x) = -vec(F_x, G_x) \
  => (partial (F, G)) / (partial (u, v)) vec(u_x, v_x) = -vec(F_x, G_x)
$

参考

$
  mt(A)vc(x) = vc(b)
$

的Cramer法则得到

$
  u_x = -frac(det display(mat(F_x, F_v; G_x, G_v)), det display(mat(F_u, F_v; G_u, G_v))) = -frac(det display(frac(partial (F, G), partial (x, v))), det display(frac(partial (F, G), partial (u, v)))),
  v_x = -frac(det display(mat(F_u, F_x; G_u, G_x)), det display(mat(F_u, F_v; G_u, G_v))) = -frac(det display(frac(partial (F, G), partial (u, x))), det display(frac(partial (F, G), partial (u, v))))
$

以此类推

$
  u_y = -frac(det display(mat(F_y, F_v; G_y, G_v)), det display(mat(F_u, F_v; G_u, G_v))) = -frac(det display(frac(partial (F, G), partial (y, v))), det display(frac(partial (F, G), partial (u, v)))),
  v_y = -frac(det display(mat(F_u, F_y; G_u, G_y)), det display(mat(F_u, F_v; G_u, G_v))) = -frac(det display(frac(partial (F, G), partial (u, y))), det display(frac(partial (F, G), partial (u, v))))
$

高次偏导：

直接对已有的一阶偏导再求一次偏导（中间需要带入你已知的结果）。

== 偏导数与几何

#align(center, [#strong([偏导代替大脑，梯度接管思考])])

+ 题目给了隐函数方程 / 方程组（一般是三元二方程），此时梯度使用隐函数求法
  $
    vc(nabla)|_(vc(x)_0) = (1, (dif y) / (dif x), (dif z) / (dif x))
  $
+ 题目给了参数方程，此时梯度为
  $
    vc(nabla)|_(t_0) = ((partial x) / (partial t), (partial y) / (partial t), (partial z) / (partial t))
  $

已经有了梯度，那么在求法线 / 切线（无需区分，反正是线）的时候直接使用
$
  (x - x_0) / nabla_x = (y - y_0) / nabla_y = (z - z_0) / nabla_z
$

求法平面 / 切平面（都是平面）的时候直接使用
$
  nabla_x (x - x_0) + nabla_y (y - y_0) + nabla_z (z - z_0) = 0 \
  vc(nabla) dot (vc(x) - vc(x)_0) = 0
$

== 拉格朗日乘数法

#align(center, [#strong([设参数，列方程组])])

$
  cases(
    f(vc(x)) & = f,
    A(vc(x)) & = 0,
    & dots.v,
  )
$

其中 $f$ 是目标函数（求极值的对象），$A$ 是约束函数。

设出

$
  F(vc(x), lambda_1, dots) := f(vc(x)) + sum lambda_i A(vc(x))
$

只需要解

$
  vc(nabla)_F = vc(0)
$

的解集 ${vc(x)_i}$

然后*验证*

$
  (mt(A))_(i j) = (partial^2 f|_(vc(x) = vc(x)_0)) / (partial x_i partial x_j)
$

是否是正定 / 负定矩阵（是否对每个 $vc(x)_0$ 附近微小的 $dif vc(x)$ 都有正值），检验顺序主子式是否全部大于 $0$ / 符号奇偶交替。

== 递推数列估计

#align(center, [#strong([展开 $f$，寻找 $beta$ 使 $x_(n+1)^beta - x_n^beta$ 趋于非零常数])])

设 $x_n -> 0$ 且 $x_(n+1) = f(x_n)$，首先对 $f$ 在 $0$ 处Taylor展开得到 $x_n$ 的递推阶。

#strategy[找 $beta$ 使差趋于常数][
  若已从Taylor展开得到 $x_(n+1) - x_n ~ c x_n^alpha$，则寻找 $beta$ 使得
  $
    x_(n+1)^beta - x_n^beta -> C != 0
  $
  再对 $x_n^beta$ 用Stolz定理：
  $
    lim_(n -> oo) x_n^beta / n = C => x_n ~ (C n)^(1/beta)
  $
]

#example[[1] 经典题][
  $x_1 > 0, x_(n+1) = sin x_n$，求 $x_n$ 的等价无穷小。

  解：由 $sin x = x - x^3 / 6 + o(x^3)$ 得 $x_(n+1) - x_n ~ - x_n^3 / 6 < 0$，故 $x_n$ 单调递减趋于 $0$。

  取 $beta = -2$：
  $
    x_(n+1)^(-2) &= (x_n - x_n^3 / 6 + o(x_n^3))^(-2) \
    &= x_n^(-2) (1 - x_n^2 / 6 + o(x_n^2))^(-2) \
    &= x_n^(-2) (1 + 2 dot x_n^2 / 6 + o(x_n^2)) \
    &= x_n^(-2) + 1 / 3 + o(1)
  $
  于是 $x_(n+1)^(-2) - x_n^(-2) -> 1 / 3$。由Stolz定理，$x_n^(-2) / n -> 1 / 3$，即
  $
    x_n ~ sqrt(3 / n)
  $
]
