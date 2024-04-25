class Account {
  String username;
  String password;
  String? email;
  String? phone;
  String? address;
  String role;
  String status;

  Account(
      {required this.username,
      required this.password,
      this.email,
      this.phone,
      this.address,
      this.role = 'user',
      this.status = 'active'});

  factory Account.fromJson(Map<String, dynamic> json) => Account(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      role: json['role'],
      status: json['status']);

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
        'phone': phone,
        'address': address,
        'role': role,
        'status': status
      };
}
