import Foundation

func calculate(_ expression: String) -> Double? {
    let expression = expression.replacingOccurrences(of: " ", with: "") // 移除空格
    let expressionArray = Array(expression)
    var operandStack = [Double]()
    var operatorStack = [Character]()
    let operators: Set<Character> = ["+", "-", "*", "/"]
    let precedence: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]
    
    func performOperation() {
        if let operatorChar = operatorStack.popLast(), let b = operandStack.popLast(), let a = operandStack.popLast() {
            switch operatorChar {
            case "+":
                operandStack.append(a + b)
            case "-":
                operandStack.append(a - b)
            case "*":
                operandStack.append(a * b)
            case "/":
                operandStack.append(a / b)
            default:
                break
            }
        }
    }
    
    for char in expressionArray {
        if let digit = Double(String(char)) {
            operandStack.append(digit)
        } else if operators.contains(char) {
            while let topOperator = operatorStack.last, operators.contains(topOperator),
                  let precedence1 = precedence[char], let precedence2 = precedence[topOperator], precedence1 <= precedence2 {
                performOperation()
            }
            operatorStack.append(char)
        }
    }
    
    while !operatorStack.isEmpty {
        performOperation()
    }
    
    return operandStack.last
}

print("请输入一个数学表达式：")
if let expression = readLine() {
    if let result = calculate(expression) {
        print("结果：\(result)")
    } else {
        print("无效的表达式")
    }
}
