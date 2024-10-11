import 'package:flutter/material.dart';
import 'package:matthiola_flower_shop/core/utils/extensions/build_context_extension.dart';

class SnackbarUtil {
  static void showErrorSnackbar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          content: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.error,
                  color: context.colorScheme.error,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: context.textTheme.headlineSmall!.copyWith(
                        color: context.colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  static void showSuccessSnackbar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          content: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.check,
                  color: context.colorScheme.onSecondary,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: context.textTheme.headlineSmall!.copyWith(
                        color: context.colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
