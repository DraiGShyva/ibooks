class Account {
  final String username;
  final String password;
  final List<String> favourite;

  Account({
    required this.username,
    required this.password,
    required this.favourite,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        username: json['username'],
        password: json['password'],
        favourite: List<String>.from(json['favourite']),
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'favourite': favourite,
      };
}

class ListAccount {
  final List<Account> data;

  ListAccount({required this.data});

  factory ListAccount.fromJson(List<dynamic> json) {
    List<Account> listAccount = [];
    for (var element in json) {
      listAccount.add(Account.fromJson(element));
    }
    return ListAccount(data: listAccount);
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> listAccount = [];
    for (var element in this.data) {
      listAccount.add(element.toJson());
    }
    return listAccount;
  }
}
