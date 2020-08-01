class InputsValidator {
  static const int defaultValidationLength = 3;
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  String validateEmail(String str) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(str);
    if (!emailValid) {
      return 'Email invalid';
    } else {
      return null;
    }
  }

  String validateLength(String str, {int length = defaultValidationLength}) {
    if (str.length <= length) {
      return 'Must be more than $length symbols';
    } else {
      return null;
    }
  }
}

final inputsValidator = InputsValidator();
