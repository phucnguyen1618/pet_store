class TextValidate {
  static final emailReg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static final textReg = RegExp(r"^[a-zA-Z]");

  static final numberReg = RegExp(r"^[0-9]");

  static String? isEmailValidate(String? input) {
    if (input != null) {
      if (input.isEmpty) {
        return 'Email không được rỗng';
      } else if (!emailReg.hasMatch(input)) {
        return 'Email không đúng định dạng';
      }
    } else {
      return 'Đây là trường bắt buộc';
    }
    return null;
  }

  static String? isPasswordValidate(String? input) {
    if (input != null) {
      if (input.isEmpty) {
        return 'Mật khẩu không được rỗng';
      } else if (input.length <= 8) {
        return 'Mật khẩu quá yếu';
      }
    } else {
      return 'Mật khẩu là bắt buộc';
    }
    return null;
  }

  static String? isFullNameValidate(String? input) {
    if (input != null) {
      if (input.isEmpty) {
        return 'Họ và tên không được để trống';
      } else if (!textReg.hasMatch(input)) {
        return 'Họ và tên không được chứa các ký tự đặc biệt, ký tự chữ số';
      }
    } else {
      return 'Đây là trường bắt buộc';
    }
    return null;
  }

  static String? validateTextEmpty(String? input) {
    if (input != null) {
      if (input.isEmpty) {
        return 'Dữ liệu không được để trống';
      }
    } else {
      return 'Đây là trường bắt buộc';
    }
    return null;
  }
}
