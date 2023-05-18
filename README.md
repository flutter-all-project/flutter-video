# flutter_video

A new Flutter project.

## go_router

```dart
 获取当前路由名字及参数的合并值
context.namedLocation('home');

 RouteMatch
debugPrint("${GoRouter.of(context).routerDelegate.currentConfiguration}");

 将会打印出最后一个,也就`当前子路由的位置
debugPrint(GoRouter.of(context).routerDelegate.currentConfiguration.last.matchedLocation);

 获取当前路由的完整路径
debugPrint(GoRouter.of(context).location);
```

## Object.hash()

此对象的哈希码。
原来 int get hashCode => hashValues(baseUrl, channel); 的解释，现在更改为使用 Object.hash()：

1. 就像默认的[operator == xx] 实现只在对象相同时认为它们是相等的
2. 如果[operator == xx] 被重写以使用对象状态，则必须更改哈希代码以表示该状态，否则该对象不能用于默认的[Set]和[Map]实现等基于哈希的数据结构中
3. 对于根据[operator == xx] 相等的对象，哈希码必须相同。对象的哈希码只应在对象以影响相等性的方式更改时才更改
4. 如果一个子类重写[hashCode]，它也应该重写[operator ==]操作符以保持一致性。
5. 不相等的对象可以具有相同的码。允许所有实例具有相同的哈希代码，但如果冲突发生得太频繁，会降低基于哈希的数据结构(如[HashSet]或[HashMap])的效率

```dart
  // operator == hashCode 只是写这里为了查看
  class xx {
    @override
    bool operator ==(other) {
        // 检查两个引用是否指向同一个对象
        if (identical(this, other)) return true;
        if (runtimeType != other.runtimeType) return false;

        final dynamic typedOther = other;

        return typedOther.baseUrl == baseUrl && typedOther.channel == channel;
    }
  }
```
