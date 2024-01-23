class Validator {
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return "Username can't be empty";
    }
    // Add any additional username validation logic as needed
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return "Phone number can't be empty";
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return "Enter a valid 10-digit phone number";
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    // Add any additional password validation logic as needed
    return null;
  }
}
