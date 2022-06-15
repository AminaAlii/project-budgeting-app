class UserModel {
  String id = "";
  String email = "";
  String firstName = "";
  String phoneNumber = "";
  DateTime dob = DateTime.now();
  String image = '';

  UserModel();

  UserModel.toModel(Map<String, dynamic> jsonMap) {
    email = jsonMap['email'] ?? "";
    id = jsonMap['id'] ?? "";
    firstName = jsonMap['firstName'] ?? "";

    phoneNumber = jsonMap['phoneNumber'] ?? "";
    dob = jsonMap['dob'] == null ? DateTime.now() : jsonMap['dob'].toDate();

    image = jsonMap['image'] ?? "";
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['id'] = id;
    jsonMap['email'] = email;
    jsonMap['firstName'] = firstName;
    jsonMap['phoneNumber'] = phoneNumber;
    jsonMap['dob'] = dob;
    jsonMap['image'] = image;
    jsonMap['searchParameter'] = generateArray(firstName.toLowerCase());
    return jsonMap;
  }

  List<String> generateArray(String name) {
    name = name.toLowerCase();
    List<String> list = [];
    for (int i = 0; i < name.length; i++) {
      list.add(name.substring(0, i + 1));
    }
    return list;
  }
}
