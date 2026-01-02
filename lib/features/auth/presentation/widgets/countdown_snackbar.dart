import 'dart:async';

import 'package:flutter/material.dart';

enum AppSnackBarType { info, success, warning, error }

Color _backgroundForType(AppSnackBarType type) {
  switch (type) {
    case AppSnackBarType.success:
      return Colors.green;
    case AppSnackBarType.warning:
      return Colors.orange;
    case AppSnackBarType.error:
      return Colors.red;
    case AppSnackBarType.info:
    default:
      return Colors.blueGrey;
  }
}

Future<void> showAppSnackBar(
  BuildContext context,
  String message, {
  AppSnackBarType type = AppSnackBarType.info,
  int durationSeconds = 5,
  bool showCountdown = false,
  bool showAction = false,
  String? actionLabel,
  VoidCallback? onAction,
}) async {
  final messenger = ScaffoldMessenger.of(context);
  int remainingSeconds = durationSeconds;
  Timer? timer;

  Widget buildCountdownContent(void Function(VoidCallback fn) setState) {
    timer ??= Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds <= 1) {
        t.cancel();
        messenger.hideCurrentSnackBar();
      } else {
        remainingSeconds -= 1;
        setState(() {});
      }
    });

    return Row(
      children: [
        Expanded(child: Text(message)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '${remainingSeconds}s',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  final controller = messenger.showSnackBar(
    SnackBar(
      duration: Duration(seconds: durationSeconds),
      backgroundColor: _backgroundForType(type),
      content: showCountdown
          ? StatefulBuilder(builder: (context, setState) => buildCountdownContent(setState))
          : Text(message),
      action: (showAction || actionLabel != null || onAction != null)
          ? SnackBarAction(
              label: actionLabel ?? 'Dismiss',
              textColor: Colors.white,
              onPressed: () {
                onAction?.call();
                messenger.hideCurrentSnackBar();
              },
            )
          : null,
      behavior: SnackBarBehavior.floating,
    ),
  );

  controller.closed.whenComplete(() {
    timer?.cancel();
  });
}

Future<void> showCountdownSnackBar(
  BuildContext context,
  String message, {
  int durationSeconds = 5,
  AppSnackBarType type = AppSnackBarType.error,
}) async {
  await showAppSnackBar(
    context,
    message,
    type: type,
    durationSeconds: durationSeconds,
    showCountdown: true,
  );
}