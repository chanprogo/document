
## new 和 make 的区别？

new 的作用 是 初始化 一个指向类型的指针(*T)  
new 函数是内建函数，函数定义：func new(Type) *Type  
使用 new 函数来分配空间。传递给 new 函数的是一个类型，不是一个值。返回值 是 指向 这个新分配的零值 的指针。  



make 的 作用是为 slice，map 或 chan 初始化 并返回 引用(T)。  
make 函数是 内建函数，函数定义：func make(Type, size IntegerType) Type
第一个参数是一个类型，第二个参数是长度  
返回值是一个类型  

make(T, args) 函数 的 目的 与 new(T) 不同。  
它仅仅用于创建 Slice, Map 和 Channel，并且返回类型 是 T（不是T*） 的 一个初始化的（不是零值） 的 实例。  