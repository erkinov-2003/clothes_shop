class SignInValidator {
  static String? emailValidation(String value) {
    if (value.isEmpty) {
      return "Iltimos email bo'sh qoldirmang!";
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim())) {
      return "Iltimos email tog'ri yozing test@gmail.com !";
    } else {
      return null;
    }
  }

  static String? passwrodValidation(String value) {
    if (value.isEmpty) {
      return "Iltimos password bosh qoldirmang!";
    } else if (value.length < 8) {
      return "8 tadan kop so'z bo'lsin";
    } else {
      return null;
    }
  }
}
