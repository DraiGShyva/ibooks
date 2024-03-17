import 'form_validator.dart';

class Validator {
  static final requiredValidator = MultiValidator([
    RequiredValidator(errorText: 'Trường này không được để trống'),
  ]);

  static final doubleValidator = MultiValidator([
    RequiredValidator(errorText: 'Trường này không được để trống'),
    DoubleValidator(errorText: 'Trường này phải là số'),
  ]);

  static final checkValueValidator = MultiValidator([
    RequiredValidator(errorText: 'Trường này không được để trống'),
    CheckValueValidator(errorText: 'Trường phải là một số khác 0'),
  ]);

  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Trường này không được để trống'),
    MinLengthValidator(6, errorText: 'Mật khẩu phải dài ít nhất 6 ký tự'),
  ]);

  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Trường này không được để trống'),
    EmailValidator(errorText: 'Địa chỉ email không hợp lệ'),
  ]);

  static MultiValidator confirmPasswordValidator(String? password) =>
      MultiValidator([
        RequiredValidator(errorText: 'Trường này không được để trống'),
        MatchValidator(password, errorText: 'Mật khẩu xác nhận không khớp'),
      ]);
}
