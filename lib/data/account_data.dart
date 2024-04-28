//list account data

import 'package:myapp/models/account_model.dart';

class AccountData {
  static late List<AccountModel> _listAccount;

  static void init() {
    _listAccount = [
      AccountModel(
        username: 'admin',
        password: 'admin',
      ),
    ];
  }

  // Check if the account exists
  static bool isAccountExist(String username) {
    return _listAccount.any((element) => element.username == username);
  }

  // Check if the account is valid
  static bool isAccountValid(String username, String password) {
    return _listAccount.any((element) =>
        element.username == username && element.password == password);
  }

  // Add an account if it does not exist
  static bool addAccount(AccountModel account) {
    if (!isAccountExist(account.username)) {
      _listAccount.add(account);
      return true;
    }
    return false;
  }

  // Update an account
  static void updateAccount(AccountModel account) {
    final index = _listAccount
        .indexWhere((element) => element.username == account.username);
    if (index != -1) {
      _listAccount[index] = account;
    }
  }
}
