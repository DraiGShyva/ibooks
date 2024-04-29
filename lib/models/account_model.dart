class AccountModel {
  final String username;
  final String password;
  final String? email;
  final String? phone;
  final String? address;
  final String role;
  final String status;
  final List favourite;

  AccountModel({
    required this.username,
    required this.password,
    this.email,
    this.phone,
    this.address,
    this.role = 'user',
    this.status = 'active',
    required this.favourite,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        username: json['username'],
        password: json['password'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        role: json['role'],
        status: json['status'],
        favourite: json['favourite'],
      );

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
