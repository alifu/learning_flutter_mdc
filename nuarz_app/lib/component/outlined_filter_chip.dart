import 'package:flutter/material.dart';
import 'package:nuarz_app/util/app_color.dart';

class OutlinedFilterChip extends FilterChip {
  OutlinedFilterChip({
    Key? key,
    required String label,
    Function(bool)? onSelected,
    EdgeInsetsGeometry? padding,
    TextStyle? labelStyle,
    OutlinedBorder? shape,
    bool selected = false,
    Widget? avatar,
    Color? backgroundColor,
    Color? selectedColor,
    Color? disabledColor,
    ShapeBorder avatarBorder = const CircleBorder(),
  }) : super(
          key: key,
          label: Text(
            label,
            style: labelStyle,
          ),
          onSelected: onSelected,
          backgroundColor: backgroundColor ?? Colors.white,
          selectedColor: selectedColor ?? Colors.white,
          padding: padding ??
              EdgeInsets.only(
                left: 24.0,
                top: 8.0,
                right: 24.0,
                bottom: 8.0,
              ),
          labelStyle: labelStyle ??
              TextStyle(
                color: AppColors.chipTextColor,
                fontSize: 20.0,
              ),
          shape: shape ??
              StadiumBorder(
                side: BorderSide(
                  color: AppColors.chipBorderColor,
                  width: 1.5,
                ),
              ),
          selected: selected,
          avatar: avatar,
          avatarBorder: avatarBorder,
          disabledColor: disabledColor,
          checkmarkColor: AppColors.tabIndicator,
          pressElevation: 0.0,
        );
}
