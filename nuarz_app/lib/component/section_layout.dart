import 'package:flutter/material.dart';
import 'package:nuarz_app/util/app_color.dart';

class SectionLayout extends Column {
  SectionLayout({
    Key? key,
    required String title,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    required Widget content,
    EdgeInsetsGeometry? contentPadding,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Padding(
              padding: titlePadding ??
                  EdgeInsets.only(
                    left: 32,
                    top: 48,
                    right: 32,
                  ),
              child: Text(
                title,
                style: titleTextStyle ??
                    TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: contentPadding ??
                  EdgeInsets.only(
                    left: 32,
                    top: 16,
                    right: 32,
                  ),
              child: content,
            )
          ],
        );
}
