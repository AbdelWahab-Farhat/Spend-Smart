
abstract class Validator {
  static String? newCategoryNameValidator(String? input) {
    // Check if the input is null or empty
    if (input == null || input.trim().isEmpty) {
      return 'Name cannot be empty';
    }

    // Check if the input is at least 3 characters long
    if (input.length < 3) {
      return 'Name must be at least 3 characters long';
    }

    // Check if the input contains any digits
    if (input.contains(RegExp(r'\d'))) {
      return 'Name cannot contain numbers';
    }

    // If all conditions are met, return null (no error)
    return null;
  }

  static String? amountValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount cannot be empty';
    }

    final numberRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!numberRegExp.hasMatch(value)) {
      return 'Enter a valid amount';
    }

    return null; // Return null if validation is successful
  }
  static String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description cannot be empty';
    }

    if (value.length < 3) {
      return 'Description must be at least 3 characters long';
    }

    final numberRegExp = RegExp(r'[0-9]');
    if (numberRegExp.hasMatch(value)) {
      return 'Description cannot contain numbers';
    }

    return null; // Return null if validation is successful
  }
}