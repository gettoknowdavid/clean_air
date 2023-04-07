import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AqiSectionTitle extends StatelessWidget {
  const AqiSectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      title,
      style: textTheme.bodySmall?.copyWith(
        fontSize: 11.sp,
        height: 1.r,
        color: textTheme.bodySmall?.color?.withOpacity(0.25),
      ),
    );
  }
}
