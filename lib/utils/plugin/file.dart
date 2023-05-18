part of util.plugin;

// 文件json形式读取保存
class FileJson {
  // 读取json
  static Future<List<Map>> getTempMapList(String keyPath) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    File registerFile = File("$tempPath/$keyPath");

    try {
      String fileJsonStr = registerFile.readAsStringSync();
      List fileJson = jsonDecode(fileJsonStr);

      return fileJson.map((value) {
        Map dataMap = json.decode(value);
        return dataMap;
      }).toList();
    } on FileSystemException {
      return [];
    }
  }

  // 写入json到文件
  static Future<void> saveTempMapList(List<Map> list, String keyPath) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File registerFile = File("$tempPath/$keyPath");

    List<String> content = list.map((value) {
      return json.encode(value);
    }).toList();

    String contentStr = jsonEncode(content);
    registerFile.writeAsStringSync(contentStr);
  }
}
