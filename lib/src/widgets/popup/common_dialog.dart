import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../foundation/app_text_styles.dart';
import 'popup_button.dart';

enum PopupType { android, ios, adaptive }

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    this.commonPopupType = PopupType.adaptive,
    this.actions = const <PopupButton>[],
    this.title,
    this.message,
    this.defaultOkText = 'OK',
    super.key,
  });

  const CommonDialog.android({
    List<PopupButton> actions = const <PopupButton>[],
    String? title,
    String? message,
    String defaultOkText = 'OK',
    Key? key,
  }) : this(
          commonPopupType: PopupType.android,
          actions: actions,
          title: title,
          message: message,
          defaultOkText: defaultOkText,
          key: key,
        );

  const CommonDialog.ios({
    List<PopupButton> actions = const <PopupButton>[],
    String? title,
    String? message,
    String defaultOkText = 'OK',
    Key? key,
  }) : this(
          commonPopupType: PopupType.ios,
          actions: actions,
          title: title,
          message: message,
          defaultOkText: defaultOkText,
          key: key,
        );

  const CommonDialog.adaptive({
    List<PopupButton> actions = const <PopupButton>[],
    String? title,
    String? message,
    String defaultOkText = 'OK',
    Key? key,
  }) : this(
          commonPopupType: PopupType.adaptive,
          actions: actions,
          title: title,
          message: message,
          defaultOkText: defaultOkText,
          key: key,
        );

  final PopupType commonPopupType;
  final List<PopupButton> actions;
  final String? title;
  final String? message;
  final String defaultOkText;

  @override
  Widget build(BuildContext context) {
    switch (commonPopupType) {
      case PopupType.android:
        return _buildAndroidDialog();
      case PopupType.ios:
        return _buildIosDialog();
      case PopupType.adaptive:
        return Platform.isIOS ? _buildIosDialog() : _buildAndroidDialog();
    }
  }

  Widget _buildAndroidDialog() {
    return AlertDialog(
      actions: actions
          .map(
            (e) => TextButton(
              onPressed: e.onPressed,
              child: Text(
                e.text ?? defaultOkText,
                style:
                    e.isDefault ? AppTextStyles.s14w400Secondary() : AppTextStyles.s14w400Primary(),
              ),
            ),
          )
          .toList(growable: false),
      title: title != null
          ? Text(
              title ?? '',
              style: AppTextStyles.headlineSmall(),
            )
          : null,
      content: message != null
          ? Text(
              message ?? '',
              style: AppTextStyles.bodyMedium(),
            )
          : null,
    );
  }

  Widget _buildIosDialog() {
    return CupertinoAlertDialog(
      actions: actions
          .map((e) => CupertinoDialogAction(
                onPressed: e.onPressed,
                child: Text(
                  e.text ?? defaultOkText,
                  style: e.isDefault
                      ? AppTextStyles.s14w400Secondary()
                      : AppTextStyles.s14w400Primary(),
                ),
              ))
          .toList(growable: false),
      title: title != null
          ? Text(
              title ?? '',
              style: AppTextStyles.headlineSmall(),
            )
          : null,
      content: message != null
          ? Text(
              message ?? '',
              style: AppTextStyles.bodyMedium(),
            )
          : null,
    );
  }
}
