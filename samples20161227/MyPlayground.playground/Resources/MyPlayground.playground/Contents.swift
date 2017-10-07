//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var a = 2.0
"\(a)の平方根は\(sqrt(a))です"
"円周率は\(atan(1.0)*4.0)です"
getuid()

var e = 0.0, t = 1.0
for i in 1 ... 20 {
    e += t
    t /= Double(i)
}
print("e=\(e)")
