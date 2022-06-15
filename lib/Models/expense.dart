// ignore_for_file: non_constant_identifier_names

class ExpenseModel {
  String id = "";
  String user_id = "";
  String total_expense = "";
  String rent = "";
  String gym = "";
  String shopping = "";
  String food = "";
  String transportation = "";
  String subscription = "";
  String other = "";
  String rent_description = "";
  String gym_description = "";
  String shopping_description = "";
  String food_description = "";
  String transportation_description = "";
  String subscription_description = "";
  String other_description = "";
  
  ExpenseModel();

  ExpenseModel.toModel(Map<dynamic, dynamic> jsonMap) {
    total_expense = jsonMap['total_expense'] ?? "";
    rent = jsonMap['rent'] ?? "";
        user_id = jsonMap['user_id'] ?? "";
    other = jsonMap['other'] ?? "";
    gym = jsonMap['gym'] ?? "";
    shopping = jsonMap['shopping'] ?? "";
    food = jsonMap['food'] ?? "";
    transportation = jsonMap['transportation'] ?? "";
    subscription = jsonMap['subscription'] ?? "";
    rent_description = jsonMap['rent_description'] ?? "";
    other_description = jsonMap['other_description'] ?? "";
    gym_description = jsonMap['gym_description'] ?? "";
    shopping_description = jsonMap['shopping_description'] ?? "";
    food_description = jsonMap['food_description'] ?? "";
    transportation_description = jsonMap['transportation_description'] ?? "";
    subscription_description = jsonMap['subscription_description'] ?? "";
    id = jsonMap['id'] ?? "";
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['id'] = id;
    jsonMap['user_id'] = user_id;
    jsonMap['other'] = other;
    jsonMap['rent'] = rent;
    jsonMap['gym'] = gym;
    jsonMap['shopping'] = shopping;
    jsonMap['food'] = food;
    jsonMap['transportation'] = transportation;
    jsonMap['subscription'] = subscription;
    jsonMap['other_description'] = other_description;
    jsonMap['rent_description'] = rent_description;
    jsonMap['gym_description'] = gym_description;
    jsonMap['shopping_description'] = shopping_description;
    jsonMap['food_description'] = food_description;
    jsonMap['transportation_description'] = transportation_description;
    jsonMap['subscription_description'] = subscription_description;
    jsonMap['total_expense'] = total_expense;
    return jsonMap;
  }
}
