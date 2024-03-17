class Account {
  String? email;
  String? password;

  Account({this.email, this.password});

  @override
  String toString() {
    return "${email!} ${password!}";
  }
}
