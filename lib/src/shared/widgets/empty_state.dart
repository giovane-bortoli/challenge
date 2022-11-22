import 'package:challenge/src/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            AppImages.emptyState,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ),
        Text(
          'Não há nenhum evento cadastrado',
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}
