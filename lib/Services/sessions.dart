import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

setBoxStorage(String key, value) async {
  await box.write(key, value);
}

getBoxStorage(String key) {
  return box.read(key);
}

clearBoxStorage() async {
  return await box.erase();
}
