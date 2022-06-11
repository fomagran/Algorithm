/*

we have a index

P 0
A 1
Y 2
P 3

if we get the 3 index

and we gonna reverse that

P  I
A L
YA
P

if we get the zero index

and we gonna plus that equal index line

we need numRows string

if numrows is 4

we need

str0, str1, str2, str3

P 0 str0 + P
A 1 str1 + A
Y 2 str2 + Y
P 3 str3 + P

A 2 str2 + A str2 is YA
L 1 str1 + L str1 is AL
I 0 str0 + I str0 is PI

... until we get the string's length

return str0 + str1 + str2 + str3

time Complexity = O(n)


*/

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows == 1 { return s}
      let stringMap:[Character] = s.map{$0}
      var strings:[String] = Array(repeating:String(),count:numRows)
      var index:Int = 0
      var isReversed:Bool = false
      for c in stringMap {
          if index == 0 {
              isReversed = false
          }else if index == numRows-1 {
              isReversed = true
          }
          strings[index] += String(c)
          index += isReversed ? -1 : 1
      }
      return strings.reduce("",+)
  }

print(convert("PAYPALISHIRING", 2))
