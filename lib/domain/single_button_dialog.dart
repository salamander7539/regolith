import 'package:flutter/material.dart';

class SingleButtonDialog extends StatelessWidget {
  const SingleButtonDialog({
    Key? key,
    this.acceptColor,
    this.acceptText,
    this.title,
    this.content,
    this.titleText,
    this.contentText,
    this.onAcceptTap,
  })  : assert(titleText != null || title != null,
  content != null || contentText != null),
        super(key: key);

  final Widget? title;
  final String? titleText;
  final Widget? content;
  final String? contentText;

  final String? acceptText;
  final Color? acceptColor;

  final Function()? onAcceptTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(left: 24, right: 24, top: 20),
      contentPadding: contentText != null || content != null
          ? const EdgeInsets.symmetric(horizontal: 24, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 24),
      insetPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: title ?? Text(titleText!),
      // ignore: prefer_if_null_operators
      content: content != null
          ? content
          : contentText != null
          ? Text(contentText!)
          : null,
      actions: [
        TextButton(
          onPressed: onAcceptTap,
          child: Text(acceptText ?? 'Accept'),
        ),
      ],
    );
  }
}
