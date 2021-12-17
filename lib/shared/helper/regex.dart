import 'package:get/get_utils/src/get_utils/get_utils.dart';

double getNumberFromString(String value) {
  final data = value.replaceAll(new RegExp(r'[^0-9]'), '');
  return double.parse(data);
}

bool isValidEmail({required String email}) {
  if (email.isEmpty) {
    return false;
  }

  bool pattern = email.contains(
      new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$"));

  return pattern;
}

bool isValidPassword({required String password, int minLength = 8}) {
  if (password.isEmpty) {
    return false;
  }

  bool capitalFirst = password.substring(0, 1).contains(new RegExp(r'[A-Z]'));
  bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length >= minLength;

  return capitalFirst &&
      hasDigits &&
      hasUppercase &&
      hasLowercase &&
      hasMinLength &&
      hasSpecialCharacters;
}

bool isValidConfirmPassword(
    {required String password,
    required String confirmPassword,
    int minLength = 8}) {
  if (confirmPassword.isEmpty) {
    return false;
  }
  bool samePassword = confirmPassword == password;
  bool capitalFirst =
      confirmPassword.substring(0, 1).contains(new RegExp(r'[A-Z]'));
  bool hasUppercase = confirmPassword.contains(new RegExp(r'[A-Z]'));
  bool hasDigits = confirmPassword.contains(new RegExp(r'[0-9]'));
  bool hasLowercase = confirmPassword.contains(new RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      confirmPassword.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = confirmPassword.length >= minLength;

  return capitalFirst &&
      hasDigits &&
      hasUppercase &&
      hasLowercase &&
      hasMinLength &&
      hasSpecialCharacters &&
      samePassword;
}

bool isValidUsername({required String username, int minLength = 8}) {
  if (username.isEmpty) {
    return false;
  }

  // bool hasUppercase = username.contains(new RegExp(r'[A-Z]'));
  // bool hasDigits = username.contains(new RegExp(r'[0-9]'));
  // bool hasLowercase = username.contains(new RegExp(r'[a-z]'));
  // bool hasSpecialCharacters = username.contains(new RegExp(r'[!@#$%^&*()]'));
  bool hasSpecialCharacters = username.contains(new RegExp(r'[-+~<>?]'));
  bool hasMinLength = username.length >= minLength;
  bool hasSpace = username.contains(' ');
  bool noAlphanumeric =
      RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(username);

  // return hasDigits &
  //     hasUppercase &
  //     hasLowercase &
  //     hasMinLength &
  //     hasSpecialCharacters;
  return hasMinLength && !hasSpecialCharacters && !hasSpace && !noAlphanumeric;
}

bool isValidName({required String name, int minLength = 3}) {
  if (name.isEmpty) {
    return false;
  }
  bool hasSpecialCharacters = name.contains(new RegExp(r'[-+~<>?]'));
  bool hasDigits = name.contains(new RegExp(r'[0-9]'));
  bool hasMinLength = name.length >= minLength;

  return hasMinLength && !hasSpecialCharacters && !hasDigits;
}

bool isValidDate({required String date, int minLength = 10}) {
  if (date.isEmpty) {
    return false;
  }
  bool hasMinLength = date.length >= minLength;

  return hasMinLength;
}

bool isValidAccountNo({required String acoountNo, int maxLength = 10}) {
  if (acoountNo.isEmpty) {
    return false;
  }
  bool hasSpecialCharacters =
      acoountNo.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMaxLength = acoountNo.length <= maxLength;
  bool hasDigits = acoountNo.contains(new RegExp(r'[0-9]'));

  return hasMaxLength && hasDigits && !hasSpecialCharacters;
}

bool isValidIdNumber({required String idNumber, int minLength = 16}) {
  if (idNumber.isEmpty) {
    return false;
  }
  bool hasSpecialCharacters =
      idNumber.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = idNumber.length >= minLength;
  bool hasDigits = idNumber.contains(new RegExp(r'[0-9]'));

  return hasMinLength && hasDigits && !hasSpecialCharacters;
}

bool isValidPhoneNumber({required String phoneNumber, int minLength = 9}) {
  return GetUtils.isPhoneNumber(phoneNumber);
}

String phoneNumberFormat({required String phone}) {
  String number = phone
      .replaceAll(new RegExp(r'[^\w\s]+'), '')
      .replaceAll(new RegExp(r"\s\b|\b\s"), "");
  number = number.replaceFirst('62', '0');
  return number;
}

bool isValidNotEmpty({required String data}) {
  if (data.isEmpty) {
    return false;
  }
  return true;
}
