class Account {
  final String username;
  String password;
  final List<String> favourite;
  String avatar;

  Account({
    required this.username,
    required this.password,
    required this.favourite,
    this.avatar = '',
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        username: json['username'],
        password: json['password'],
        favourite: List<String>.from(json['favourite']),
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'favourite': favourite,
        'avatar': avatar,
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
    for (var element in data) {
      listAccount.add(element.toJson());
    }
    return listAccount;
  }
}
