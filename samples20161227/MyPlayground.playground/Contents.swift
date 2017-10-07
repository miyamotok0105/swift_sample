//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


print("============================================")


let val = 10032
var i = 1, mask = 2
while mask <= val {
    mask <<= 1       // maskを1ビットずらす
    i += 1
} // ループを出た時のiが、求めるビット数

print(i)

print("============================================")

// コラッツの問題
var n = 7
repeat {
    print("\(n) ", terminator:"")
    if n % 2 == 0 {
        n /= 2
    }else {
        n = n * 3 + 1
    }
}while n > 1
print(n)

print("============================================")

// 九九の表
for i in 1 ..< 10 {
    var line = ""                    // １行分の文字を蓄える
    for j in 1 ..< 10 {
        let n = i * j                // varではなくletでよい
        if n < 10 { line += " " }    // 文字列を連結
        line += " \(n)"
    }
    print(line)
}

print("============================================")
// for-in + where節の例
for i in 1..<64 where i % 3 != 0 && i % 8 != 0 {
    print(i, terminator:" ")
}
print("")

for i in 1..<64 { // 最終値を含まない
    print(i, terminator:" ")
}

var d_array = [0]
for i in 1...64 {
    d_array.append(i)
    d_array += [i] //appendでも、どっちでもOK
}
print(d_array)


print("============================================")
// トランプの数札
for n in 2...10 {
    for s in ["♠", "♡", "♣", "♢"] {
        print(" \(s)\(n)", terminator:"")
    }
    print("")
}

print("============================================")
// ひと月のカレンダーを表示する
let days = 31                 // １か月の日数
let firstDay = 2              // １日目の曜日（0:日曜）
var w = 0                     // 曜日のための変数
while w < firstDay {          // 月初めに空白を入れる
    print("    ", terminator:"")    // 改行しない
    w += 1
}
var d = 1                     // 日にちを示す変数
loop: while true {
    while w < 7 {
        let pad = d < 10 ? " " : ""      // １桁の場合の詰め物
        print(pad + "  \(d)", terminator:"")
        w += 1
        d += 1
        if d > days {         // 月末になったら
            print("")         // 改行する
            break loop        // 外側のループから脱出
        }
    }
    print("")                 // 週の終わり
    w = 0                     // 曜日を日曜に戻す
}

print("============================================")
// ４で割り切れ、かつ100で割り切れないか400で割り切れる年
for year in [ 1996, 2000, 2017, 2020, 2100, 2400 ] {
    
    leap: if year % 4 == 0 {
        if year % 100 == 0 {
            if year % 400 == 0 {
                print("\(year)年は400で割り切れるのでうるう年です。")
                break leap
            }
            print("\(year)年は100で割り切れるのでうるう年ではありません。")
            break leap
        }
        print("\(year)年は4で割り切れるのでうるう年です。")
    }else {
        print("\(year)年は4で割り切れないのでうるう年ではありません。")
    }
    
}

print("============================================")
// 自然対数の底の計算
var e = 0.0, t = 1.0
for i in 1 ... 20 {
    e += t
    t /= Double(i)      // ループを回るたびに 1/i! が計算される
}
print("e=\(e)")

print("============================================")
// 最初の 20個の素数を表示する
let number = 20
var primes = [ 2 ];            // 整数の配列
print(" 2", terminator:"")
var n2 = 3                      // nが素数かどうか調べる
while primes.count < number {  // 配列の要素数が numberより少ない
    //scanラベル！！
    scan: do {                 // ラベル付きのdo文
        for i in primes {      // 素数列から１つずつ取り出す
            if n2 % i == 0 {    // 割り切れたら n は素数ではない
                break scan     // do文から抜ける
            }
        }
        primes.append(n2)       // for-inループを終えたらnは素数
        print(" \(n2)", terminator:"")
    }
    n2 += 2                     // 調べるのは奇数だけ
}
print("")

print("============================================")
let width = 10.5, height = 9.25, kind = "Rect"
print(width)
print(height)
print(kind)
var pack: Int = 0, x, y: Int, ram, rem: Double
x = 20;    print(x)
ram = 0.9; print(ram)

let name : String = "C. Alcott"
let age = 2014 - 1997
print(name)
print(age)

let myName = "E. Mably"; var myAge = 17
print(myName)
print(myAge)

print("============================================")
let name2 = "那須原"
let msg = "こんにちは、" + name2 + "さん。"
print(msg)

var homework = "理科"
homework += "「夜空の観察」"    // homework = "理科「夜空の観察」"
print(homework)

let specialKeys = "command=\u{2318}, option=\u{2325}"
print(specialKeys)

let n3 = 8
let str2 = "\(n3)の2乗は\(n3*n3)です。"
print(str2)

print(6, 2014, "林檎")

print(6, 2014, "林檎", separator:"; ")

print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")
print("============================================")