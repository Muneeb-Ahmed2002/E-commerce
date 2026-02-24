class Validators {
  static String mockEmail = "test@gmail.com";
  static String mockPassword = '123456';

  static String? emailValidator(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!emailRegex.hasMatch(value)) {
      return 'Email is not valid';
    } else if (value != mockEmail) {
      return 'Email not found';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at Least 6 characters";
    } else if (value != mockPassword) {
      return "Invalid Password";
    }
    return null;
  }
}
