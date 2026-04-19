#import "../../libs.typ": *

#show: ilm.with(
  title: [Mathematical Analysis],
  date: datetime.today(),
  author: "Junfeng Lve",
  abstract: [Study notes on Chapter 9 of _数学分析_，陈纪修.],
)
#show: setup

= 数项级数的收敛

#definition[数项级数的收敛和发散][
  给定数列 $a_1, a_2, dots$，称形式和
  $
    sum_(n = 1)^oo a_n = a_1 + a_2 + dots
  $
  为数项级数。记它的部分和为
  $
    s_n = sum_(k = 1)^n a_k
  $
  若数列 $s_n$ 收敛于某个实数 $s$，则称级数 $sum_(n = 1)^oo a_n$ 收敛，并称 $s$ 为该级数的和，记作
  $
    sum_(n = 1)^oo a_n = s
  $
  若数列 $s_n$ 发散，则称该级数发散。
]

#strategy[级数收敛的判断][]
判断级数
$
  sum a_n
$
是否收敛时，不要一上来就套判别法，而应先识别它属于哪一类。一个实用的顺序是：

+ 先看必要条件：若 $a_n$ 不趋于 $0$，则级数必发散。
+ 先看部分和能否直接算出：若能把 $s_n = sum_(k = 1)^n a_k$ 写出来，就直接研究 $s_n$ 的极限；几何级数、望远镜级数通常属于这一类。
+ 若从某项起 $a_n >= 0$，把它当作正项级数处理：
  - 优先与标准模型比较，如 $sum q^n$、$sum 1/n^p$；
  - 同阶时用比较判别法或极限比较判别法；
  - 含有阶乘、幂次、指数时优先考虑比值判别法或根值判别法；
  - 含有积分型表达式时可考虑积分判别法。
+ 若符号交错或有振荡，先看绝对收敛：研究
  $
    sum |a_n|
  $
  是否收敛。若绝对收敛，则原级数一定收敛。
+ 若不绝对收敛，再看是否满足交错级数判别法：若
  $
    a_n = (-1)^(n - 1) b_n, quad b_n >= 0, quad b_n -> 0
  $
  且 $b_n$ 单调递减，则原级数收敛。
+ 若既不是正项级数，也不是标准交错级数，则尝试分部求和、Dirichlet判别法、Abel判别法，或先把通项作代数变形后再归入前面的类型。

一个更系统的口令可以记成：

+ 先看通项是否趋零
+ 再看部分和能否直接求
+ 再分正项、绝对值、交错三类
+ 最后才选比较、比值、根值、积分、Leibniz、Dirichlet、Abel等工具

常见对应关系如下：

+ $1/n^p$ 型：与 $p$ 级数比较。
+ $q^n$、$a^n$、$n!/a^n$ 型：优先比值或根值判别。
+ $1/(n ln n)$、$1/(n (ln n)^p)$ 型：优先积分判别或Cauchy凝聚判别。
+ $(-1)^n b_n$ 型：优先绝对收敛，再考虑Leibniz判别。
+ 可拆成
  $
    a_n = b_n - b_(n + 1)
  $
  型：优先看望远镜求和。


#theorem[级数收敛的必要条件][
  若级数
  $
    sum_(n = 1)^oo a_n
  $
  收敛，则
  $
    lim_(n -> oo) a_n = 0
  $
]

#example[几何级数][
  几何级数
  $
    sum_(n = 0)^oo q^n
  $
  当且仅当 $abs(q) < 1$ 时收敛，且此时
  $
    sum_(n = 0)^oo q^n = 1 / (1 - q)
  $
]

#example[望远镜级数][
  若
  $
    a_n = b_n - b_(n + 1)
  $
  则级数
  $
    sum_(n = 1)^oo a_n
  $
  的部分和为
  $
    s_n = b_1 - b_(n + 1)
  $
  因而该级数收敛，当且仅当数列 $b_n$ 收敛。
]

#theorem[正项级数的收敛判别][
  若 $a_n >= 0$，则级数
  $
    sum_(n = 1)^oo a_n
  $
  的部分和数列单调递增，因此该级数收敛，当且仅当它的部分和数列有上界。
]

#theorem[比较判别法][
  设从某项起有
  $
    0 <= a_n <= b_n
  $
  则
  + 若 $sum b_n$ 收敛，则 $sum a_n$ 收敛；
  + 若 $sum a_n$ 发散，则 $sum b_n$ 发散。
]

#theorem[极限比较判别法][
  设从某项起 $a_n > 0, b_n > 0$，且
  $
    lim_(n -> oo) a_n / b_n = l, quad 0 < l < oo
  $
  则级数 $sum a_n$ 与 $sum b_n$ 同敛散。
]

#theorem[$p$ 级数][
  级数
  $
    sum_(n = 1)^oo 1/n^p
  $
  当且仅当 $p > 1$ 时收敛。
]

#theorem[比值判别法][
  设从某项起 $a_n > 0$，且
  $
    lim_(n -> oo) a_(n + 1) / a_n = l
  $
  则
  + 当 $l < 1$ 时，级数 $sum a_n$ 收敛；
  + 当 $l > 1$ 时，级数 $sum a_n$ 发散；
  + 当 $l = 1$ 时，该判别法不能确定级数的敛散性。
]

#theorem[根值判别法][
  设从某项起 $a_n > 0$，且
  $
    lim_(n -> oo) root(n, a_n) = l
  $
  则
  + 当 $l < 1$ 时，级数 $sum a_n$ 收敛；
  + 当 $l > 1$ 时，级数 $sum a_n$ 发散；
  + 当 $l = 1$ 时，该判别法不能确定级数的敛散性。
]

#theorem[积分判别法][
  设函数 $f(x)$ 在 $[1, +oo)$ 上非负、连续、单调递减，且
  $
    a_n = f(n)
  $
  则级数
  $
    sum_(n = 1)^oo a_n
  $
  与反常积分
  $
    integral_1^oo f(x) dif x
  $
  同敛散。
]

#theorem[Cauchy凝聚判别法][
  设 $a_n >= 0$ 单调递减，则级数
  $
    sum_(n = 1)^oo a_n
  $
  与级数
  $
    sum_(n = 0)^oo 2^n a_(2^n)
  $
  同敛散。
]

#theorem[绝对收敛推出收敛][
  若级数
  $
    sum_(n = 1)^oo abs(a_n)
  $
  收敛，则级数
  $
    sum_(n = 1)^oo a_n
  $
  也收敛。
]

#theorem[Leibniz判别法][
  设 $b_n >= 0$，$b_n$ 单调递减，且
  $
    lim_(n -> oo) b_n = 0
  $
  则交错级数
  $
    sum_(n = 1)^oo (-1)^(n - 1) b_n
  $
  收敛。
]

#intuition[Dirichlet与Abel判别法][]
Dirichlet与Abel判别法处理的，都是那种既不完全是正项级数、也不容易直接看出绝对收敛的乘积级数
$
  sum a_n b_n
$
它们的共同思想是：把“振荡”与“衰减”分开看。

若 $a_n$ 自身带有振荡，但部分和 $A_n = sum_(k = 1)^n a_k$ 始终有界，那么这些振荡不会无限累积；这时只要再乘上一个单调趋于 $0$ 的 $b_n$，整体就会被逐步压住，这就是Dirichlet判别法。

而Abel判别法则是另一种稳定机制：若 $sum a_n$ 本身已经收敛，再乘上一个单调有界的 $b_n$，这种乘法不会破坏原有的收敛性。因此可以把Dirichlet理解为“有界振荡 + 衰减因子”，把Abel理解为“已收敛级数 + 温和权重”。

#theorem[Dirichlet判别法][
  设数列 $A_n = sum_(k = 1)^n a_k$ 有界，$b_n$ 单调趋于 $0$，则级数
  $
    sum_(n = 1)^oo a_n b_n
  $
  收敛。
]

#theorem[Abel判别法][
  若级数
  $
    sum_(n = 1)^oo a_n
  $
  收敛，且数列 $b_n$ 单调有界，则级数
  $
    sum_(n = 1)^oo a_n b_n
  $
  收敛。
]

= 上下极限和聚点

#motivation[为什么需要上下极限][]
研究数列时，经常会遇到这样一种情形：数列本身不收敛，但它并不是毫无规律地乱跳，而是在若干个值附近反复出现。此时，单纯问“极限是否存在”已经不够，我们还希望知道它最终可能靠近哪些值，以及它在长期行为中的“最高水平”和“最低水平”分别是什么。

上下极限正是为此引入的工具。它们刻画的是数列从某一项往后看所能达到的上边界与下边界的极限；聚点则描述数列可以通过某个子列真正逼近到的值。二者结合起来，就能把“不收敛但有结构”的数列描述清楚。

#definition[聚点][
  设数列 $a_n$ 与实数 $a$。若存在严格递增的正整数序列 $n_k$，使得
  $
    a_(n_k) -> a quad (k -> oo)
  $
  则称 $a$ 是数列 $a_n$ 的一个聚点，也称极限点。
]

#definition[上极限与下极限][
  对任意数列 $a_n$，定义
  $
    b_n = sup{a_k: k >= n}, quad c_n = inf{a_k: k >= n}
  $
  则 $b_n$ 单调递减，$c_n$ 单调递增。因此在扩充实数系中极限
  $
    lim_(n -> oo) b_n, quad lim_(n -> oo) c_n
  $
  总存在。称
  $
    overline(lim) a_n = lim_(n -> oo) b_n
  $
  为数列 $a_n$ 的上极限，称
  $
    underline(lim) a_n = lim_(n -> oo) c_n
  $
  为数列 $a_n$ 的下极限。
]

#intuition[上下极限的图像][]
对每个 $n$，$b_n$ 是“从第 $n$ 项往后看，所有项能达到的最高处”，$c_n$ 是“从第 $n$ 项往后看，所有项能达到的最低处”。随着 $n$ 增大，往后看的范围越来越小，因此最高处只会下降，最低处只会上升。

所以 $overline(lim) a_n$ 可以理解为“数列最终还能无限次逼近到的最高位置”，而 $underline(lim) a_n$ 则是“数列最终还能无限次逼近到的最低位置”。如果这两个值相等，说明数列的长期行为已经收缩到同一个数，这时数列就真正收敛了。

#theorem[上下极限的基本性质][
  设
  $
    b_n = sup{a_k: k >= n}, quad c_n = inf{a_k: k >= n}
  $
  则
  + $b_n$ 单调递减，$c_n$ 单调递增；
  + 对任意 $n$，有 $c_n <= a_n <= b_n$；
  + 总有
    $ underline(lim) a_n <= overline(lim) a_n $；
  + 若从某项起 $a_n <= d_n$，则
    $
      underline(lim) a_n <= underline(lim) d_n, quad overline(lim) a_n <= overline(lim) d_n
    $
  + 对任意两个数列 $a_n, d_n$，有
    $
      underline(lim) (a_n + d_n) >= underline(lim) a_n + underline(lim) d_n
    $
    以及
    $
      overline(lim) (a_n + d_n) <= overline(lim) a_n + overline(lim) d_n
    $
  + 有
    $
      overline(lim) (-a_n) = - underline(lim) a_n, quad underline(lim) (-a_n) = - overline(lim) a_n
    $
]

#proof[上下极限的基本性质][]
因为集合
$
  {a_k: k >= n + 1} subset.eq {a_k: k >= n}
$
所以它们的上确界满足
$
  b_(n + 1) <= b_n
$
下确界满足
$
  c_(n + 1) >= c_n
$
故 $b_n$ 单调递减，$c_n$ 单调递增。

又由于 $a_n in {a_k: k >= n}$，故对任意 $n$ 都有
$
  c_n <= a_n <= b_n
$
进而对任意 $n$ 都有 $c_n <= b_n$。令 $n -> oo$，便得到
$
  underline(lim) a_n <= overline(lim) a_n
$

若从某项起 $a_n <= d_n$，记
$
  beta_n = sup{d_k: k >= n}, quad alpha_n = inf{d_k: k >= n}
$
则当 $n$ 充分大时，对一切 $k >= n$ 都有 $a_k <= d_k$，于是
$
  c_n <= alpha_n, quad b_n <= beta_n
$
令 $n -> oo$，得到
$
  underline(lim) a_n <= underline(lim) d_n, quad overline(lim) a_n <= overline(lim) d_n
$

再设
$
  u_n = inf{a_k: k >= n}, quad v_n = inf{d_k: k >= n}
$
以及
$
  s_n = sup{a_k: k >= n}, quad t_n = sup{d_k: k >= n}
$
对任意 $k >= n$，都有
$
  a_k >= u_n, quad d_k >= v_n
$
故
$
  a_k + d_k >= u_n + v_n
$
从而
$
  inf{a_k + d_k: k >= n} >= u_n + v_n
$
令 $n -> oo$，便得
$
  underline(lim) (a_n + d_n) >= underline(lim) a_n + underline(lim) d_n
$

同理，由
$
  a_k <= s_n, quad d_k <= t_n
$
可得
$
  sup{a_k + d_k: k >= n} <= s_n + t_n
$
再令 $n -> oo$，得到
$
  overline(lim) (a_n + d_n) <= overline(lim) a_n + overline(lim) d_n
$

最后注意到对任意 $n$，有
$
  sup{-a_k: k >= n} = - inf{a_k: k >= n}, quad inf{-a_k: k >= n} = - sup{a_k: k >= n}
$
令 $n -> oo$，便得到
$
  overline(lim) (-a_n) = - underline(lim) a_n, quad underline(lim) (-a_n) = - overline(lim) a_n
$

#theorem[收敛与上下极限][
  数列 $a_n$ 收敛于 $a$，当且仅当
  $
    underline(lim) a_n = overline(lim) a_n = a
  $
]

#proof[收敛与上下极限][]
若 $a_n -> a$，则任意尾项组成的集合仍然全部靠近 $a$，因此它们的上确界与下确界也都趋于 $a$，从而
$
  overline(lim) a_n = a, quad underline(lim) a_n = a
$

反之，若
$
  underline(lim) a_n = overline(lim) a_n = a
$
记
$
  b_n = sup{a_k: k >= n}, quad c_n = inf{a_k: k >= n}
$
则 $b_n -> a, c_n -> a$。又对任意 $n$ 有
$
  c_n <= a_n <= b_n
$
由夹逼定理得 $a_n -> a$。

#theorem[有界数列的聚点与上下极限][
  设数列 $a_n$ 有界，记 $E$ 为它的全体聚点所成的集合，则
  $
    overline(lim) a_n = max E, quad underline(lim) a_n = min E
  $
]

#proof[有界数列的聚点与上下极限][]
设
$
  b_n = sup{a_k: k >= n}, quad c_n = inf{a_k: k >= n}
$
因为 $a_n$ 有界，所以 $b_n, c_n$ 都是有界单调数列，从而分别收敛。记
$
  beta = lim_(n -> oo) b_n = overline(lim) a_n, quad alpha = lim_(n -> oo) c_n = underline(lim) a_n
$

先证 $beta in E$。对每个 $n$，由上确界的定义，可取 $k_n >= n$ 使得
$
  a_(k_n) > b_n - 1/n
$
又因 $a_(k_n) <= b_n$，故
$
  b_n - 1/n < a_(k_n) <= b_n
$
令 $n -> oo$，便得 $a_(k_n) -> beta$，所以 $beta$ 是一个聚点。

再证它是最大的聚点。若 $x in E$，则存在子列 $a_(n_j) -> x$。对任意固定的 $n$，当 $j$ 充分大时有 $n_j >= n$，故
$
  a_(n_j) <= b_n
$
令 $j -> oo$ 得 $x <= b_n$。这对一切 $n$ 都成立，因此
$
  x <= lim_(n -> oo) b_n = beta
$
故 $beta = max E$。

同理可证 $alpha in E$，且对任意聚点 $x in E$ 都有 $x >= alpha$，于是
$
  alpha = min E
$

#example[上下极限与聚点的例子][
  对数列
  $
    a_n = (-1)^n
  $
  它有两个聚点 $-1$ 与 $1$，因此
  $
    overline(lim) a_n = 1, quad underline(lim) a_n = -1
  $

  对数列
  $
    a_n = (-1)^n + 1/n
  $
  它的聚点仍然是 $-1$ 与 $1$，故上下极限仍分别为 $-1$ 与 $1$。

  对收敛数列
  $
    a_n = 1/n
  $
  只有一个聚点 $0$，于是
  $
    overline(lim) a_n = underline(lim) a_n = 0
  $
]

= 正项级数

#motivation[为什么把正项级数单独拿出来][
  当 $a_n >= 0$ 时，部分和
  $
    s_n = sum_(k = 1)^n a_k
  $
  单调递增，所以正项级数的核心问题不再是“会不会上下振荡抵消”，而是“增长会不会被控制住”。

  因而研究正项级数时，重点通常落在两类信息上：一类是把它和某个已知级数比较，另一类是直接估计通项衰减的速度。d'Alembert判别法、Cauchy判别法、Raabe判别法与积分判别法，正是这两条思路中最常用的工具。
]

#strategy[正项级数的判别顺序][
  遇到正项级数
  $
    sum a_n
  $
  时，可按下面的顺序判断：

  + 先看能否与 $sum 1 / n^p$、$sum q^n$ 之类标准模型直接比较。
  + 若通项里有阶乘、指数，或容易写出 $a_(n + 1) / a_n$，优先用d'Alembert判别法。
  + 若通项整体被某个 $n$ 次方包住，优先看 $root(n, a_n)$，即Cauchy判别法。
  + 若比值极限恰好等于 $1$，再看它是否有
    $
      a_(n + 1) / a_n = 1 - p / n + o(1 / n)
    $
    这一类更细的展开，此时优先用Raabe判别法。
  + 若 $a_n = f(n)$，而 $f(x)$ 非负、连续、单调递减，则优先想到积分判别法。
]

#theorem[正项级数的基本准则][
  若 $a_n >= 0$，则级数
  $
    sum_(n = 1)^oo a_n
  $
  的部分和数列单调递增。因此它收敛，当且仅当部分和数列有上界。
]

#theorem[d'Alembert判别法][
  设从某项起 $a_n > 0$，且
  $
    lim_(n -> oo) a_(n + 1) / a_n = l
  $
  则
  + 当 $l < 1$ 时，级数 $sum a_n$ 收敛；
  + 当 $l > 1$ 时，级数 $sum a_n$ 发散；
  + 当 $l = 1$ 时，该判别法不能确定级数的敛散性。
]

#intuition[d'Alembert判别法在看什么][]
它本质上是在问：相邻两项的比例，最终像不像几何级数的公比。若
$
  a_(n + 1) / a_n < 1
$
并稳定落在某个小于 $1$ 的数附近，那么 $a_n$ 会像 $q^n$ 那样快速衰减，级数通常收敛；若这个比例最终大于 $1$，则通项根本不可能趋于 $0$。

#theorem[Cauchy判别法][
  设从某项起 $a_n > 0$，且
  $
    lim_(n -> oo) root(n, a_n) = l
  $
  则
  + 当 $l < 1$ 时，级数 $sum a_n$ 收敛；
  + 当 $l > 1$ 时，级数 $sum a_n$ 发散；
  + 当 $l = 1$ 时，该判别法不能确定级数的敛散性。
]

#intuition[Cauchy判别法与d'Alembert判别法的分工][]
这里的Cauchy判别法指根值判别法，它考察的是
$
  root(n, a_n)
$
所代表的“平均指数增长率”。因此当通项形如 $b_n^n$，或包含 $n$ 次幂、$n^2$ 次幂时，它往往比d'Alembert判别法更直接。不要把这里的Cauchy判别法与前面的Cauchy凝聚判别法混淆。

#theorem[Raabe判别法][
  设从某项起 $a_n > 0$，且
  $
    lim_(n -> oo) n (a_n / a_(n + 1) - 1) = p
  $
  则
  + 当 $p > 1$ 时，级数 $sum a_n$ 收敛；
  + 当 $p < 1$ 时，级数 $sum a_n$ 发散；
  + 当 $p = 1$ 时，该判别法不能确定级数的敛散性。
]

#intuition[Raabe判别法为什么能补上临界情形][]
当d'Alembert判别法得到的极限恰好是 $1$ 时，只知道相邻两项“差不多一样大”，还不足以判断级数敛散。Raabe判别法进一步比较这种“差不多”到底精确到什么程度。

若
$
  a_(n + 1) / a_n = 1 - p / n + o(1 / n)
$
那么它的临界行为就和 $1 / n^p$ 十分接近，所以门槛正好落在 $p = 1$。因此Raabe判别法可以看作d'Alembert判别法在极限等于 $1$ 时的细化版本。

#theorem[积分判别法][
  设函数 $f(x)$ 在 $[1, +oo)$ 上非负、连续、单调递减，且
  $
    a_n = f(n)
  $
  则级数
  $
    sum_(n = 1)^oo a_n
  $
  与反常积分
  $
    integral_1^oo f(x) dif x
  $
  同敛散。
]

#example[积分判别法的标准模型][
  对级数
  $
    sum_(n = 2)^oo 1 / (n (ln n)^p)
  $
  取
  $
    f(x) = 1 / (x (ln x)^p)
  $
  则
  $
    integral_2^oo 1 / (x (ln x)^p) dif x
  $
  收敛，当且仅当 $p > 1$。因此
  $
    sum_(n = 2)^oo 1 / (n (ln n)^p)
  $
  也当且仅当 $p > 1$ 时收敛。

  这说明：含有对数修正的正项级数，往往不是d'Alembert判别法或Cauchy判别法最擅长处理的对象，而更适合用积分判别法。
]

#example[几类典型通项如何选判别法][
  + $sum n! / 3^n$：阶乘与指数并存，优先用d'Alembert判别法。
  + $sum ((n - 1) / n)^(n^2)$：通项带有高次幂，优先用Cauchy判别法。
  + $sum 1 / (n (ln n)^2)$：比值与根值都容易落到极限 $1$，优先用积分判别法。
  + $sum 1 / n^p$ 或更一般地满足
    $
      a_(n + 1) / a_n = 1 - p / n + o(1 / n)
    $
    的级数，优先想到Raabe判别法。
]
