import 'dart:convert';
import 'package:myapp/models/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountService {
  static Future<ListAccount?> fetchAccounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accountsString = prefs.getString('accounts');
    if (accountsString != null) {
      final List<dynamic> jsonList = jsonDecode(accountsString);
      return ListAccount.fromJson(jsonList);
    }
    return null;
  }

  static Future<void> saveAccounts(ListAccount accounts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accounts', jsonEncode(accounts.toJson()));
  }
}
