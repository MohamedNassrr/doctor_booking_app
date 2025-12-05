import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
    this.iconSize = 15,
    this.isIconRight = true,
  });

  final dynamic title;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final bool isIconRight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: isIconRight
          ? TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(icon, color: iconColor, size: iconSize),
                ),
                WidgetSpan(child: SizedBox(width: 3.w)),
                TextSpan(
                  text: "$title",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          : TextSpan(
              children: [
                TextSpan(
                  text: "$title",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                WidgetSpan(child: SizedBox(width: 3.w)),
                WidgetSpan(
                  child: Icon(icon, color: iconColor, size: iconSize),
                ),
              ],
            ),
    );
  }
}
