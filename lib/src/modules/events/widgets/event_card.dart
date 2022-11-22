// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:challenge/src/shared/utils/app_formaters.dart';
import 'package:challenge/src/shared/utils/app_images.dart';
import 'package:challenge/src/shared/utils/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:challenge/src/modules/events/models/event_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard extends StatelessWidget {
  final EventModel eventModel;
  final int maxLinesDescription;
  const EventCard({
    Key? key,
    required this.eventModel,
    this.maxLinesDescription = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _illustrationEvent(context),
          _title(),
          _eventDescription(),
          _dateAndHour(),
          _addressEvent(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _addressEvent() => Row(
        children: [
          const Icon(
            Icons.location_on_rounded,
            color: AppColors.neutralColorLowMedium,
            size: 20,
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 250, maxWidth: 270),
            child: CustomTexts.smallText(formatedAddress(eventModel.address),
                color: AppColors.neutralColorLowMedium, maxLines: 4),
          ),
        ],
      );

  Widget _dateAndHour() => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Container(
          constraints:
              const BoxConstraints(minWidth: 250, maxWidth: double.infinity),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTexts.mediumText('Data'),
                  const SizedBox(height: 4),
                  CustomTexts.smallText(
                      '${formatDay(DateTime.parse(eventModel.startTime))} - ${formatDayMonthYear(DateTime.parse(eventModel.endTime))}',
                      color: Colors.black),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTexts.mediumText('Hora'),
                    const SizedBox(height: 4),
                    CustomTexts.smallText(
                        '${formatHour(DateTime.parse(eventModel.startTime))} - ${formatHour(DateTime.parse(eventModel.endTime))}',
                        color: Colors.black),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget _eventDescription() => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          constraints: const BoxConstraints(maxWidth: 350, minWidth: 280),
          child: CustomTexts.smallText(eventModel.eventDescription,
              maxLines: maxLinesDescription),
        ),
      );

  Widget _title() => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: CustomTexts.bigText(eventModel.eventName),
        ),
      );

  Widget _illustrationEvent(context) => eventModel.thumbnail != ''
      ? Container(
          constraints: const BoxConstraints(
              maxWidth: 300, minHeight: 150, minWidth: 280),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: NetworkImage(eventModel.thumbnail),
                  fit: BoxFit.cover)),
        )
      : Container(
          constraints: const BoxConstraints(
              maxWidth: 300, minHeight: 100, minWidth: 280),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.deepBlue,
          ),
          child: SvgPicture.asset(
            AppImages.defaultBanner,
            alignment: Alignment.center,
          ),
        );
}
