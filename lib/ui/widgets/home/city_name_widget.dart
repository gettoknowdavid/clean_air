import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/models/city.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CityNameWidget extends StatelessWidget {
  final City city;

  const CityNameWidget({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final today = DateTime.now();
    final formattedDate = dateFormatter(today.toIso8601String());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          '${city.name}',
          maxLines: 2,
          maxFontSize: 20,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        3.verticalSpace,
        Text(
          formattedDate,
          style: textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onBackground.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

String dateFormatter(String dateTimeString) {
  var _dateTime = DateTime.parse(dateTimeString);

  String _weekDay = DateFormat('EEEE').format(_dateTime);
  String _day = DateFormat('d').format(_dateTime);
  String _month = DateFormat('MMM').format(_dateTime);

  String formattedDate = '$_weekDay, $_day $_month';
  return formattedDate;
}
