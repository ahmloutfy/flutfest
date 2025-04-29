import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor, textColor;
  final Widget? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.icon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(

          backgroundColor: backgroundColor , foregroundColor: textColor),
      onPressed: onPressed,
      child:
          icon == null
              ? Text(text)
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  icon!,
                  const SizedBox(width: 10),
                  Gutter(),
                  Text(text),
                  Spacer(),
                ],
              ),
    );
  }
}
