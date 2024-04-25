//list account data

import 'package:myapp/models/account.dart';

class AccountData {
  static final List<Account> _listAccount = [
    Account(
      username: 'admin',
      password: 'admin',
    ),
  ];

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
  static bool addAccount(Account account) {
    if (!isAccountExist(account.username)) {
      _listAccount.add(account);
      return true;
    }
    return false;
  }

  // Update an account
  static void updateAccount(Account account) {
    final index = _listAccount
        .indexWhere((element) => element.username == account.username);
    if (index != -1) {
      _listAccount[index] = account;
    }
  }
}
