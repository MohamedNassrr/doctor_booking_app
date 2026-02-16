import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ExpandedText extends StatefulWidget {
  ExpandedText({super.key, required this.text});

  final String text;
  bool isExpanded = false;
  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        ConstrainedBox(
          constraints: widget.isExpanded
              ? const BoxConstraints()
              : BoxConstraints(maxHeight: 60.h),
          child: Text(
            widget.text,
            softWrap: true,
            overflow: TextOverflow.fade,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
          ),
        ),
        widget.isExpanded
            ? TextButton(
                onPressed: () {
                  setState(() {
                    widget.isExpanded = false;
                  });
                },
                child: Text(
                  'View less',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.grey800),
                ),
              )
            : TextButton(
                onPressed: () {
                  setState(() {
                    widget.isExpanded = true;
                  });
                },
                child: Text(
                  'View more',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.grey800),
                ),
              ),
      ],
    );
  }
}
