class ValidationUtils {
  static bool isValidEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    final emailRegExp = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    if (password.isEmpty) {
      return false;
    }
    // Password validation
    const lengthRequirement = 8;
    final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacter =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return password.length >= lengthRequirement &&
        hasUpperCase &&
        hasLowerCase &&
        hasDigit &&
        hasSpecialCharacter;
  }

  static bool isValidDate(String date) {
    try {
      DateTime.parse(date);
      return true;
    } catch (_) {
      return false;
    }
  }

  static bool isValidBloodPressure(int systolic, int diastolic) {
    // Blood pressure validation
    // Checks if systolic and diastolic values are within a valid range

    final systolicRange = Range(90, 140);
    final diastolicRange = Range(60, 90);

    return systolicRange.contains(systolic) &&
        diastolicRange.contains(diastolic) &&
        systolic >= diastolic;
  }

// todo: Add more validation functions as needed for specific fields
}

class Range {
  final int min;
  final int max;

  Range(this.min, this.max);

  bool contains(int value) {
    return value >= min && value <= max;
  }
}
