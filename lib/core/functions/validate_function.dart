


class Validator {
  static String? validateNewCategoryName(String? input) {
    // Check if the input is null or empty
    if (input == null || input.trim().isEmpty) {
      return 'Input cannot be empty';
    }

    // Check if the input is at least 3 characters long
    if (input.length < 3) {
      return 'Input must be at least 3 characters long';
    }

    // Check if the input contains any digits
    if (input.contains(RegExp(r'\d'))) {
      return 'Input cannot contain numbers';
    }

    // If all conditions are met, return null (no error)
    return null;
  }
}