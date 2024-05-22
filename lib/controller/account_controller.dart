import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/models/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  final accounts = ListAccount(data: []).obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchAccounts();
    super.onInit();
  }

  Future<void> fetchAccounts() async {
    isLoading(true);
    final accountsData = await AccountService.fetchAccounts();
    if (accountsData != null) {
      accounts(accountsData);
    }
    isLoading(false);
  }

  Future<bool> isAccountExist(String username) async {
    return accounts.value.data.any((account) => account.username == username);
  }

  Future<bool> isAccountValid({
    required String username,
    required String password,
    Function(bool)? onComplete,
  }) async {
    final account = accounts.value.data.firstWhereOrNull(
      (account) => account.username == username,
    );
    if (account == null) {
      onComplete!(false);
      return false;
    }
    onComplete!(account.password == password);
    return account.password == password;
  }

  Future<void> addAccount(
      {required Account newAccount, Function? onComplete}) async {
    String message = 'Account already exists';
    bool isSuccessful = false;
    if (!await isAccountExist(newAccount.username)) {
      try {
        accounts.update((val) {
          val?.data.add(newAccount);
        });
        await AccountService.saveAccounts(accounts.value);
        message = 'Successful account registration';
        isSuccessful = true;
      } catch (e) {
        message = 'Failed to register account';
      }
    }
    onComplete!(message, isSuccessful);
  }

  Account? getAccountByUsername(String username) {
    return accounts.value.data.firstWhereOrNull(
      (account) => account.username == username,
    );
  }

  List<String> getFavouriteList(String username) {
    final account = getAccountByUsername(username);
    return account?.favourite ?? [];
  }

  void addFavourite(String username, String comicId) async {
    accounts.update((val) {
      final account = val?.data.firstWhereOrNull(
        (account) => account.username == username,
      );
      account?.favourite.add(comicId);
    });
    AccountService.saveAccounts(accounts.value);
  }

  void removeFavourite(String username, String comicId) async {
    accounts.update((val) {
      final account = val?.data.firstWhereOrNull(
        (account) => account.username == username,
      );
      account?.favourite.remove(comicId);
    });
    AccountService.saveAccounts(accounts.value);
  }
}

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
