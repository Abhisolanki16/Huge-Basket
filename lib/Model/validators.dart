
  String? validateField(value) {
    final RegExp nameRegex = RegExp(r'^[a-zA-Z]');
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!nameRegex.hasMatch(value)) {
      return 'Name not valid';
    }
    return null;
  }

  String? validateEmail(value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Email not valid';
    }
    return null;
  }

  String? validatePhoneNumber(value) {
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      } else if (!phoneRegex.hasMatch(value)) {
        return 'Mobile number not valid';
      }
    }
    return null;
  }

  String? validateZipcode(value) {
    final phoneRegex = RegExp(r'^[0-9]{6}$');
    {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      } else if (!phoneRegex.hasMatch(value)) {
        return 'Zipcode must have 6 digits';
      }
    }
    return null;
  }