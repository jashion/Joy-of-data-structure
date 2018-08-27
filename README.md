# Joy-of-data-structure
大话数据结构

>大部分内容来自于《大话数据结构》，代码全部使用Swift实现。至于为什么抽风写这个？😊你懂的。
# 一. 数据结构一些重要定义
理解数据结构之前，先来了解一些重要的概念以及这些概念之间的关系。
### （1）数据
>数据：可以被计算机理解和处理的描述客观事物的符号集。

几个特征：

- 可以输入计算机
- 可以被计算机处理
- 符号集 

比如：整型，字符串等等。都可以满足上面上个条件。
那么？图像，声音算不算数据。答案肯定算，图像，声音这种客观事物，在计算机中转化成二进制来储存，所以，满足上面的条件。

### （2）数据的组成结构
![DataStructure.png](https://upload-images.jianshu.io/upload_images/968977-ccee5eeaf943ff96.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
>数据元素：数据里面具有一定意义的基本单位。

把人类比做数据，那么，数据元素就是人的单独个体。

>数据项：数据项是数据不可分割的最小单位。

如果数据元素比做人，那么，数据项可以是组成人的各种器官，眼，鼻，耳，嘴等等，也可以是年龄，性别，姓名等等。

>数据对象：性质相同的数据元素的集合，是数据的子集。

性质相同，那就好理解了，比如：兴趣相同的人组成的群体或者90后群体等等。

### （3）数据结构
了解到数据其实就是符号集，那么？数据结构是个什么东东？顾名思义，数据结构就是数据的组织形式。类比建筑工程里面的设计结构。

>数据结构：数据结构就是数据之间的组织形式。

打个比方：假如你有1000个苹果，你会怎么储存？
```
一种方案：找一个足够大的储存室，把苹果放在一排
一种方案：100个苹果放一排，总共放10排
一种方案：100个苹果放在底部，上面再叠10层
...
```
上面N中方案都是处理这个1000个苹果的思路，怎么存放涉及到整个架构的设计，好比数据结构就是解决数据之间的组织结构问题的科学。

#### 数据结构分类
![DataStructure2.png](https://upload-images.jianshu.io/upload_images/968977-6f0cc647a06db722.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 逻辑结构：数据对象中的数据元素之间的逻辑关系

集合结构：集合结构中的数据元素除了同属一个集合外，没有其他关系。
线性结构：线性结构中的数据元素之间是一对一的关系。
树形结构：树形结构中的数据元素之间是一对多的关系。
图形结构：图形结构中的数据元素之间是多对多的关系。

- 物理机构：数据的逻辑结构在计算机中的储存形式

顺序储存结构：把数据元素储存在连续的存储单元。
链式储存结构：把数据元素储存在任意的存储单元（可以是连续或者不连续）。

### （4）数据类型 VS 抽象数据类型 VS  数据结构
数据类型：是指一组**性质相同**的值的集合以及定义在此集合伤的一些**操作**的总称。
C语言数据类型分类：
- 原子类型： 基本类型，比如：整型，字符型等。
- 结构类型： 组合类型，比如：结构体等。

抽象数据类型：是指**数据类型**的**数学抽象模型**以及定义在该模型上的一组**操作**（抽象数据类型不仅仅指已定义并实现的数据类型，还可以是自定义的数据类型。）。
```
抽象数据类型的格式：
ADT 抽象数据类型名称
Data 
        数据元素之间的逻辑关系的定义
Operation
        操作1
        操作2
            ...
        操作N
EndADT
```
#### 数据类型 VS 抽象数据类型
数据类型是抽象数据类型的逻辑和物理上的具体实现，抽象数据类型则负责定义数据类型上具有普遍性的逻辑关系以及相关的一组操作。比如说：整型，抽象数据类型的整型是指整型具有的普遍特性，比如拥有加减乘除的操作，但是并不涉及到整型在每种语言的具体实现或者不同的操作系统储存不一样等等；涉及到物理上的具体实现则表示为数据类型。类比**类和接口**。

#### 抽象数据类型 VS 数据结构
抽象数据类型强调的是数据的逻辑性，而数据结构则强调的是数据元素之间的组织形式，其中包括逻辑结构和物理结构。两者并没有所谓的包含关系，但是有交集，可以理解为数据结构已经站在更高的层次统筹数据的合理组织像是，而抽象数据类型还停留在数据层面，比数据类型更高一层，更具有普遍性的抽象。
```
类比：
数据类型 -> 类
抽象数据类型 -> 接口
数据结构 -> 一个装着类的实例的数组
```
# 二. 线性表
>线性表：零个或者多个数据元素的有限序列。

性质：
- 数据元素可以为空
- 数据元素有限
- 数据元素之间的逻辑结构为线性结构，也就是一对一的关系
- 数据元素类型相同
```
举个例子：
白羊 -> 金牛 -> 双子 -> 巨蟹 -> 狮子 -> 处女 -> 天秤 -> 射手 -> 摩羯 -> 水平 -> 双鱼

线性表的抽象数据类型：
ADT 线性表（List）
Data
      线性表的数据对象集合为{a1, a2, ......, an}，每一个元素的类型都是DataType。其中，除第一个元素a1外，每一个元素有且仅有一个直接前驱元素，除了最后一个元素an外，每一个元素有且仅有一个直接后续元素。数据元素之间的关系是一对一的关系。
Operation
       count：线性表元素个数。
       first：头指针。
       last：尾指针。
       isEmpty()：若线性表为空，返回true，否则返回false。
       remove()：将线性表清空
       node(i)：将线性表中的第i个位置的元素返回。
       insert(data,i)：在线性表中的第i个位置插入新数据data。
EndADT
```
线性表根据在计算机的储存方式可以分为两种：
- 顺序线性表
- 链式线性表

### 顺序线性表
>顺序线性表：使用一段连续的地址存储单元放置线性表的数据元素。

举个例子：数组。
```
顺序线性表的优缺点：
优点：
- 可以快速获取下标的数据元素，时间复杂度为O(1)
- 逻辑关系是一对一的关系，连续存储单元足以储存，不需要增加额外的存储空间

缺点：
- 插入和删除操作需要移动大量的元素，时间复杂度为O(n)
- 线性表的存储空间大小难以确定，并且不好扩展
- 造成存储空间碎片
```

### 链式线性表
>链式线性表：线性表的数据元素可以存储在随意的存储单元，每一个节点不仅仅包括数据元素还有一个指向下一个节点的指针（基本的单链表）。

链式（单链表）和顺序线性表优缺点对比：
```
存储分配方式：
- 顺序 -> 一段地址连续的存储空间
- 链式 -> 任意地址存储空间

时间性能：
- 查找
  顺序 -> O(1)
  链式 -> O(n)
- 插入和删除
  顺序 -> O(n)
  链式 -> 寻找相应的节点，时间复杂度为O(n)，然后，插入和删除为O(1)

空间性能：
- 顺序 -> 需要提前分配存储空间，分配大了，浪费空间，分配小了，容易发生上溢
- 链式 -> 不需要提前分配空间，只要有存储空间分配就行，数据元素个数只受可分配存储空间大小的限制
```

总结：
（1）若线性表需要频繁查找，很少进行插入和删除操作时，使用顺序存储结构；反之，使用链式存储结构。
（2）如果提前知道线性表需要的存储空间，可以使用顺序结构；如果不知道线性表中的数据元素变化有多大，即不确定需要多大的存储空间，则使用链式存储结构。

链式线性表的基本分类：
- 单向链表 
- 静态链表 -> 使用顺序结构实现链式线性表
- 双向链表 -> 每个节点除了数据元素，还包含一个指向上一个节点的指针和一个指向下一个节点的指针
- 循环链表 -> 线性表的尾部指向头节点，形成一个闭环

下面具体讲解双链表的Swift实现，其他的链表实现可以参考《大话数据结构》或者自行Googel/Baidu。
>双向链表：在单链表的基础上，每个节点加一个指向上一个节点的指针。

节点定义：
```
public class LinkedListNode<T> {
    var data: T  //Data could not be nil.
    var previous: LinkedListNode?  //The pointer to previous node.
    var next: LinkedListNode?  //The pointer to next node.
    init(_ data: T) {
        self.data = data
    }
}
```
双向链表：
```
public enum ErrorStatus {
    case Error(message: String)
    case OK
}

public class DoubleLinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?  //Head node of link list.
    
    public var isEmpty: Bool {  //If link list has no data, return true.
        return head == nil
    }
    
    public var first: Node? {  //Get first node is the head of link list.
        return head
    }
    
    public var last: Node? {  //Last node of link list.
        ...
        return node
    }
    
    public var count: Int {  //Retrun link list's nodes count.
        ...
        return count
    }
    
    public func node(atIndex index: Int) -> Node? {  //Get node with index
        ...
        return node
    }
    
    public func appendData(data: T) {  //Append data to link list tail
        ...
    }
    
    public func insert(data: T, atIndex index: Int) -> ErrorStatus {  //Insert data at index
        guard index >= 0, index <= count else {
            return ErrorStatus.Error(message: "Index is out of range!")
        }
        let newNode = Node(data)
        if index == 0 {
            if let node = first {
                head = newNode
                newNode.next = node
                node.previous = newNode
            } else {
                head = newNode
            }
        } else {
            let node = self.node(atIndex: index-1)
            let nextNode = self.node(atIndex: index)
            node?.next = newNode
            newNode.previous = node
            newNode.next = nextNode
            nextNode?.previous = newNode
        }
        return ErrorStatus.OK
    }
    
    public func remove(atIndex index: Int) -> (T?, ErrorStatus) {  //Remove node at index
        guard !isEmpty else {
            return (nil, ErrorStatus.Error(message: "Link list is Empty!"))
        }
        
        guard index >= 0, index < count else {
            return (nil, ErrorStatus.Error(message: "Index is out of range!"))
        }
        
        let node = self.node(atIndex: index)
        let nextNode = self.node(atIndex: index+1)
        if index == 0 {
            head = nextNode
        } else {
            let beforeNode = self.node(atIndex: index-1)
            beforeNode?.next = nextNode
            nextNode?.previous = beforeNode
        }
        return (node?.data, ErrorStatus.OK)
    }    
}
```
⚠️注意：
这里的head指向第一个有数据的节点，有的线性表会生成一个头节点，该节点不存储任何数据或者只存储该链表的长度，该节点指向第一个有数据的节点。这样做的好处就是，第一个节点的删除和插入操作和其他节点保持一致。

下面主要解释一下，插入和删除操作：
- **insert**
```
public func insert(data: T, atIndex index: Int) -> ErrorStatus {  //Insert data at index
    guard index >= 0, index <= count else {
        return ErrorStatus.Error(message: "Index is out of range!")
    }
    let newNode = Node(data)
    if index == 0 {
        if let node = first {
            head = newNode
            newNode.next = node
            node.previous = newNode
        } else {
            head = newNode
        }
    } else {
        let node = self.node(atIndex: index-1)
        let nextNode = self.node(atIndex: index)
        node?.next = newNode
        newNode.next = nextNode
        newNode.previous = node
        nextNode?.previous = newNode
    }
    return ErrorStatus.OK
}
```
1.先判断需要插入数据的index是否在[0, count]的范围之内，注意这里是方括号，也就是包含边界，因为线性表最前面和最后面都可以插入新的数据。
2.生成新节点。
3.因为这里的双向链表没有采取头节点的方式实现，所以，插入第一个节点和其他节点有点不一样，需要做一些判断。
4.如果是插入第一个节点，则判断如果该链表为空，则直接设置head=newNode；如果该链表不为空，则将一个节点赋值给node，然后将newNode赋值给head，接着将node赋值给newNode.next，最后设置node.previous=newNode。
5.如果不是插入一个节点，则先获取下标为index-1的节点node，然后获取下标为index的节点nextNode。设置node.next=newNode，然后newNode.next=nextNode，连成一条指向下一个数据元素的链，最后设置newNode.previous=node和nextNode.previous=newNode连上指向上一个数据元素的链，自此，先的数据插入成功。

- **remove**
无论insert还是remove都是先拆链，然后再组合成新的数据链。
```
public func remove(atIndex index: Int) -> (T?, ErrorStatus) {  //Remove node at index
    guard !isEmpty else {
        return (nil, ErrorStatus.Error(message: "Link list is Empty!"))
    }
    
    guard index >= 0, index < count else {
        return (nil, ErrorStatus.Error(message: "Index is out of range!"))
    }
    
    let node = self.node(atIndex: index)
    let nextNode = self.node(atIndex: index+1)
    if index == 0 {
        head = nextNode
    } else {
        let beforeNode = self.node(atIndex: index-1)
        beforeNode?.next = nextNode
        nextNode?.previous = beforeNode
    }
    return (node?.data, ErrorStatus.OK)
}
```
1.先判断是否是空链，如果是则返回，否则再判断需要删除数据的小表是否在合理范围内，如果不是则返回。
2.判断index是否等于0，如果是，则直接将head=secondNode。
3.获取beforeNode和nextNode，然后将beforeNode.next=nextNode，nextNode,previous=beforeNode，自此，下标为index的节点，没有任何对象指向它，在当前函数域外就外被系统回收掉。
# 三. 栈与队列
>栈：限定在表尾进行插入和删除的线性表。

栈是一种LIFO(Last In First Out)的线性表，也就是数据元素遵循后进先出的原则。

栈的抽象数据类型：
```
ADT 栈(Stack)
Data
      具有线性表一样的性质。
Operation
      top：获取栈顶元素
      count：栈的长度
      isEmpty：栈内元素是否为空
      push(data)：元素进栈
      pop()：元素出栈
      removeAll()：清空栈内元素
EndADT
```
按栈的存储结构分类：
- 栈的顺序存储结构
  单栈
  共享栈
- 栈的链式存储结构

共享栈：
两个顺序栈共享存储空间，栈1的栈顶在下标0处，栈2的栈顶在下标n-1处。
```
栈的顺序结构和链式结构区别：
1.顺序结构需要预先估算存储空间大小，适合数据元素变化不大的情况
2.链式结构不需要预先估算存储空间，适合数据元素变化较大的情况
```
栈的链式结构实现：
```
public struct Stack<T> {
    private var stackData: [T] = []
    
    public var count: Int {
        return stackData.count
    }
    
    public var top: T? {
        if isEmpty {
            return nil
        } else {
            return stackData.last
        }
    }
    
    public var isEmpty: Bool {
        return stackData.isEmpty
    }
    
    public mutating func push(data: T) {
        stackData.append(data)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return stackData.removeLast()
        }
    }
    
    public mutating func removeAll() {
        stackData.removeAll()
    }
    
    public func printAllData() {
        for item in stackData {
            print(item)
        }
    }
}
```
上面的代码写的非常清楚，一目了然，这里就不费口舌了。
##### 栈较之线性表有什么特别作用？😊
栈和线性表的不同之处在于，栈只有进栈和出栈操作，并且遵循后进先出的规则，也就是说数据元素顺序进栈，逆序出栈。嘿嘿，栈可以实现回退操作，递归和四则运算等等。
- **递归**
`听说过斐波那契数列吗？😏没错就是兔子繁殖🐰：`

| 所经过的月数 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
| :----------------- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 兔子对数        | 1 | 1 | 2 | 3 | 5 | 8 | 13 | 21 |
以月数为自变量，兔子的对数为因变量，则它们之间的关系为：
```
F(0) = 0, n=0
F(1) = 1, n=1
F(n) = F(n-1) + F(n-2), n>1
```
下面使用常规的方法解决这个问题：
```
func rabbitNumbers() {
    //After 40 months
    var r0 = 0
    print("rabbit: \(r0)")
    var r1 = 1
    print("rabbit: \(r1)")
    var r: Int = 0
    for _ in 2..<40 {
        r = r0 + r1
        print("rabbit: \(r)")
        r0 = r1
        r1 = r
    }
}
```
再者使用递归解决这个问题：
```
func rabbitNumbers(months n: Int) -> Int {
    if n < 2 {
        return n
    }
    return rabbitNumbers(months: n-1)+rabbitNumbers(months: n-2)
}

for i in 0..<40 {
    let rabbits = rabbitNumbers(months: i)
    print("rabbit: \(rabbits)")
}
```
比较一下前面两个的差异：
```
常规方法：
    使用一个迭代的方式，计算出结果。不需要反复调用函数，浪费内存。但是，相对于递归来说，没有那么简洁。
递归：
    递归就需要不断调用函数，建立函数副本，消耗大量的内存。但是，相对于常规方法，代码简洁易懂。
```
`为什么说递归是栈的应用呢？`
递归在执行的时候，需要不断的调用自身，直到可以返回确定的值，然后，又从最后面的一层，一层层往回调，直到最上一层，这个两个操作正好对应着栈的压栈和出栈的操作。其实，编译器也是这样干的，在前行阶段，对于每一层递归，函数的局部变量，参数值和返回地址都压进栈；在退回阶段，位于栈顶的局部变量，参数值以及返回地址都被弹出，用于返回调用层次中执行代码的剩余部分，恢复调用状态。
- **四则运算**
四则运算就有意思了。自己用笔和纸算数学题知道怎么做，但是计算机呢？怎么算加减乘除的？毕竟计算机只能识别0和1。😊

一般手动计算数学题我们用的是中缀表达法（符号在需要运算的数字中间）：
```
9 + (3 - 1) * 3 + 10 / 2
```
计算机运算需要用到的后缀表达法（去调括号，符号在需要运算的数字后面）：
```
9 3 1 - 3 * + 10 2 / +
```
所以？怎么得到后缀表达式呢？利用栈：
```
规则：
1.遇到数字，直接输出
2.遇到左括号进栈
3.遇到右括号执行出栈操作，直到弹出左括号，左括号和右括号不输出
4.遇到其他操作符，则判断其与栈顶操作符的优先级，如果其优先级（<=）栈顶操作符，则栈顶元素依次出栈，该操作符进栈
5.直到最后，将栈中的元素依次输出

enum OperationPriority: String {
    case multi = "*"
    case divide = "/"
    case add = "+"
    case sub = "-"
    
    var intValue: Int {
        switch self {
        case .multi,.divide:
            return 1
        case .add, .sub:
            return 0
        }
    }
}

func suffixExpFromMiddleExp(exps: Array<String>) -> Array<String>{
    var suffixExp: [String] = Array()
    var stack = Stack<String>()
    let predicate = NSPredicate.init(format: "SELF MATCHES %@", "^[0-9]*$")
    for value in exps {
        if predicate.evaluate(with: value) {
            suffixExp.append(value)
        } else if value == "(" {
            stack.push(data: value)
        } else if value == ")" {
            while stack.top != "(" {
                suffixExp.append(stack.pop() ?? "")
            }
            if stack.top == "(" {
                stack.pop()
            }
        } else {
            //value <= top, stack.pop;value > top, stack.push
            let advantage = OperationPriority.init(rawValue: value)?.intValue ?? 0
            var topAdvantage: Int = 0
            while let top = stack.top, top != "(" {
                topAdvantage = OperationPriority.init(rawValue: top)?.intValue ?? 0
                if advantage > topAdvantage {
                    break
                } else {
                    suffixExp.append(top)
                    stack.pop()
                }
            }
            stack.push(data: value)
        }
    }
    while let top = stack.top {
        suffixExp.append(top)
        stack.pop()
    }
    return suffixExp
}

let exp = ["9", "+", "(", "3", "-", "1", ")", "*", "3", "+", "10", "/", "2"]  
//中缀表达式：9+(3-1)*3+10/2
//后缀表达式：9 3 1 - 3 * + 10 2 / +
```
**注：[后缀表达式更多获取方法。](https://blog.csdn.net/summerxiachen/article/details/77073320)**

得到了后缀表达式，那么开始我们的四则运算了。😊
```
规则：
1.数字直接进栈
2.遇到符号，将栈顶两个数字出栈，进行运算，运算结果进栈

//在上面的枚举加一个计算加减乘除的函数
enum OperationPriority: String {
    ...
    func result(operator1: String, operator2: String) -> Int {
        switch self {
        case .multi:
            return Int(operator1)!*Int(operator2)!
        case .divide:
            return Int(operator1)!/Int(operator2)!
        case .add:
            return Int(operator1)!+Int(operator2)!
        case .sub:
            return Int(operator1)!-Int(operator2)!
        }
    }
}

func mathOperation(exps: Array<String>) -> Int {
    var result = 0
    var stack = Stack<String>()
    let predicate = NSPredicate.init(format: "SELF MATCHES %@", "^[0-9]*$")
    for value in exps {
        if predicate.evaluate(with: value) {
            stack.push(data: value)
        } else {
            let operator2 = stack.pop()
            let operator1 = stack.pop()
            let temp = (OperationPriority.init(rawValue: value)?.result(operator1: operator1!, operator2: operator2!))!
            stack.push(data: "\(temp)")
        }
    }
    if let resultStr = stack.pop() {
        result = Int(resultStr)!
    }
    return result
}
let exp = ["9", "+", "(", "3", "-", "1", ")", "*", "3", "+", "10", "/", "2"]  
//result=20
```
是不是很有意思，一个简单的四则运算就这样实现出来了。栈在计算机里面用的挺多的，比如，系统管理的对象就是放进一个全局栈里面的，等不需要的时候，一个一个出栈，释放所占的内存。
>队列：只允许在一端进行插入操作，而在另一端进行删除操作的线性表。

队列其实和显示社会排队买东西的队列一个道理，都是一边进，一边出，插队是会被所有人鄙视的😒，慎重。

队列的抽象数据类型：
```
ADT 队列(Queue)
Data
    具有线性表一样的性质。
Operation
    front：队列第一个数据
    count：队列的长度
    isEmpty()：队列是否为空
    enQueue(data)：数据进队列
    deQueue()：数据出队列
    removeAll()：清空队列内的所有数据
EndADT
```
按线性表的存储结构分类：
- 线性存储结构
  顺序队列
  循环顺序队列
- 链式存储结构
  链式队列
```
顺序队列：就是使用数组来模拟队列，但是数组的插入和删除需要移动数据，比较繁琐。
循环顺序队列：在顺序队列的基础上改造，使队列的队头和队尾可以在数组中循环变化，在数据插入和删除就不需要频繁移动数据了。但是顺序队列，都需要提前申请存储空间，还有溢出的可能。
链式队列：为了解决顺序队列的不足，引用链式队列。不需要提前申请空间，只不过会引入频繁申请和释放的操作。
```
队列的链式结构实现：
```
public struct Queue<T> {
    private var queueData: [T] = []
    
    public var front: T? {
        return queueData.first
    }
    
    public var isEmpty: Bool {
        return queueData.isEmpty
    }
    
    public var count: Int {
        return queueData.count
    }
    
    public mutating func enQueue(_ data: T) {
        queueData.append(data)
    }
    
    public mutating func deQueue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queueData.removeFirst()
        }
    }
    
    public mutating func removeAll() {
        queueData.removeAll()
    }
    
    public func printAllData() {
        for value in queueData {
            print(value)
        }
    }
}
```
**队列有什么作用？**
在开发过程中，接触最多的应该是全局并发队列。为什么要用队列实现呢？在我看来，在线程的优先级一样的情况下，不应该先申请系统资源的先被满足吗？这和在银行排队取钱是一个道理。当然，VIP就可以无视我们这些在前台排队取钱的渣渣，他们有专门的通道，多么痛的领悟😓。
# 四. 串
>串：是由零个或多个字符组成的有限序列，又叫字符串。

字符串在开发的时候很常用，以Objective-C为例，有可变字符串和不可变字符串，两者的实现数据结构应该有点区别；一个是链式存储结构，一个是顺序存储结构。

字符串的抽象数据类型：
```
ADT 串（String）
Data
    串中元素仅由一个字符组成，相邻元素具有前驱和后续关系。
Operation
    StringEmpty(S)：若串S为空，返回true，否则返回false。
    ...
EndADT
```
按存储结构分类：
- 顺序存储结构的字符串
- 链式存储结构的字符串

**字符串的模式匹配**
朴素的模式匹配算法：核心思想，需要匹配的字符串和主串从下标0开始匹配，一旦子串不匹配，则子串又从下标0开始匹配，主串则挪到下标1，不断的循环这个过程，直到主串或者字串当前的下标超过字符串的长度或者匹配成功返回。
```
let s = "goodgoogle"
let t = "google"

func matchString(s: String, t: String) -> Int {
    var post: Int = -1
    guard !s.isEmpty || !t.isEmpty else {
        return post
    }
    
    var i = 0  //s current index
    var j = 0  //t current index
    
    while i < s.count, j < t.count {
        let sIndex = s.index(s.startIndex, offsetBy: i)
        let tIndex = t.index(t.startIndex, offsetBy: j)
        let sStr = s[sIndex]
        let tStr = t[tIndex]
        if sStr == tStr {
            i = i+1
            j = j+1
        } else {
            i = i-j+1
            j = 0
        }
    }
    if j > t.count-1 {
        post = i-t.count
    }
    return post
}
```
朴素的模式匹配，虽然，简单明了，但是效率低。所以，强大的KMP模式匹配算法就应运而生了。
强大的KMP算法，这个可以看我之前写的[KMP字符串匹配算法](https://www.jianshu.com/p/68e9a227cb45)，这里就不做详细的介绍了。
# 五. 树
>树：n（n>=0）个结点的有限集。
```
特点：
- n=0时，称为空树。
- 在任意一颗非空树中：
（1）有且仅有一个根结点
（2）当n>1时，其余结点可分为m（m>0）个互不相交的有限集，其中每一个集合本身又是一棵树，并且称为根的子树。
```

**结点分类：**
- 结点拥有的子树数称为结点的度（Degree）。
- 度为0的结点称为叶结点（Leaf）或终端结点；度不为0的结点称为非终端结点或分支结点。
- 除根节点之外，分支结点也称为内部结点。
- 树的度是树内结点的度的最大值。
![树结点](https://upload-images.jianshu.io/upload_images/968977-b9eacd842bbbb3bb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**结点间关系：**
- 结点的子树的根称为该节点的孩子（Child），相应地，该结点称为孩子的双亲（Parent）。
- 同一个双亲的孩子之间互称兄弟（Sibling）。
- 结点的祖先是从根结点到该节点所经分支上的所有结点（包括根结点）。
- 以某结点为根的子树中任一结点都称为该结点的子孙。
![树结点关系](https://upload-images.jianshu.io/upload_images/968977-68e14b28ebbd12f0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**树的其他相关概念：**
- 结点的层次（Level）从根开始定义起，根为第一层，根的孩子为第二层。
- 双亲在同一层的结点互称为堂兄弟。
- 树中结点的最大层次称为书的深度（Depth）或高度。
- 如果左右子树是有次序的，不能互换的，则称该树为有序树，否则称为无序树。
- 森林（Forest）是m（m >= 0）课互不相交的树的集合。
![树的其他相关概念](https://upload-images.jianshu.io/upload_images/968977-cc54b035f6ad0d99.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**线性结构 VS 树结构：**
```
线性结构：
- 第一个数据元素：无前驱
- 最后一个数据元素：无后续
- 中间元素：一个前驱，一个后续

树结构：
- 根结点：无双亲，唯一
- 叶结点：无孩子，可以多个
- 中间结点：一个双亲，多个孩子
```
**树的抽象数据类型：**
```
 ADT  树（tree）
    树是由一个根结点和若干课子树构成。树中结点具有相同数据类型及层次关系。
Operation
    root：返回根结点。
    nodes：树的结点数
    depth：树的深度
    ...
EndADT
```
### 树的存储结构：
- 双亲表示法
- 孩子表示法
- 孩子兄弟表示法

以下图为例讲解树三种表示法：
![树的三种表示法](https://upload-images.jianshu.io/upload_images/968977-515fe5ada11bb874.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>双亲表示法：在每个结点中，拥有指向双亲结点的指针（可以扩展子结点或者兄弟结点）。

|下标|data|parent|
|:-----|:-----|:--------|
|   0   |   A   |    -1     |
|   1   |   B   |     0     |
|   2   |   C   |     0     |
|   3   |   D   |     1     |
|   4   |   E   |     2     |
|   5   |   F   |     2     |
|   6   |   G   |     3     |
|   7   |   H   |     3     |
|   8   |    I    |    3     |
|   9   |   J    |     4     |

>孩子表示法：每个结点有多个指针域，其中每个指针指向一棵子树的根结点，叫多重链表表示法；把每个结点排列起来，以单链表做存储结构，叫孩子表示法。

![孩子表示法](https://upload-images.jianshu.io/upload_images/968977-46087b0e034aaf97.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>孩子兄弟表示法：一个结点设置两个指针，分别指向该结点的第一个子结点和该结点的右兄弟。

![孩子兄弟表示法](https://upload-images.jianshu.io/upload_images/968977-49ef5e6e316cc74f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 二叉树
>二叉树：n（n>=0）个结点的有限集合，该集合或者为空集（空二叉树），或者为由一个根结点和两颗互不相交的、分别称为根结点的左子树和右子树的二叉树组成。

**由定义而得出二叉树的特点：**
- 每个结点最多有两颗子树
- 左子树和右子树是有顺序的
- 一个结点如果只有一颗子树，也要区分左右

**二叉树的基本形态：**
- 空二叉树（没有结点，包括根结点）
- 只有一个根结点
- 根结点只有左子树
- 根结点只有右子树
- 根结点有左右子树

**特殊二叉树：**
- 斜树：所有结点都只有左子树的二叉树叫左斜树，反之，叫右斜树。
- 满二叉树：所有结点都存在左右子树，并且所有叶结点都在同一层上。
- 完全二叉树：对一颗具有n个结点的二叉树按层编号，编号为i（1<=i<=n）的结点与同样深度的满二叉树中编号为i的结点在二叉树中位置相同。

**二叉树的性质：**
- 性质1：在二叉树的第i层最多有2^(i-1)的结点（i>=1）。
- 性质2：深度为k的二叉树至多有2^k-1个结点（k>=1）。
- 性质3：对任何一颗二叉树T，如果其终端结点数为n0，度为2的结点数为n2，则n0=n2+1。
- 性质4：具有n个结点的完全二叉树的深度为|log2(n)| + 1（|x|表示不大于x的最大整数）。
- 性质5：如果对一颗有n个结点的完全二叉树（其深度为|log2(n)| + 1）的结点按层编号（从第1层到第|log2(n) + 1|层，每层从左到右），对任一结点i（1<= i <= n）有：
  1.如果i=1，则结点i是二叉树的根结点，无双亲；如果i>1，则其双亲是结点|i/2|。
  2.如果2i>n，则结点i无左孩子（结点i为叶子结点）；否则其左孩子是结点2i。
  3.如果2i+1>n，则结点i无右孩子；否则其右孩子是结点2i+1。

```
性质证明：
-> 性质1
最多结点的二叉树是满二叉树，除了叶结点，所有结点的度都为2，所以，第i层最多有2^(i-1)个结点。

-> 性质2
由性质1可以每层的结点数，则k（k>=1）层二叉树总共节点数为：n = 2^0 + 2^1 + ... 2^(k-1)=1*(1-2^k)/(1-2) = 2^k - 1。

-> 性质3
二叉树的总结点数为：n = n0 + n1 + n2（n0为叶结点，n1为度为1的结点数，n2为度为2的结点数）；那么结点数为n的二叉树有多少条连接线呢？很明显每个结点，除了根结点都有指向连接线，所以，结点数为n的二叉树的总连接线为n-1；从一个结点的度来算，度为1的结点会有1条连接线，连接子结点；度为2的结点会有2连接线，连接子结点；根结点没有双亲结点，所以没有连向根结点的连接线，那么有：n-1 = 1*n0 + 2*n2；和第一条方程式联合可得：n0=n2+1。

-> 性质4
设置有n个结点的完全二叉树的深度为k，则：
2^(k-1)-1< n <= 2^k-1
因为k是整数，所以：
2^(k-1)<= n < 2^k
取对数得：
k-1<=log2(n)<k，即：k<=log2(n)+1并且k>log2(n)
所以：k=|log2(n)| + 1

-> 性质5.1
由性质1，2可得：
深度为k的二叉树有：结点2^(k-1) - 1的右孩子为：2^k-1，其左孩子为：2^k-2
左孩子除以2得：2^k-2 = 2^(k-1) - 1等于其双亲结点
右孩子除以2得：2^k-1 = 2^(k-1) - 1 + 1/2比其双亲结点大1/2，向下取整为：2^(k-1) - 1
所以，性质5.1成立。
-> 性质5.2
由性质5.1可知，n（n>1）结点的双亲为|n/2|，也就是说，深度最大，最右边的双亲结点<=n/2，则如果2i>n，说明i只能是叶结点不是双亲结点，所以，没有左孩子。由5.1可得，2i<=n，则i的左孩子为2i。
-> 性质5.3
由5.2可的2i其实就是i的左孩子，则2i+1就是i的右孩子，那么2i+1>n，即超过了最大的结点数，所有没有右孩子。
```
### 二叉树的存储结构
![完全二叉树](https://upload-images.jianshu.io/upload_images/968977-39ffd35640304ae1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 二叉树顺序存储结构
由于二叉树每个结点最多只有2个子树，并且左右子树是有顺序的，所以，可以使用数组直接存储。
![数组1](https://upload-images.jianshu.io/upload_images/968977-079e305a9879b56c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 二叉树链式存储结构
![链表1](https://upload-images.jianshu.io/upload_images/968977-8f8ad640f8825389.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 二叉树遍历
>二叉树的遍历是指从根结点出发，按照某种次序依次访问二叉树中所有结点，使得每个结点被访问有且仅有一次。

三种遍历次序：
- 前序遍历
若二叉树为空，则返回；否则，先遍历根结点，然后遍历左子树，再遍历右子树。
- 中序遍历
如果二叉树为空，则返回；否则，从根结点开始，先遍历左子树，然后是根结点，左后是右子树。
- 后续遍历
如果二叉树为空，则返回；否则，从根结点开始，先遍历左子树，然后遍历右子树。
- 层序遍历
如果二叉树为空，则返回；否则，从树的第一层，根结点开始访问，从上而下逐层遍历，在同一层中，按从左到右的顺序逐个结点访问。

![完全二叉树1](https://upload-images.jianshu.io/upload_images/968977-39ffd35640304ae1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
class BinTNode<T>: NSObject{
    var data: T
    var lChild: BinTNode<T>?
    var rChild: BinTNode<T>?
    init(_ data: T) {
        self.data = data
    }
}

//前序遍历
func preOrderTraverse(t: BinTNode<String>?) {
    guard let tNode = t else {
        return
    }
    
    print(tNode.data)
    preOrderTraverse(t: tNode.lChild)
    preOrderTraverse(t: tNode.rChild)
}
前序遍历结果：ABDHIEJCFG => A->(B->(D->H->I)->(E->J))->(C->F->G)

//中序遍历
func inOrderTraverse(t: BinTNode<String>?) {
    guard let tNode = t else {
        return
    }
    inOrderTraverse(t: tNode.lChild)
    print(tNode.data)
    inOrderTraverse(t: tNode.rChild)
}
中序遍历结果：HDIBJEAFCG => ((H<-D->I)<-B->(J<-E))<-A->(F<-C->G)

//后序遍历
func postOrderTraverse(t: BinTNode<String>?) {
    guard let tNode = t else {
        return
    }
    postOrderTraverse(t: tNode.lChild)
    postOrderTraverse(t: tNode.rChild)
    print(tNode.data)
}
后序遍历结果：HIDJEBFGCA => ((H->I->D)->(J->E)->B)->(F->G->C)->A

//层叙遍历
func layerOrderTraverse(t: BinTNode<String>?) {
    guard let tNode = t else {
        return
    }
    
    var array: [BinTNode<String>] = [tNode]
    while !array.isEmpty {
        let count = array.count
        for i in 0...count-1 {
            let node = array[i]
            print(node.data)
            if let lNode = node.lChild {
                array.append(lNode)
            }
            if let rNode = node.rChild {
                array.append(rNode)
            }
        }
        array.removeSubrange(Range.init(NSRange(location: 0, length: count))!)
    }
}
层序遍历结果：ABCDEFGHIJ => A->(B->C)->(D->E->F->G)->(H->I->J)
```
### 线索二叉树
>线索二叉树：指向前驱和后续的指针称为线索，加上线索的二叉树称为线索二叉树。

线索二叉树的数据结构：
```
class BinTNode<T>: NSObject {
    let data: T
    var lChild: BinTNode<T>?  
    var rChild: BinTNode<T>? 
    var lTag: Bool = false  //lTag = true，lChild指向前驱；否则，指向左子树
    var rTag: Bool = false  //rTag = true，rChild指向后续；否则，指向右子树
    init(_ data: T) {
        self.data = data
    }
}
```
以上面的完全二叉树1为例：
![线索二叉树](https://upload-images.jianshu.io/upload_images/968977-839e8366956da8ee.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
以中序遍历线索化：
```
//中序遍历
func inOrderTraverse_Thread(t: BinTNode<String>?) {
    var p = t?.lChild
    while p != t {
        while p?.lTag == false {  //二叉树最左边
            p = p?.lChild
        }
        print(p?.data ?? "")  //打印数据
        while p?.rChild != t, p?.rTag == true {
            p = p?.rChild
            print(p?.data ?? "")
        }
        p = p?.rChild
    }
}
核心实现思路：
1.遍历二叉树的最左结点，然后输出
2.通过后续指针获取双亲结点，然后输出
3.遍历到右子树，重复1，2两步骤
```
如果所用的二叉树需经常遍历或查找结点时需要某种遍历序列中的前驱和后续，那么采取线索二叉链表的存储结构就是非常不错的选择。
### 树、森林与二叉树的转换
- 树转换为二叉树
```
1.加线。在所有兄弟结点之间加一条线。
2.去线。对树中每个结点，只保留它与第一个孩子结点的连线，删除它与其他孩子之间的连线。
3.层次调整。以树的根结点为轴心，将整个树顺时针旋转一定的角度，使之结构层次分明。
```
![树 -> 二叉树](https://upload-images.jianshu.io/upload_images/968977-f69564e17440fe6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 森林转换为二叉树
```
1.把每棵树转换为二叉树。
2.第一棵二叉树不动，从第二棵二叉树开始，依次把后一棵二叉树的根结点作为前一棵二叉树的根结点的右孩子，用线连接起来。当所有的二叉树连接起来后就得到了由森林转换来的二叉树。
```
![森林 -> 二叉树](https://upload-images.jianshu.io/upload_images/968977-e09fdab9fa9f2447.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 二叉树转换为树
```
1.加线。若某个结点的左孩子结点存在，则将这个左孩子的n个右孩子结点都作为此结点的孩子。
2.去线。删除原二叉树中所有结点与其右孩子结点的连线。
3.层次调整。使之结构层次分明。
```
![二叉树 -> 树](https://upload-images.jianshu.io/upload_images/968977-1d32a0f6e4c9c8ec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 二叉树转换为森林
```
1.去线。从根结点开始，若右孩子存在，则把与右孩子相连的线去调，再看分离的二叉树，继续上个步骤。
2.将每棵分离的二叉树再转换成树。
```
![二叉树 -> 森林](https://upload-images.jianshu.io/upload_images/968977-2ce7d97efbbdfcf7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 树与森林的遍历
```
树的遍历：
1.先根遍历：
先访问根结点，然后依次先根遍历每个子树。
2.后根遍历：
先依次后根遍历每课子树，再访问根结点。
比如：图二叉树 -> 树，先根遍历：ABEFCDG  后根遍历：EFBCGDA

森林的遍历：
1.前序遍历：
使用先根依次遍历每课树。
2.后序遍历：
使用后根依次遍历每棵树。
比如：图二叉树 -> 森林，前序遍历：ABCDEFGHJI 后序遍历：BCDAFEJHIG
```
### 赫夫曼树
>赫夫曼树：从树中一个结点到另一个结点之间的分支构成两个结点之间的路径，路径上的分支数目称作路径长度。树的路径长度就是从树根到每一结点的路径长度之和。其中，带权路径长度WPL最小的二叉树称作赫夫曼树。
![赫夫曼树](https://upload-images.jianshu.io/upload_images/968977-ec4a3deb20badac4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
二叉树a中，根结点到A的路径为1，带权路径为：15x1=15
所以，二叉树a的路径为：1+2+3+4+4 = 14；二叉树b的路径为：3+3+2+2+2 = 12
二叉树a的带权路径为：1x5 + 2x15 + 3x40 + 4x30 + 4x10 = 315
二叉树b的带权路径为：3x5 + 3x15 + 2x40 + 2x30 + 2x10 = 220
如果有10000名学生需要计算成绩，则二叉树a需要判断：(315÷100)x10000 = 31500次；二叉树b需要判断：(220÷100)x10000 = 22000次，后者是前者的2/3。所以，赫夫曼树可以很有效的把比较的次数降低，加快计算的速度。赫夫曼编码，也是一种压缩编发方式，可以很有效的减少目标的大小而不丢失信息。
- 构造赫夫曼树
```
步骤：
1.先把结点按照权值的大小排成一列：A5，E10，B15，D30，C40。
2.取权值最小的两个结点A5和E10作为一个新结点N₁的两个子结点，权值较小的作为左子树，较大的作为右子树。然后，N₁的权值为两个子结点的权值之和：5+10=15。
        N₁
      /    \
     A      E
3.将N1代替A5和E10插入前面的有序序列：N₁15，B15，D30，C40。
4.重复步骤2，直到遍历所有的结点，得到赫夫曼树。
        T
     𝟜𝟘/  \𝟞𝟘
     C     N₃
       𝟛𝟘 /  \𝟛𝟘
        N₂    D
     𝟙𝟝/  \𝟙𝟝
     N₁    B
   𝟝/  \𝟙𝟘
   A    E
WPL：40*1 + 60*1 + 30*2 + 15*3 + 5*4 + 10*4 = 205
```
- 赫夫曼编码
赫夫曼编码就是主要解决远距离通信的数据传输的最优化的问题。因为，计算机里数据都是通过二进制来传输的，拿英文26个字母来说，每个字母在一天文章中出现的概率不一样，那么每个字母和出现的概率可以构造一颗赫夫曼树，通过减少每个字母的二进制位数来压缩文件大小，这就是赫夫曼编码的应用。
#六. 图
>图：由顶点的有穷非空集合和顶点之间边的集合组成，通常表示为：G(V, E)，其中G表示一个图，V是图G中顶点的集合，E是图G中边的集合。

特点：
- 顶点集合不能为空
- 边的集合可以为空

### 各种图定义
- **无向图**：若顶点v1到v2之间的边没有方向，则称这条边为无向边，用无序偶对(v1, v2)来表示。无向图就是图中任意两个顶点之间的边都是无向边。
![无向图](https://upload-images.jianshu.io/upload_images/968977-846b47165429efd0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- **有向图**：若从顶点v1到v2的边有方向，则称这条边为有向边，也称为弧。用有序偶对<v1, v2>来表示，v1称为弧尾，v2称为弧头。有向图就是图中任意两条边都是有向边。
![有向图](https://upload-images.jianshu.io/upload_images/968977-d26f7ad75c094985.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- **简单图**：在图中，不存在顶点到其自身的边，并且同一条边不重复出现，称为简单图。
![非简单图](https://upload-images.jianshu.io/upload_images/968977-b28bd33396e016d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- **完全图**：如果在无向图中，任意两个顶点之间都存在边，则称为完全图。
![完全图](https://upload-images.jianshu.io/upload_images/968977-187bcb2a4cfd80a1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- **有向完全图**：如果任意两个顶点之间都存在互为相反的两条弧，则称为又想完全图。
![有向完全图](https://upload-images.jianshu.io/upload_images/968977-4af16b6bf2e19ee2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 有很少条边或弧的图称为稀疏图，反之称为稠密图。（数量不一定）
- 与图的边或者弧相关的数字叫做权，带权的图称为网。
- 子图：假设有两个图G=(V, {E})和G1=(V1, {E1})，如果V1⊆V，且E1⊆E，则称G1为G的子图。

### 图的顶点和边之间的关系
![图1](https://upload-images.jianshu.io/upload_images/968977-51ddcfc46f340542.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- **顶点的度：**
  对于无向图G=(V,{E})，如果边(V,V1)∈E，则称顶点V和V1互为邻接点，顶点V的度是和V相关联的边的数目，记为TD(V)。如图1，A的度TD(A)=3，TD(B)=2，TD(C)=3，TD(D)=2，则各个顶点的度总和为：3+2+3+2=10，而图1无向图的边数为5，即各个顶点的度的总和的一半。
 对于有向图G=(V,{E})，如果弧<V,V1>∈E，则称顶点V和V1互为邻接点；以顶点V为头的弧的数目称为V的入度，记为ID(V)；以顶点V为尾的弧的数目称为V的出度，记为OD(V)；则顶点TD(V)=ID(V)+OD(V)。如图1有向图，TD(A)=ID(A)+OD(A)=2+1=3，各顶点的出度和为：1+2+1+0=4，各顶点的入度和为：2+0+1+1=4，有向图的边的总数4，所以，有向图边的总数=各顶点的出度数=各顶点的入度数。

- **路径：**
  从一个顶点到另一个顶点所走过的顶点和边所连成的通道。比如图1的无向图，从B到D有四条路径，分别是(BAD)，(BCD)，(BACD)，(BCAD)。而图1从B到D的路径是有方向的，即(BAD)，(BCAD)。路径的长度是路径上的边数或弧的数目。序列中顶点不重复出现的路径称为简单路径。
- **回路或环：**
  点一个顶点和最后一个顶点相同的路径称为回路或者环。其中，除了第一个顶点和最后一个顶点，其余顶点不重复出现的回路，称为简单回路或简单环。下面图1左边就是简单回路，右边并不是简单回路，因为顶点C重复出现了。
![图2](https://upload-images.jianshu.io/upload_images/968977-7f51161408592603.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- **连通图：**
在无向图G中，如果从顶点V到顶点V1有路径，则称顶点V和顶点V1是连通的。如果对于图中任意两个顶点都是连通的，则称G是连通图。如图3，左边的图不是连通图，右边的图是连通图。
![图3](https://upload-images.jianshu.io/upload_images/968977-85d8da5bce26ae12.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![图4](https://upload-images.jianshu.io/upload_images/968977-90f879f15eef7fb2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- **连通分量：**
  无向图中的极大连通子图称为连通分量。
（1）子图。
（2）子图是连通的。
（3）连通的子图含有极大的顶点数。
（4）具有极大顶点数的连通子图包含依附于这些顶点的所有边。
比如图3中，左边的图的连通分量为右边的图。
  在有向图G中，如果对于每一对V1，V2∈V，V1≠V2，从V1到V2和从V2到V1都存在路径，则称G是强连通图。有向图中极大强连通子图称做有向图的强连通分量。上图4中左边的图不是强连通图，右边的图是强连通图。
- **无向图生成树：**
  一个连通图的生成树是一个极小的连通子图，它含有图中全部的n个顶点，但只有足以构成一棵树的n-1条边。比如图2中左边的无向图，它的连通分量为自身，则它的极小连通子图为，自身去调AC和AD两条边，则构成一个极小连通图，因为再去多一条边就构不成连通图了，这个就是连通图的生成树。
- **有向树：**
  如果一个有向图恰有一个顶点的入度为0，其余顶点的入度都为1，则是一颗有向树。（不需要连通）
- **生成森林：**
  一个有向图的生成森林由若干有向树组成，含有图中全部顶点，但只有足以构成若干课不相交的有向树的弧。
![图5](https://upload-images.jianshu.io/upload_images/968977-905b8e8e2db52233.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 图的抽象数据类型
```
ADT 图(Graph) 
Data
    顶点是有穷且非空集合+边的集合
Operation
    ...
    addVertex(v)：添加顶点
    addEdge(v1, v2)：添加边
    DFSTraverse()：深度优先遍历
    BFSTraverse()：广度优先遍历
    ...
EndADT
```
### 图的数据存储
>邻接矩阵：用两个数组来表示图。一个一维数组储存图中顶点信息，一个二维数组（称为邻接矩阵）存储图中的边或弧的信息。

- **无向图**
![邻接矩阵图1](https://upload-images.jianshu.io/upload_images/968977-ebce27e336d6d3ec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![邻接矩阵图2](https://upload-images.jianshu.io/upload_images/968977-5242167d0c5aff96.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
信息：
（1）v1的度即为第1行，所有元素之和：1+0+1+0=2。
（2）v1的邻接点即为第1行，所有元素为1的顶点。
（3）判断v1到v2是否有边，只需要判断arc[1][2]==1?就行，所以，v1到v2有边。

- **有向图**
![邻接矩阵3](https://upload-images.jianshu.io/upload_images/968977-5ca66f5e5fa37b2d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
信息：
（1）v1的出度为第1行的元素之和：1+0+1+0=2；v1的入度为第1列的元素之和：0+0+1+0=1。
（2）判断v0到v3是否有弧，只需要判断arc[0][3]==1?就行，所以，v0到v3是有弧的。（v3到v0没有弧，弧是有方向的）

- **带权有向图**
就是将有向图的邻接矩阵中的0和1换成相应的权值，不存在则设置为∞，自身则设置为0。
![邻接矩阵4](https://upload-images.jianshu.io/upload_images/968977-374ee6424e4d7577.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>邻接表：数组和链表组合的存储方法称为邻接表。

邻接表处理：
（1）图中顶点使用一个一维数组存储。
（2）图中每个顶点v的所有邻接点构成一个线性表。

- 无向图邻接表：
![邻接表图1](https://upload-images.jianshu.io/upload_images/968977-9ec11ae2326d4474.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 有向图邻接表和逆邻接表：
（1）有向图邻接表记录的是顶点的出度的弧，即弧尾。
（2）有向图逆邻接表记录的是顶点的入度的弧，即弧头。
![邻接表图2](https://upload-images.jianshu.io/upload_images/968977-c9b11da6e23d2f49.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 带权邻接表
![邻接表图3](https://upload-images.jianshu.io/upload_images/968977-8c63d6233d3a9a25.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>十字链表：即把邻接表与逆邻接表结合起来。（有向邻接表的优化）

- 重新定义顶点
![十字链表顶点](https://upload-images.jianshu.io/upload_images/968977-0874719ed07b9077.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
data为数据域，firstin为入边的表头指针，firsetout为出边的表头指针。顶点的入边从firstin开始查询，同理，顶点的出边从firstout开始查询。

- 重新定义边结点结构
![十字链表结点](https://upload-images.jianshu.io/upload_images/968977-4e308f9f346d84a5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
tailvex是指弧尾结点的下标，headvex是指弧头结点的下标；headlink是指弧头结点下标和headvex相同的另一个弧头结点下标，同理，taillink是指弧尾结点下标和tailvex相同的另一个弧尾结点下标，没有置为空。

举个例子：
![十字链表图1](https://upload-images.jianshu.io/upload_images/968977-6778065b004761a1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

v0的入度为：1->0, 2->0，v0的出度为：0->3。

>邻接多重表：改造边结点，使删除某一条边不需要遍历两次。

![邻接多重表结点](https://upload-images.jianshu.io/upload_images/968977-f1bacfd0e94b50ef.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
其中ivex和jvex是与某条边依附的两个顶点在顶点表中的下标。ilink指向依附顶点ivex的下一条边，jlink指向依附顶点jvex的下一条边。

![邻接多重表](https://upload-images.jianshu.io/upload_images/968977-6ef3e5e451d320c1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
上图总共有5条边，分别是v0->v1，v1->v2，v2->v3，v3->v0，v0-v2，所以，会有5个边结点。然后从v0开始，有三条邻接的边，分别是v0-v1，v0-v2，v0-v3，首先vo指向E(0,1)，然后当前的边结点的ivex=0，所以，ilink需要找到下一条顶点为v0的边，顺着边结点往下找，可以找到E(3,0)，所以，ilink指向E(3,0)，由于，v0还有另外一条边E(0,2)，所以，jlink顺着往下找，找到E(0,2)，再往下没有边结点了，所以置为空。其他顶点的操作也是相似的过程。
 
>边集数组：边集数组是由两个一位数组组成。一个是存储顶点信息，另一个是存储边的信息。这个数组每个数据元素由一条边的起点下标(begin)，终点下标(end)和权(weight)组成。

![边集数组](https://upload-images.jianshu.io/upload_images/968977-88c39379b7d01d52.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 图的遍历
>图的遍历：从图中某一顶点出发访遍图中其余顶点，且使每一个顶点被访问一次。

- **深度优先遍历（DFS）**
 连通图深度优先遍历： 从图中的某个顶点v出发，访问此顶点，然后从v的未被访问的邻接顶点出发，深度优先遍历图，直到图中所有和v有路径相通的顶点被访问到。
  非连通图深度优先遍历：先对一个顶点进行连通图深度优先遍历，若还有没有被访问的顶点，再对该顶点进行连通图深度优先遍历，直到图中所有顶点都被访问到。

![深度优先遍历图1](https://upload-images.jianshu.io/upload_images/968977-2b304269fb646773.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

邻接矩阵存储图，深度优先遍历实现算法
```
使用深度优先遍历图1实现深度优先遍历算法
//邻接矩阵
public struct Graph<T: Equatable> {
    fileprivate var vexs: [T] = []
    fileprivate var arc: [[Int]] = []
    public var vertexes: Int {
        return vexs.count
    }
    public var edges: Int {
        var count = 0
        for items in arc {
            for item in items {
                if item > 0 {
                    count += 1
                }
            }
        }
        return count
    }
    
    public mutating func addVertex(vertext: T) {
        vexs.append(vertext)
        for i in 0..<arc.count {
            var temp = arc[i]
            temp.append(0)
            arc[i] = temp
        }
        
        let newArray = Array(repeating: 0, count: arc.count+1)
        arc.append(newArray)
    }
    
    public mutating func addEdge(from top1: T, to top2: T) {
        let containTop1 = vexs.contains { $0 == top1 }
        let containTop2 = vexs.contains { $0 == top2 }
        
        guard containTop1, containTop2 else {
            return
        }
        
        let row = vexs.index(of: top1)!
        let column = vexs.index(of: top2)!
        arc[row][column] = 1
    }
}

var graphics = Graph<String>()
graphics.addVertex(vertext: "A")
graphics.addVertex(vertext: "B")
graphics.addVertex(vertext: "C")
graphics.addVertex(vertext: "D")
graphics.addVertex(vertext: "E")
graphics.addVertex(vertext: "F")
graphics.addVertex(vertext: "G")
graphics.addVertex(vertext: "H")
graphics.addVertex(vertext: "I")

graphics.addEdge(from: "A", to: "B")
graphics.addEdge(from: "A", to: "F")
graphics.addEdge(from: "B", to: "C")
graphics.addEdge(from: "B", to: "I")
graphics.addEdge(from: "B", to: "G")
graphics.addEdge(from: "C", to: "I")
graphics.addEdge(from: "C", to: "D")
graphics.addEdge(from: "D", to: "I")
graphics.addEdge(from: "D", to: "E")
graphics.addEdge(from: "D", to: "G")
graphics.addEdge(from: "D", to: "H")
graphics.addEdge(from: "E", to: "F")
graphics.addEdge(from: "E", to: "H")
graphics.addEdge(from: "F", to: "G")
graphics.addEdge(from: "G", to: "H")

//深度优先遍历
var visited: [Bool] = []
func DFS(graphics: Graph<String>, i: Int) {
    visited[i] = true
    print(graphics.vexs[i])
    
    for j in 0..<graphics.vertexes {
        if graphics.arc[i][j] == 1, !visited[j] {
            DFS(graphics: graphics, i: j)
        }
    }
}

func DFSTraverse(graphics: Graph<String>) {
    for _ in 0..<graphics.vertexes {
        visited.append(false)
    }
    
    for i in 0..<graphics.vertexes {
        if !visited[i] {
            DFS(graphics: graphics, i: i)
        }
    }
}

DFSTraverse(graphics: graphics)

输出结果：ABCDEFGHI
```
邻接链表存储图，深度优先遍历实现算法：
```
class EdgeNode<T: Equatable> {
    var index: Int
    var nextEdge: EdgeNode<T>?

    init(atIndex index: Int) {
        self.index = index
    }
}

class VertexNode<T: Equatable> {
    var data: T
    var firstEdge: EdgeNode<T>?

    init(_ data: T) {
        self.data = data
    }
}

class Graphics<T: Equatable> {
    var adjList: [VertexNode<T>] = []
    var numVertexes: Int {
        return adjList.count
    }
    var numEdges: Int {
        var count = 0
        for vertex in adjList {
            if let edge = vertex.firstEdge {
                count += 1
                var next = edge.nextEdge
                while next != nil {
                    count += 1
                    next = next?.nextEdge
                }
            }
        }
        return count/2
    }

    func addVertex(vertex: T) {
        let v = VertexNode<T>(vertex)
        adjList.append(v)
    }

    func addEdge(from v1: T, to v2: T) {
        let vertex1 = getVertex(data: v1)
        let vertex2 = getVertex(data: v2)
        guard vertex1 != nil, vertex2 != nil else {
            return;
        }

        let index1 = getVertextIndex(v1)!
        let index2 = getVertextIndex(v2)!
        
        vertextAddEdge(vertex: vertex1!, index: index2)
        vertextAddEdge(vertex: vertex2!, index: index1)
    }

    func vertextAddEdge(vertex: VertexNode<T>, index: Int) {
        var edgeNode = vertex.firstEdge
        guard edgeNode != nil else {
            vertex.firstEdge = EdgeNode<T>(atIndex: index)
            return;
        }

        let value = adjList[index].data
        if adjList[(edgeNode?.index)!].data == value {
            return
        }
        while edgeNode?.nextEdge != nil {
            edgeNode = edgeNode?.nextEdge
            if adjList[(edgeNode?.index)!].data == value {
                return
            }
        }
        edgeNode?.nextEdge = EdgeNode<T>(atIndex: index)
    }

    func getVertex(data: T) -> VertexNode<T>? {
        for v in adjList {
            if v.data == data {
                return v
            }
        }
        return nil
    }

    func getVertextIndex(_ data: T) -> Int? {
        for index in 0..<adjList.endIndex {
            let vertex = adjList[index]
            if vertex.data == data {
                return index
            }
        }
        return nil
    }
}

let graphics = Graphics<String>()
graphics.addVertex(vertex: "A")
graphics.addVertex(vertex: "B")
graphics.addVertex(vertex: "C")
graphics.addVertex(vertex: "D")
graphics.addVertex(vertex: "E")
graphics.addVertex(vertex: "F")
graphics.addVertex(vertex: "G")
graphics.addVertex(vertex: "H")
graphics.addVertex(vertex: "I")

graphics.addEdge(from: "A", to: "B")
graphics.addEdge(from: "A", to: "F")
graphics.addEdge(from: "B", to: "A")
graphics.addEdge(from: "B", to: "C")
graphics.addEdge(from: "B", to: "G")
graphics.addEdge(from: "B", to: "I")
graphics.addEdge(from: "C", to: "B")
graphics.addEdge(from: "C", to: "D")
graphics.addEdge(from: "C", to: "I")
graphics.addEdge(from: "D", to: "C")
graphics.addEdge(from: "D", to: "E")
graphics.addEdge(from: "D", to: "G")
graphics.addEdge(from: "D", to: "H")
graphics.addEdge(from: "D", to: "I")
graphics.addEdge(from: "E", to: "D")
graphics.addEdge(from: "E", to: "F")
graphics.addEdge(from: "E", to: "H")
graphics.addEdge(from: "F", to: "G")
graphics.addEdge(from: "G", to: "B")
graphics.addEdge(from: "G", to: "D")
graphics.addEdge(from: "G", to: "F")
graphics.addEdge(from: "G", to: "H")

var visited: [Bool] = []
func DFS(graphics: Graphics<String>, i: Int) {
    visited[i] = true
    print(graphics.adjList[i].data)

    var edgeNode = graphics.adjList[i].firstEdge
    while edgeNode != nil {
        if !visited[(edgeNode?.index)!] {
            DFS(graphics: graphics, i: (edgeNode?.index)!)
        }
        edgeNode = edgeNode?.nextEdge
    }
}

func DFSTraverse(graphics: Graphics<String>) {
    for _ in 0..<graphics.numVertexes {
        visited.append(false)
    }

    for i in 0..<graphics.numVertexes {
        if !visited[i] {
            DFS(graphics: graphics, i: i)
        }
    }
}

DFSTraverse(graphics: graphics)
输出结果：ABCDEFGHI
```
- **广度优先遍历（BFS）**
如果深度优先遍历类似于树的**前序遍历**，那么广度优先遍历则类似于树的**层遍历**。与深度优先遍历图1为例，则广度优先遍历的顺序则为：
（1）A（2）BF（3）CIGE（4）DH。

邻接矩阵存储图，广度优先遍历实现算法
```
var visited: [Bool] = []

func BFSTraverse(graphics: Graph<String>) {
    for _ in 0..<graphics.vertexes {
        visited.append(false)
    }
    
    var result: [String] = []
    for i in 0..<graphics.vertexes {
        if !visited[i] {
            visited[i] = true
            print(graphics.vexs[i])
            result.append(graphics.vexs[i])
            while !result.isEmpty {
                result.removeFirst()
                for j in 0..<graphics.vertexes {
                    if graphics.arc[i][j] == 1, !visited[j] {
                        visited[j] = true
                        print(graphics.vexs[j])
                        result.append(graphics.vexs[j])
                    }
                }
            }
        }
    }
}

BFSTraverse(graphics: graphics)
输出结果：ABFCDIEHG
```
邻接链表存储图，深度优先遍历实现算法：
```
var visited: [Bool] = []
func BFSTraverse(graphics: Graphics<String>) {
    for _ in 0..<graphics.numVertexes {
        visited.append(false)
    }
    
    var result: [VertexNode<String>] = []
    for i in 0..<graphics.numVertexes {
        if !visited[i] {
            visited[i] = true
            print(graphics.adjList[i].data)
            result.append(graphics.adjList[i])
            while !result.isEmpty {
                let vertex = result.removeFirst()
                var edgeNode = vertex.firstEdge
                while edgeNode != nil {
                    if !visited[(edgeNode?.index)!] {
                        visited[(edgeNode?.index)!] = true
                        print(graphics.adjList[(edgeNode?.index)!].data)
                        result.append(graphics.adjList[(edgeNode?.index)!])
                    }
                    edgeNode = edgeNode?.nextEdge
                }
            }
        }
    }
}

BFSTraverse(graphics: graphics)
输出结果：ABFCGIEDH
```

>比较：深度优先遍历适合目标比较明确，而广度优先遍历更适合在不断扩大范围时找到相对最优解的情况。

### 最小生成树
>最小生成树：构造连通网的最小代价生成树称为最小生成树。

寻找最小生成树的两种算法：普里姆算法(Prim)和克鲁斯卡尔算法(Kruskal)。

- **普里姆算法**
>假设N是连通网，TE是N上最小生成树中边的集合。算法从U={u0}(u0∈V)，TE={}开始。重复执行下述操作：在所有u∈V,v∈V-U的边(u,v)∈E中，找一条代价最小的边(u0,v0)并入集合TE，同时v0并入U，直至U=V为止。此时TE中必有n-1条边，则T=(V,{TE})为N的最小生成树，时间复杂度为O(n^2)。通俗来讲，先从v0开始，找到和v0连接的权重最小的边的顶点v1，然后再找{v0,v1}相连的权重最小的边，直到所有顶点都找完。

```
func miniSpanTree_prim(graphics: Graph<String>) {
    var adjvex = Array(repeating: 0, count: graphics.vertexes)  //初始化都为0，意味着从v0开始找
    var lowcost = graphics.arc[0] //初始化为v0所关联的所有边的权值
    
    //因为v0已经在adjvex里面了，所以从下标1开始寻找
    var min: Int
    for _ in 1..<graphics.vertexes {
        min = Int.max  //lowcost下标为0则说明该顶点已被找过，下标为Int.max则意味着，没有该条边
        var k = 0 //保存最小值的下标
        for j in 1..<graphics.vertexes {
            if lowcost[j] != 0, lowcost[j] < min {
                min = lowcost[j]
                k = j
            }
        }
        print("\(adjvex[k], k)")  //adjvex[k]为当前的顶点，k为当前顶点关联权值最小边的顶点的下标
        //将找到的最小权值边的下一个顶点加入adjvex，并且将该顶点相关联的较小边加入lowcost
        for j in 1..<graphics.vertexes {
            if lowcost[j] != 0, graphics.arc[k][j] < lowcost[j] {
                lowcost[j] = graphics.arc[k][j]
                adjvex[j] = k
            }
        }
    }
}

miniSpanTree_prim(graphics: graphics)
输出结果：
(0, 1)
(0, 5)
(1, 8)
(8, 2)
(1, 6)
(6, 7)
(7, 4)
(7, 3)
```
- 注意点：每添加一个顶点，lowcost数组中除了对应已选则的顶点为0之外，保存已选顶点和未选顶点之间的所有较小的边。

- **克鲁斯卡尔算法**
>假设 N= (V，{E})是连通网，则令最小生成树的初始状态为只有 n 个顶点而无边的 非连通图 T={V，{}}，图中每个顶点自成一个连通分量。在 E 中选择代价最小的边，若 该边依附的顶点落在 T 中不同的连通分量上，则将此边加入到 T 中，否则舍去此边而 选择下一条代价最小的边。依次类推，直至 T 中所有顶点都在罔一连通分量上为止 ，时间复杂度为O(eloge)。通俗来讲就是，先把所有的边按照权值的大小排序，然后从最小的开始选择，每选择一次需要判断是否和之前已选择的边形成回路，如果形成回路则选择下一条边，直到所有的边都被遍历完，所得就是最小生成树。
```
struct Edge{
    let begin: Int, end: Int, weight: Int
    init (begin: Int, end: Int, weight: Int) {
        self.begin = begin
        self.end = end
        self.weight = weight
    }
}

func miniSpanTree_Kruskal(graphics: Graph<String>) {
    var edges: [Edge] = []  //边集数组
    for i in 1..<graphics.vertexes {
        let arc = graphics.arc[i-1]
        for j in i..<graphics.vertexes {
            if arc[j] < Int.max {
                let edge = Edge(begin: i-1, end: j, weight: arc[j])
                edges.append(edge)
            }
        }
    }
    edges.sort{$0.weight < $1.weight}
    var parent = Array(repeating: 0, count: graphics.vertexes)  //判断是否成环的数组
    for i in 0..<edges.count {
        let n = find(parent: parent, fedge: edges[i].begin)
        let m = find(parent: parent, fedge: edges[i].end)
        if n != m {  //一条边从两边开始计算，只要最后的点相等，则会构成环
            parent[n] = m
            print("\(edges[i].begin, edges[i].end) \(edges[i].weight)")
        }
    }
}

//寻找每个点的路径
func find(parent: [Int], fedge: Int) -> Int {
    var result = fedge
    while parent[result] > 0 {
        result = parent[result]
    }
    return result
}

miniSpanTree_Kruskal(graphics: graphics)
```

- 注意点：parent数组，从下标开始和相应下标数组中的值，形成该顶点的一条路径。

- **两个算法对比：**
对比两个算法，克鲁斯卡尔算法主要是针对边来展开，边数少时效率会非常高，所以对于稀疏图有很大的优势。而普里姆算法对于稠密图，即边数非常多的情况会更 好一些。

### 最短路径
>对于网图来说，最短路径，是指两顶点之间经过的边上权值之和最小的路径，并且，我们称路径上第一个顶点为源点，最后一个顶点为终点。

以下面的网图，寻找最短路径：

![最短路径](https://upload-images.jianshu.io/upload_images/968977-4772c267125eae6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
var graphics = Graph<String>()
graphics.addVertex(vertext: "v0")
graphics.addVertex(vertext: "v1")
graphics.addVertex(vertext: "v2")
graphics.addVertex(vertext: "v3")
graphics.addVertex(vertext: "v4")
graphics.addVertex(vertext: "v5")
graphics.addVertex(vertext: "v6")
graphics.addVertex(vertext: "v7")
graphics.addVertex(vertext: "v8")

//最短路径
graphics.addEdge(from: "v0", to: "v1", weight: 1)
graphics.addEdge(from: "v0", to: "v2", weight: 5)

graphics.addEdge(from: "v1", to: "v0", weight: 1)
graphics.addEdge(from: "v1", to: "v2", weight: 3)
graphics.addEdge(from: "v1", to: "v3", weight: 7)
graphics.addEdge(from: "v1", to: "v4", weight: 5)

graphics.addEdge(from: "v2", to: "v0", weight: 5)
graphics.addEdge(from: "v2", to: "v1", weight: 3)
graphics.addEdge(from: "v2", to: "v4", weight: 1)
graphics.addEdge(from: "v2", to: "v5", weight: 7)

graphics.addEdge(from: "v3", to: "v1", weight: 7)
graphics.addEdge(from: "v3", to: "v4", weight: 2)
graphics.addEdge(from: "v3", to: "v6", weight: 3)

graphics.addEdge(from: "v4", to: "v1", weight: 5)
graphics.addEdge(from: "v4", to: "v2", weight: 1)
graphics.addEdge(from: "v4", to: "v3", weight: 2)
graphics.addEdge(from: "v4", to: "v5", weight: 3)
graphics.addEdge(from: "v4", to: "v6", weight: 6)
graphics.addEdge(from: "v4", to: "v7", weight: 9)

graphics.addEdge(from: "v5", to: "v2", weight: 7)
graphics.addEdge(from: "v5", to: "v4", weight: 3)
graphics.addEdge(from: "v5", to: "v7", weight: 5)

graphics.addEdge(from: "v6", to: "v3", weight: 3)
graphics.addEdge(from: "v6", to: "v4", weight: 6)
graphics.addEdge(from: "v6", to: "v7", weight: 2)
graphics.addEdge(from: "v6", to: "v8", weight: 7)

graphics.addEdge(from: "v7", to: "v4", weight: 9)
graphics.addEdge(from: "v7", to: "v5", weight: 5)
graphics.addEdge(from: "v7", to: "v6", weight: 2)
graphics.addEdge(from: "v7", to: "v8", weight: 4)

graphics.addEdge(from: "v8", to: "v6", weight: 7)
graphics.addEdge(from: "v8", to: "v7", weight: 4)
```

- 迪杰斯特拉（Dijkstra）算法
>从源点开始，找到源点到下一个最短路径的顶点。然后，在之前的基础上，再找下一个最短路径的顶点，直到终点。该算法的时间复杂度为O(n^2)。

```
func shortestPath_Dijkstra(graphics: Graph<String>) {
    var final = Array(repeating: 0, count: graphics.vertexes)  //final[N]=1，表示求的顶点v0至vN的最短路径
    var pathArc = Array(repeating: 0, count: graphics.vertexes)  //储存最短路径下标前驱的数组
    var shortPathTable: [Int] = []  //表示v0到各个顶点的最短路径长度
    for i in 0..<graphics.vertexes {
        shortPathTable.append(graphics.arc[0][i])
    }
    final[0] = 1  //v0-v0不需要求路径
    //开始求v0到各个顶点的最短路径
    for _ in 1..<graphics.vertexes {
        var min = Int.max  //当前所知离v0顶点最近的距离
        var k = 0
        for w in 0..<graphics.vertexes {
            if final[w] == 0, shortPathTable[w] < min {
                k = w
                min = shortPathTable[w]
            }
        }
        final[k] = 1
        //修正最短路径
        for w in 0..<graphics.vertexes {
            if final[w] == 0, min < shortPathTable[w]-graphics.arc[k][w]{
                shortPathTable[w] = min + graphics.arc[k][w]
                pathArc[w] = k
            }
        }
    }
    
    print(final)
    print(pathArc)
    print(shortPathTable)
}

shortestPath_Dijkstra(graphics: graphics)
//输出结果
[1, 1, 1, 1, 1, 1, 1, 1, 1]
[0, 0, 1, 4, 2, 4, 3, 6, 7]
[0, 1, 4, 7, 5, 8, 10, 12, 16]
```
- 说明：
刚开始final数组为：[1, 0, 0, 0, 0, 0, 0, 0, 0]，因为从v0开始，v0算是找到了最短路径；pathArc数组为：[0, 0, 0, 0, 0, 0, 0, 0, 0]；shortestPathTable数组为：[0, 1, 5, ∞, ∞, ∞, ∞, ∞, ∞]。因为v0-v1=1 < v0-v2=5，所以，v0下一个最短路径的顶点是v1，这时候final为[1, 1, 0, 0, 0, 0, 0, 0, 0]，那么，既然找到了下一个最短路径的顶点v1，那么，和v1相连的顶点路径的权值和shortestPathTable中的权值比较，取较小者的权值。到此，v0-v1以及和v1相连的顶点的较小权值都得到了，继续重复上面的步骤直到终点，就可以得到从v0-v8各个顶点到v0的最小路径了。

- 佛洛伊德（Floyd）算法
>关键公式：D[ v ][ w ] = min { D[ v ][ w ] , D[ V ][0] + D[0][W] }，主要思想就是：求v1到v2经过最短路径，有v1->v2，v1->v0->v2，则v1->v2的最短路径为两者最短的路径。以此类推，在其基础上求v1-v3的路径也是一样的。算法时间复杂度为O(n^3)。
```
//佛洛伊德算法
func ShortestPath_Floyd(graphics: Graph<String>) {
    //初始化矩阵
    var pathmatirx: [[Int]]
    var shortPathTable: [[Int]] = graphics.arc
    
    var rowValue: [Int] = []
    for i in 0..<graphics.vertexes {
        rowValue.append(i)
    }
    pathmatirx = Array(repeating: rowValue, count: graphics.vertexes)
    
    //开始算法
    for k in 0..<graphics.vertexes {
        for v in 0..<graphics.vertexes {
            for w in 0..<graphics.vertexes {
                if shortPathTable[v][k] < Int.max, shortPathTable[k][w] < Int.max, shortPathTable[v][w] > shortPathTable[v][k] + shortPathTable[k][w] {
                    shortPathTable[v][w] = shortPathTable[v][k] + shortPathTable[k][w]
                    pathmatirx[v][w] = pathmatirx[v][k]
                }
            }
        }
    }
    
    //打印最短路径
    var k = 0
    for v in 0..<graphics.vertexes {
        for w in v+1..<graphics.vertexes {
            print("v\(v)-v\(w) weight: \(shortPathTable[v][w])")
            k = pathmatirx[v][w]
            print("path: \(v)")
            while k != w {
                print(" -> \(k)")
                k = pathmatirx[k][w]
            }
            print(" -> \(w)")
        }
        print("\n")
    }
}

ShortestPath_Floyd(graphics: graphics)

//输出结果
[0, 1, 4, 7, 5, 8, 10, 12, 16]   //v0达到各顶点的最短路径
[1, 0, 3, 6, 4, 7, 9, 11, 15]
[4, 3, 0, 3, 1, 4, 6, 8, 12]
[7, 6, 3, 0, 2, 5, 3, 5, 9]
[5, 4, 1, 2, 0, 3, 5, 7, 11]
[8, 7, 4, 5, 3, 0, 7, 5, 9]
[10, 9, 6, 3, 5, 7, 0, 2, 6]
[12, 11, 8, 5, 7, 5, 2, 0, 4]
[16, 15, 12, 9, 11, 9, 6, 4, 0]
//前驱矩阵
[0, 1, 1, 1, 1, 1, 1, 1, 1]
[0, 1, 2, 2, 2, 2, 2, 2, 2]
[1, 1, 2, 4, 4, 4, 4, 4, 4]
[4, 4, 4, 3, 4, 4, 6, 6, 6]
[2, 2, 2, 3, 4, 5, 3, 3, 3]
[4, 4, 4, 4, 4, 5, 7, 7, 7]
[3, 3, 3, 3, 3, 7, 6, 7, 7]
[6, 6, 6, 6, 6, 5, 6, 7, 8]
[7, 7, 7, 7, 7, 7, 7, 7, 8]
```
- 说明：获取v0->v8的最短路径，则P[0][8] = 1，P[1][8] = 2，P[2][8] = 4，P[4][8] = 3，P[3][8] = 6，P[6][8] = 7，P[7][8] = 8，所以，v0->v8的最短路径为：v0->v1->v2->v4->v3->v6->v7-V8。

- **两个算法总结：**
如果只需求其中两个顶点之间的最短路径，采用迪杰斯特拉算法；如果需要求所有顶点到所有顶点的最短路径，可以采用佛洛依德算法，虽然，两个算法计算所有顶点到所有顶点的最短路径的时间复杂度都是O(n^3)，但是佛洛依德算法比较简洁，不易出错。

### 拓扑结构
>在一个表示工程的有向图中，用顶点表示活动，用弧表示活动之间的优先关系，这样的有向图表示的网，称为AOV网（Activity On vertex Network）。假设G=(V,E)是一个具有n个顶点的有向图，V中的顶点序列v1, v2, v3, ...... , Vn，满足若从顶点vi到vj有一条路径，则中顶点序列中顶点vi必须在vj之前，我们称这样的顶点序列为一个拓扑序列。拓扑排序，就是对一个有向图构造拓扑序列的过程。拓扑序列的主要作用是确定一个有向图确定的有序序列，比如：iOS开发使用拓扑序列来整理整个工程的文件依赖，比如检查循环依赖，比如确认从那个依赖文件开始编译等等。两个特点：1.无环有向图 2.两个顶点之间的方向只有一个。

![AVO图.png](https://upload-images.jianshu.io/upload_images/968977-ea591cafb180a6f1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![AVO图链表表示.png](https://upload-images.jianshu.io/upload_images/968977-b80bdf4854995576.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
extension Int {
    static func += (left: inout Int, right: Int) {
        left = left + right
    }
    
    static func -= (left: inout Int, right: Int) {
        left = left - right
    }
}

//边表结点
class EdgeNode {
    var adjex = 0
    var weight = 1
    var next: EdgeNode?
}

//顶点表结点
class VertexNode {
    var inEdge = 0
    var data = 0
    var firstEdge: EdgeNode?
}

class GraphAdjList {
    var adjList: [VertexNode] = []
    var numEdges = 0
    var numVertexes : Int {
        return adjList.count
    }
}

let graphiAdjList = GraphAdjList()

//V0
let v0 = VertexNode()
v0.inEdge = 0
v0.data = 0

let v0E11 = EdgeNode()
v0E11.adjex = 11
let v0E5 = EdgeNode()
v0E5.adjex = 5
let v0E4 = EdgeNode()
v0E4.adjex = 4

v0.firstEdge = v0E11
v0E11.next = v0E5
v0E5.next = v0E4

//V1
let v1 = VertexNode()
v1.inEdge = 0
v1.data = 1

let v1E8 = EdgeNode()
v1E8.adjex = 8
let v1E4 = EdgeNode()
v1E4.adjex = 4
let v1E2 = EdgeNode()
v1E2.adjex = 2

v1.firstEdge = v1E8
v1E8.next = v1E4
v1E4.next = v1E2

//V2
let v2 = VertexNode()
v2.inEdge = 2
v2.data = 2

let v2E9 = EdgeNode()
v2E9.adjex = 9
let v2E6 = EdgeNode()
v2E6.adjex = 6
let v2E5 = EdgeNode()
v2E5.adjex = 5

v2.firstEdge = v2E9
v2E9.next = v2E6
v2E6.next = v2E5

//V3
let v3 = VertexNode()
v3.inEdge = 0
v3.data = 3

let v3E13 = EdgeNode()
v3E13.adjex = 13
let v3E2 = EdgeNode()
v3E2.adjex = 2

v3.firstEdge = v3E13
v3E13.next = v3E2

//V4
let v4 = VertexNode()
v4.inEdge = 2
v4.data = 4

let v4E7 = EdgeNode()
v4E7.adjex = 7

v4.firstEdge = v4E7

//V5
let v5 = VertexNode()
v5.inEdge = 3
v5.data = 5

let v5E12 = EdgeNode()
v5E12.adjex = 12
let v5E8 = EdgeNode()
v5E8.adjex = 8

v5.firstEdge = v5E12
v5E12.next = v5E8

//V6
let v6 = VertexNode()
v6.inEdge = 1
v6.data = 6

let v6E5 = EdgeNode()
v6E5.adjex = 5

v6.firstEdge = v6E5

//V7
let v7 = VertexNode()
v7.inEdge = 2
v7.data = 7

//V8
let v8 = VertexNode()
v8.inEdge = 2
v8.data = 8

let v8E7 = EdgeNode()
v8E7.adjex = 7

v8.firstEdge = v8E7

//V9
let v9 = VertexNode()
v9.inEdge = 2
v9.data = 9

let v9E11 = EdgeNode()
v9E11.adjex = 11
let v9E10 = EdgeNode()
v9E10.adjex = 10

v9.firstEdge = v9E11
v9E11.next = v9E10

//V10
let v10 = VertexNode()
v10.inEdge = 1
v10.data = 10

let v10E13 = EdgeNode()
v10E13.adjex = 13

v10.firstEdge = v10E13

//V11
let v11 = VertexNode()
v11.inEdge = 2
v11.data = 11

//V12
let v12 = VertexNode()
v12.inEdge = 1
v12.data = 12

let v12E9 = EdgeNode()
v12E9.adjex = 9

v12.firstEdge = v12E9

//V13
let v13 = VertexNode()
v13.inEdge = 2
v13.data = 13

graphiAdjList.adjList.append(v0)
graphiAdjList.adjList.append(v1)
graphiAdjList.adjList.append(v2)
graphiAdjList.adjList.append(v3)
graphiAdjList.adjList.append(v4)
graphiAdjList.adjList.append(v5)
graphiAdjList.adjList.append(v6)
graphiAdjList.adjList.append(v7)
graphiAdjList.adjList.append(v8)
graphiAdjList.adjList.append(v9)
graphiAdjList.adjList.append(v10)
graphiAdjList.adjList.append(v11)
graphiAdjList.adjList.append(v12)
graphiAdjList.adjList.append(v13)

func toPologicalSort(gl: GraphAdjList) {
    var count = 0, top = 0, k = 0, getTop = 0
    var stack: [Int] = []
    //将有向图所有入度为0的顶点入栈
    for i in 0..<gl.numVertexes {
        if gl.adjList[i].inEdge == 0 {
            stack.append(i)
            top += 1
        }
    }
    //开始算拓扑序列
    while top != 0 {
        getTop = stack.removeLast()
        top -= 1
        print("vertex: \(gl.adjList[getTop].data)")
        count += 1
        var edgeNode = gl.adjList[getTop].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            gl.adjList[k].inEdge -= 1
            if gl.adjList[k].inEdge == 0 {
                stack.append(k)
                top += 1
            }
            edgeNode = edgeNode?.next
        }
    }
    
    if count < gl.numVertexes {
        print("Error")
    } else {
        print("OK")
    }
}

toPologicalSort(gl: graphiAdjList)
//输出结果
vertex: 3
vertex: 1
vertex: 2
vertex: 6
vertex: 0
vertex: 4
vertex: 5
vertex: 8
vertex: 7
vertex: 12
vertex: 9
vertex: 10
vertex: 13
vertex: 11
```
- 拓扑排序并不是唯一的
- 拓扑排序简要说明：

1.先找到所有入度为0的顶点，并依次进栈。
2.从栈顶开始，出栈；然后，遍历该栈顶元素的链表，每个顶点的入度减1，判断每个顶点的入度是否为0，如果为0则入栈，否则跳过。
3.判断栈是否还有元素，如果栈不为空，则回到第2步，否则，结束。

### 关键路径
>拓扑排序解决一个工程能否顺利进行的问题，那么，关键路径就是解决工程完成需要的最短时间问题。在一个表示工程的带权有向图中，用顶点表示事件，用有向边表示活动，用边上的权值表示活动的持续时间，这种有向图的边表示活动的网，我们称之为 **AOE网** (Activity On Edge Network) 。 我们把AOE网中没有人边的顶点称为始点或源点，没有出边的顶点称为终点或汇点。我们把路径上各个活动所持续的时间之和称为路径长度，从源点到汇点具有最大长度的路径叫关键路径，在关键路径上的活动叫关键活动。

![AOE图.png](https://upload-images.jianshu.io/upload_images/968977-c61b3a2fdc82af3f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![AOE链表显示.png](https://upload-images.jianshu.io/upload_images/968977-91337380c0b3772a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
//V0
let v0 = VertexNode()
v0.inEdge = 0
v0.data = 0

let v0E2 = EdgeNode()
v0E2.adjex = 2
v0E2.weight = 4
let v0E1 = EdgeNode()
v0E1.adjex = 1
v0E1.weight = 3

v0.firstEdge = v0E2
v0E2.next = v0E1

//V1
let v1 = VertexNode()
v1.inEdge = 1
v1.data = 1

let v1E4 = EdgeNode()
v1E4.adjex = 4
v1E4.weight = 6
let v1E3 = EdgeNode()
v1E3.adjex = 3
v1E3.weight = 5

v1.firstEdge = v1E4
v1E4.next = v1E3

//V2
let v2 = VertexNode()
v2.inEdge = 1
v2.data = 2

let v2E5 = EdgeNode()
v2E5.adjex = 5
v2E5.weight = 7
let v2E3 = EdgeNode()
v2E3.adjex = 3
v2E3.weight = 8

v2.firstEdge = v2E5
v2E5.next = v2E3

//V3
let v3 = VertexNode()
v3.inEdge = 2
v3.data = 3

let v3E4 = EdgeNode()
v3E4.adjex = 4
v3E4.weight = 3

v3.firstEdge = v3E4

//V4
let v4 = VertexNode()
v4.inEdge = 2
v4.data = 4

let v4E7 = EdgeNode()
v4E7.adjex = 7
v4E7.weight = 4
let v4E6 = EdgeNode()
v4E6.adjex = 6
v4E6.weight = 9

v4.firstEdge = v4E7
v4E7.next = v4E6

//V5
let v5 = VertexNode()
v5.inEdge = 1
v5.data = 5

let v5E7 = EdgeNode()
v5E7.adjex = 7
v5E7.weight = 6

v5.firstEdge = v5E7

//V6
let v6 = VertexNode()
v6.inEdge = 1
v6.data = 6

let v6E9 = EdgeNode()
v6E9.adjex = 9
v6E9.weight = 2

v6.firstEdge = v6E9

//V7
let v7 = VertexNode()
v7.inEdge = 2
v7.data = 7

let v7E8 = EdgeNode()
v7E8.adjex = 8
v7E8.weight = 5

v7.firstEdge = v7E8

//V8
let v8 = VertexNode()
v8.inEdge = 1
v8.data = 8

let v8E9 = EdgeNode()
v8E9.adjex = 9
v8E9.weight = 3

v8.firstEdge = v8E9

//V9
let v9 = VertexNode()
v9.inEdge = 2
v9.data = 9

let graphiAdjList = GraphAdjList()

graphiAdjList.adjList.append(v0)
graphiAdjList.adjList.append(v1)
graphiAdjList.adjList.append(v2)
graphiAdjList.adjList.append(v3)
graphiAdjList.adjList.append(v4)
graphiAdjList.adjList.append(v5)
graphiAdjList.adjList.append(v6)
graphiAdjList.adjList.append(v7)
graphiAdjList.adjList.append(v8)
graphiAdjList.adjList.append(v9)

//etv(earliest time of vertex) => 顶点V的最早发生时间
//ltv(latest time of vertex) => 顶点V的最迟发生时间
//ete(earliest time of edge) => 弧a的最早发生时间
//lte(latest time of edge) => 弧a的最迟发生时间

var etv: [Int] = Array(repeating: 0, count: graphiAdjList.numVertexes)
var ltv: [Int] = []
var stack2: [Int] = []
var top2 = 0

func TopologicalSort(gl: GraphAdjList) {
    var count = 0, top = 0, k = 0, getTop = 0
    var stack: [Int] = []
    //将有向图所有入度为0的顶点入栈
    for i in 0..<gl.numVertexes {
        if gl.adjList[i].inEdge == 0 {
            stack.append(i)
            top += 1
        }
    }
    //开始算拓扑序列
    while top != 0 {
        getTop = stack.removeLast()
        top -= 1
        count += 1
        /////////////////////
        stack2.append(getTop)  //添加入度为0的顶点
        top2 += 1
        ////////////////////
        var edgeNode = gl.adjList[getTop].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            gl.adjList[k].inEdge -= 1
            if gl.adjList[k].inEdge == 0 {
                stack.append(k)
                top += 1
            }
            /////////////////////////////////////////////
            if etv[getTop]+(edgeNode?.weight)! > etv[k] {   //顶点的最早发生时间，即到达这个顶点之前最大的花费时间
                etv[k] = etv[getTop]+(edgeNode?.weight)!
            }
            /////////////////////////////////////////////
            edgeNode = edgeNode?.next
        }
    }
    
    if count < gl.numVertexes {
        print("Error")
    } else {
        print("OK")
    }
}

func CriticalPath(gl: GraphAdjList) {
    var getTop = 0, k = 0
    var ete = 0, lte = 0
    TopologicalSort(gl: gl)  //求拓扑序列，计算数组etv和stack2
    //   etv: [0, 3, 4, 12, 15, 11, 24, 19, 24, 27]
    //stack2: [v0, v1, v2, v3, v4, v5, v6, v7, v8, v9]
    for _ in 0..<gl.numVertexes {
        ltv.append(etv[gl.numVertexes-1])  //初始化ltv为27
    }
    while top2 != 0 {
        getTop = stack2.removeLast()
        top2 -= 1
        var edgeNode = gl.adjList[getTop].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            if ltv[k]-(edgeNode?.weight)! < ltv[getTop] {
                ltv[getTop] = ltv[k]-(edgeNode?.weight)!  //取最小值，才不会影响该顶点到达其他顶点的时间，也就是最迟发生的时间
            }
            edgeNode = edgeNode?.next
        }
    }
    for j in 0..<gl.numVertexes {
        var edgeNode = gl.adjList[j].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            ete = etv[j]
            lte = ltv[k]-(edgeNode?.weight)!
            if ete == lte {
                print("<\(gl.adjList[j].data), \(gl.adjList[k].data) length: \((edgeNode?.weight)!)>")
            }
            edgeNode = edgeNode?.next
        }
    }
}

输出结果：
<0, 2 length: 4>
<2, 3 length: 8>
<3, 4 length: 3>
<4, 7 length: 4>
<7, 8 length: 5>
<8, 9 length: 3>
```
- 关键点：
1.etv的计算：比如计算v9点最早开始的时间，那么需要计算终点是v9的所有点的权值，取最大的权值，是因为，在这个点开始，v9之前的所有活动都刚刚结束，也就是说保证v9之前所有活动完成之后才是v9最早开始的时间。
![etv计算公式.png](https://upload-images.jianshu.io/upload_images/968977-106865fdfaf5e0ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.ltv的计算：由etv可以知道终点的最早开始时间，那么所有点以这个为初始值，因为最迟开始的时间不可能大于终点最早的开始时间。那么，ltv的计算从终点开始，往回推。比如说要计算v8最迟开始的时间，因为v8需要3天时间工作，那么在保证v8工作完成时不影响v9的工作，那么v8最迟开始的工作时间就是v9最早工作时间减去v8需要的时间。比如说v4，经过v4会到达多个顶点，需要保证不影响所达到的多个的工作时间，那么v4开始的时间就是v4所经过的过个顶点最早的开始时间分别减去v4所需要的时间，取最小的开始时间，才会不影响之后所有的顶点的最早开始时间。
![ltv计算公式.png](https://upload-images.jianshu.io/upload_images/968977-c1b4a3a198335923.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.ete本来是表示活动 <vk，vj>的最早开工时间，是针对弧来说
的。但只有此弧的弧尾顶点vk的事件发生了，它才可以开始，因此 ete=etv[k]；lte 表示的是活动<vk，vj>的最晚开工时间，但此活动再晚也不能等 vj事件发生才开始，而必须要在vj事件之前发生，所以 lte=ltv[j]-len<vk，vj>。

# 总结：
写这个数据结果，断断续续奋战了几个星期，总算一点一点的把它啃完。敲代码的基础很重要，就像盖房子一样，基础不牢固，建不起高楼大厦。后面会继续推出，算法，设计模式，编译原理，操作系统等等一些列的学习笔记。这世界很大，需要保持一点好奇心😄。最后，献上[Demo](https://github.com/jashion/Joy-of-data-structure)。
