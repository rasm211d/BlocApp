bool validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return true;
  } else {
    return false;
  }
}

bool validatePassword(String input) {
  if (input.length > 6) {
    return true;
  } else {
    return false;
  }
}
