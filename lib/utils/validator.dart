import 'form_validator.dart';

class Validator {
  // Private constructor to prevent instantiation
  Validator._();

  // Validator for required fields
  static final requiredValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
  ]);

  // Validator for double values
  static final doubleValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    DoubleValidator(errorText: 'This field must be a number'),
  ]);

  // Validator for non-zero values
  static final checkValueValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    CheckValueValidator(errorText: 'Field must be a number other than 0'),
  ]);

  // Validator for passwords with minimum length
  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    MinLengthValidator(6,
        errorText: 'Password must be at least 6 characters long'),
  ]);

  // Validator for email addresses
  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    EmailValidator(errorText: 'Invalid email address'),
  ]);

  // Validator for confirming password match
  static MultiValidator confirmPasswordValidator(String? password) =>
      MultiValidator([
        RequiredValidator(errorText: 'This field is required'),
        MatchValidator(password, errorText: 'Passwords do not match'),
      ]);
}
