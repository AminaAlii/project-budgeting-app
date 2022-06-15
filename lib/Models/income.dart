// ignore_for_file: non_constant_identifier_names

class IncomeModel {
  String id = "";
    String user_id = "";

  String total_income = "";
  String salary = "";
  String business = "";
  String interest = "";
  String investment = "";
  String gifts = "";
  String other = "";
  String salary_desc = "";
  String business_desc = "";
  String interest_desc = "";
  String investment_desc = "";
  String gifts_desc = "";
  String other_desc = "";

  IncomeModel();

  IncomeModel.toModel(Map<dynamic, dynamic> jsonMap) {
    total_income = jsonMap['total_incnome'] ?? "";
    salary = jsonMap['salary'] ?? "";
    business = jsonMap['business'] ?? "";
    interest = jsonMap['interest'] ?? "";
    investment = jsonMap['investment'] ?? "";
    gifts = jsonMap['gifts'] ?? "";
    other = jsonMap['other'] ?? "";
    user_id = jsonMap['user_id'] ?? "";

    salary_desc = jsonMap['salary_desc'] ?? "";
    business_desc = jsonMap['business_desc'] ?? "";
    interest_desc = jsonMap['interest_desc'] ?? "";
    investment_desc = jsonMap['investment_desc'] ?? "";
    gifts_desc = jsonMap['gifts_desc'] ?? "";
    other_desc = jsonMap['other_desc'] ?? "";

    id = jsonMap['id'] ?? "";
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> jsonMap = <String, dynamic>{};
    jsonMap['id'] = id;
    jsonMap['user_id'] = user_id;
    jsonMap['salary'] = salary;
    jsonMap['business'] = business;
    jsonMap['interest'] = interest;
    jsonMap['investment'] = investment;
    jsonMap['gifts'] = gifts;
    jsonMap['other'] = other;
    jsonMap['salary_desc'] = salary_desc;
    jsonMap['business_desc'] = business_desc;
    jsonMap['interest_desc'] = interest_desc;
    jsonMap['investment_desc'] = investment_desc;
    jsonMap['gift_desc'] = gifts_desc;
    jsonMap['other_desc'] = other_desc;
    jsonMap['total_incomme'] = total_income;
    return jsonMap;
  }
}
