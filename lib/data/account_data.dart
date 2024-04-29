import 'package:myapp/models/account_model.dart';

class AccountData {
  static late List<AccountModel> _listAccount;

  static void init() {
    _listAccount = [
      AccountModel(
        username: 'admin',
        password: '123456',
        favourite: [],
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

  // Get favourite list by username
  static List getFavouriteList(String username) {
    final account =
        _listAccount.firstWhere((element) => element.username == username);
    return account.favourite;
  }

  // Add a comic to the favourite list
  static void addFavourite(String username, String comicId) {
    final account =
        _listAccount.firstWhere((element) => element.username == username);
    account.favourite.add(comicId);
  }

  // Remove a comic from the favourite list
  static void removeFavourite(String username, String comicId) {
    final account =
        _listAccount.firstWhere((element) => element.username == username);
    account.favourite.remove(comicId);
  }
}
