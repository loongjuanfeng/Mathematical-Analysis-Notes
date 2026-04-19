#import "../../libs.typ": *

#show: ilm.with(
  title: [Mathematical Analysis],
  date: datetime.today(),
  author: "Junfeng Lve",
  abstract: [Exercise/Extra notes on Chapter 10 of _数学分析_，陈纪修.],
)
#show: setup

= 判断函数列一致收敛

#strategy[类定义][]
$
  forall epsilon > 0, exists N in NN, forall n > N, x in D, \
  abs(f_n (x) - f(x)) < epsilon \
  arrow.t.b.double "equal" \
  d_n := sup_(x in D) {abs(f_n (x) - f(x))} -> 0 quad (n -> oo)
$

#strategy[分离 $N$][]
$
  forall epsilon_0 > 0, N(x) := min_(N in NN) {abs(f_n (x) - f(x)) < epsilon_0, forall n > N}, sup_(x in D) N(x) < +oo
$

#strategy[Cauchy][]
$
  forall epsilon > 0, exists N in NN, forall n, m > N, sup_(x in D) {abs(f_n (x) - f_m (x))} < epsilon
$

#method[求导][]
对 $f_n (x) - f(x)$ 求导之后得到极值点 $x_n$，带入得到 $sup_(x in D) {abs(f_n (x) - f(x))} = abs(f_n (x_n) - f(x_n))$，然后只需要研究数列的收敛性了。（类似于M判别法，但是是通过导数求出精确上界，在函数比较简单的时候使用）


#method[Dini定理][]
若 $f_n, f$ 在紧集 $D$ 上连续，$f_n -> f$ 逐点，且对每个 $x in D$，$f_n (x)$ 关于 $n$ 单调，则 $f_n$ 在 $D$ 上一致收敛于 $f$。

= 判断函数列不一致收敛

#strategy[定义取反][]
$
  exists {x_n}_(n = 1)^oo subset D, abs(f_n (x_n) - f(x_n)) arrow.not 0
$

#strategy[分离 $N$][]
$
  exists epsilon_0 > 0, N(x) := min_(N in NN) {abs(f_n (x) - f(x)) < epsilon_0, forall n > N}, sup_(x in D) N(x) = +oo
$

#strategy[Cauchy取反][]
$
  exists epsilon_0 > 0, forall N in NN, exists n, m > N, \
  sup_(x in D) {abs(f_n (x) - f_m (x))} >= epsilon_0
$

= 判断函数项级数一致收敛

#method[Abel判别法][]
若 $sum u_n (x)$ 在 $D$ 上一致收敛，$a_n (x)$ 关于 $n$ 单调且一致有界（$exists M, forall n, x: abs(a_n (x)) <= M$），则 $sum a_n (x) u_n (x)$ 在 $D$ 上一致收敛。

#method[Dirichlet判别法][]
若 $sum u_n (x)$ 的部分和一致有界，$a_n (x)$ 关于 $n$ 单调且一致趋于零（$sup_(x in D) abs(a_n (x)) -> 0$），则 $sum a_n (x) u_n (x)$ 在 $D$ 上一致收敛。
