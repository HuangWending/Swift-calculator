# Swift-calculator
Swift计算器程序
import Foundation
这是导入Foundation框架，它包含了许多Swift标准库中常用的功能和类型。
func calculate(_ expression: String) -> Double? {
这是定义了一个名为calculate的函数，它接受一个字符串表达式作为参数，并返回一个可选的Double类型结果。
let expression = expression.replacingOccurrences(of: " ", with: "")
这行代码用于移除表达式中的空格，使用replacingOccurrences方法将空格替换为空字符串。
let expressionArray = Array(expression)
将表达式字符串转换为字符数组，方便逐个处理每个字符。
var operandStack = [Double]()
var operatorStack = [Character]()
这里定义了两个栈，operandStack用于存储操作数，operatorStack用于存储操作符。
let operators: Set<Character> = ["+", "-", "*", "/"]
定义了一个包含四种运算符的字符集合。
let precedence: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]
定义了一个字典，用于设置每个操作符的优先级。
func performOperation() {
    // ...
}
定义了一个名为performOperation的函数，用于执行栈顶的运算操作。
  for char in expressionArray {
    // ...
}
遍历表达式中的每个字符，进行操作数和操作符的处理。
  if let digit = Double(String(char)) {
    operandStack.append(digit)
}
如果当前字符是一个数字，将其转换为Double类型并压入操作数栈中。
  else if operators.contains(char) {
    // ...
}
  如果当前字符是一个操作符，则根据优先级进行运算符的处理。
  while let topOperator = operatorStack.last, operators.contains(topOperator),
      let precedence1 = precedence[char], let precedence2 = precedence[topOperator], precedence1 <= precedence2 {
    performOperation()
}
循环判断栈顶的操作符与当前操作符的优先级，如果当前操作符的优先级小于等于栈顶操作符的优先级，执行运算。
        operatorStack.append(char)
     将当前操作符压入操作符栈中。
while !operatorStack.isEmpty {
    performOperation()
}
   在处理完所有的操作数和操作符之后，确保栈中剩余的操作符也进行相应的运算。
 return operandStack.last
   返回操作数栈最后的结果，即最终的计算结果。
   print("请输入一个数学表达式：")
if let expression = readLine() {
    if let result = calculate(expression) {
        print("结果：\(result)")
    } else {
        print("无效的表达式")
    }
}
   提示用户输入一个数学表达式，并调用calculate函数进行计算，最后打印出结果或无效表达式的提示。                                                                                    
