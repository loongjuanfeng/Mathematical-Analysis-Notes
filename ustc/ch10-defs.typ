#import "../../libs.typ": *
#import "../syms.typ": *

#show: ilm.with(
  title: [Mathematical Analysis],
  date: datetime.today(),
  author: "Junfeng Lve",
  abstract: [Study notes on Chapter 10 of _数学分析教程_，史济怀.],
)
#show: setup

#definition[重积分][

  设有界点集 $D subset RR^n$，函数 $f: D -> RR$ Riemann可积。对 $D$ 的划分 $pi$ 有其宽度为 $lambda := norm(pi) = max_i {diam(I_i)}$。则重积分为
  $
    integral_D f(vc(x)) dif sigma := lim_(lambda -> 0^+) sum_(i = 1)^k f(xi_i) sigma(I_i)
  $
  / 被积函数: $f$
  / 积分区域: $D$
]

#theorem[重积分的线性性][

  $a, b$ 为常数，$f, g: D -> RR$ Riemann可积。则有
  $
    integral_D (a f + b g) dif sigma = a integral_D f dif sigma + b integral_D g dif sigma
  $
]

#theorem[重积分的保序性][

  $f, g: D -> RR$ Riemann可积。$forall vc(x) in D, f(vc(x)) > g(vc(x))$ 则有
  $
    integral_D f dif sigma > integral_D g dif sigma
  $
]

#definition[积分和][

  $f: D -> RR$，有
  / 积分和:
    $
      S(f, pi) = sum_(i = 1)^k f(vc(xi)_i) sigma(I_i)
    $
  / 积分上和:
    $
      overline(S)(f, pi) = sum_(i = 1)^k sup f(I_i) sigma(I_i)
    $
  / 积分下和:
    $
      underline(S)(f, pi) = sum_(i = 1)^k inf f(I_i) sigma(I_i)
    $

    我们有
    $
      underline(S)(f, pi) <= S(f, pi) <= overline(S)(f, pi)
    $
]

#theorem[细分][

  在细分操作之下，大和不增，小和不减。
]

#definition[上/下积分][

  / 上积分:
    $
      overline(integral)_D f dif sigma := lim_(norm(pi) -> 0^+) sum_(i = 1)^k sup f(I_i) sigma(I_i)
    $
  / 下积分:
    $
      underline(integral)_D f dif sigma := lim_(norm(pi) -> 0^+) sum_(i = 1)^k inf f(I_i) sigma(I_i)
    $
]

#definition[可积性判断][

  $f: D -> RR$ Riemann可积的充分必要条件是
  $
    overline(integral)_D f dif sigma = underline(integral)_D f dif sigma
  $
  也是
  $
    lim_(norm(pi) -> 0^+) omega_i sigma(I_i) = 0, quad omega_i = (sup - inf) f(I_i)
  $
]
