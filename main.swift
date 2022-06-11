private let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    private let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    func intToRoman(_ num: Int) -> String {
        
        var int = num
        var sym = ""
        
        while int > 0 {
            for (i, d) in values.enumerated() where int - d >= 0 {
                int -= d
                sym += symbols[i]
                break
            }
        }
        return sym
    }

print(intToRoman(1994))
