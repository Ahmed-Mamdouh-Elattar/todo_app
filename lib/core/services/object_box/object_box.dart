import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  static ObjectBox? _instance;
  late final Store _store;
  ObjectBox._();
  static ObjectBox get instance {
    return _instance ??= ObjectBox._();
  }

  Future<void> init() async {
    _store = await openStore();
  }

  Store get store => _store;
  void close() {
    _store.close();
  }
}
