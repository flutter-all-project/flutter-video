part of util.plugin;

class SpHelper {
  // 命名构造函数,及初始化
  SpHelper._internal();
  // 单例模式
  static final SpHelper _instance = SpHelper._internal();
  // 工厂方法构造函数
  factory SpHelper() => _instance;
  // instance的getter方法，SpHelper.instance获取对象
  static SpHelper get instance => _instance;

  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // 存数据
  static Future<void> setLocalStorage<T>(String key, T value) async {
    String type = value.runtimeType.toString();

    switch (type) {
      case "String":
        await prefs.setString(key, value as String);
        break;
      case "int":
        await prefs.setInt(key, value as int);
        break;
      case "bool":
        await prefs.setBool(key, value as bool);
        break;
      case "double":
        await prefs.setDouble(key, value as double);
        break;
      case "List<String>":
        await prefs.setStringList(key, value as List<String>);
        break;
    }
  }

  // 获取持久化数据
  static T getLocalStorage<T>(String key) {
    dynamic value = prefs.get(key);

    // 如果是字符串就返回json解析后的结果
    if (value.runtimeType.toString() == "String" && _isJson(value)) {
      return json.decode(value);
    }
    return value;
  }

  // 获取任意值的key
  static void getAny(String key) async {
    prefs.get(key);
  }

  /// 获取持久化数据中所有存入的key
  static Set<String> getKeys() {
    return prefs.getKeys();
  }

  /// 获取持久化数据中是否包含某个key
  static bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  /// 删除持久化数据中某个key
  static Future<bool> remove(String key) async {
    return await prefs.remove(key);
  }

  /// 清除所有持久化数据
  static Future<bool> clear() async {
    return await prefs.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  static Future<void> reload() async {
    return await prefs.reload();
  }

  /// 判断是否是json字符串
  static _isJson(String value) {
    try {
      const JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
