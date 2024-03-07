class Account {
  String? username;
  String? password;
  String? email;

  Account({this.username, this.email, this.password});

  @override
  String toString() {
    return "${username!} ${email!} ${password!}";
  }
}
