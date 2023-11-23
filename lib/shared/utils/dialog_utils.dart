import 'package:flutter/material.dart';
import 'package:pet_store/shared/widgets/dialog/confirm_sign_out_dialog.dart';

import '../widgets/dialog/confirm_delete_item_cart_dialog.dart';
import '../widgets/dialog/notify_dialog.dart';

class DialogUtils {
  static void showConfirmSignOut(
    BuildContext context,
    Function() onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (context) => const ConfirmSignOutDialog(),
    ).then((value) {
      if (value != null) {
        onConfirm();
      }
    });
  }

  static void showNotifyDialog({
    required BuildContext context,
    required NotifyType type,
  }) {
    showDialog(
      context: context,
      builder: (context) => NotifyDialog(notifyType: type),
    );
  }

  static void showConfirmDeleteItemCart({
    required BuildContext context,
    required String nameProduct,
    required Function() onDelete,
  }) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDeleteItemCartDialog(name: nameProduct),
    ).then((value) {
      if (value != null) {
        onDelete();
      }
    });
  }
}
