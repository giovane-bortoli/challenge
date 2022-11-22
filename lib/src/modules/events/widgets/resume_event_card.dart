import 'package:challenge/src/modules/events/models/event_model.dart';
import 'package:challenge/src/modules/events/widgets/event_card.dart';
import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:challenge/src/shared/utils/app_formaters.dart';
import 'package:flutter/material.dart';

class ResumedEventCard extends StatelessWidget {
  final EventModel event;
  const ResumedEventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(flex: 2, child: _dateInfo()),
        _divider(),
        Flexible(flex: 8, child: EventCard(eventModel: event)),
      ],
    );
  }

  Widget _divider() => Container(
        constraints: const BoxConstraints(maxHeight: 320),
        child: const VerticalDivider(
          color: AppColors.neutralColorHightDark,
          thickness: 2,
        ),
      );

  Widget _dateInfo() => Container(
        constraints: const BoxConstraints(maxWidth: 340, minWidth: 56),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8),
          child: Column(
            children: [
              Text(formatDayAndMonth(DateTime.parse(event.startTime)),
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.neutralColorLowMedium)),
              Text(formatDay(DateTime.parse(event.startTime)),
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.neutralColorLowMedium))
            ],
          ),
        ),
      );
}
