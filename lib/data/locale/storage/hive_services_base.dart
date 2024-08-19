import 'package:hive/hive.dart';

abstract class HiveServiceBase<T> {
  Box<T> getBox() => Hive.box(T.toString());

  Future<void> setData({required String key, required T data}) async {
    await getBox().put(key, data);
  }

  T? getData(String key) {
    return getBox().get(key);
  }

  Future<void> deleteData({required String key}) async {
    await getBox().delete(key);
  }

  Future<void> deleteDatas(Iterable<dynamic> keys) async {
    await getBox().deleteAll(keys);
  }

  void setDataEntries({required Map<String, T> map}) {
    getBox().putAll(map);
  }

  List<T> getAll() {
    return getBox().values.toList();
  }

  List<T> getDataList({required List<String> list}) {
    final rList = <T>[];
    for (final key in list) {
      final T? t = getData(key);
      if (t != null) rList.add(t);
    }
    return rList;
  }

  Future<void> initializeModel(TypeAdapter<T> adapter) async {
    Hive.registerAdapter<T>(adapter);
    await openBox();
  }

  Future<Box<T>> openBox() async {
    return Hive.openBox<T>(T.toString());
  }

  Future<void> clearBox() async {
    await getBox().clear();
  }
}
