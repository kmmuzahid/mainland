import 'package:flutter/material.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/venue/venueHome/widgets/venue_app_bar_widget.dart';

class VenueHomeWidget extends StatelessWidget {
  const VenueHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        VenueAppBarWidget(showLogo: true, title: AppString.scanner),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              const Spacer(),
              const Icon(Icons.folder_outlined),
              CommonText(text: AppString.browseDevice),
            ],
          ),
        ),
      ],
    );
  }
}
