import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/venue/venueHome/cubit/venue_cubit.dart';

class VenueBottomNavigationBar extends StatefulWidget {
  const VenueBottomNavigationBar({super.key});

  @override
  State<VenueBottomNavigationBar> createState() => _VenueBottomNavigationBarState();
}

class _VenueBottomNavigationBarState extends State<VenueBottomNavigationBar> {
  int _currentIndex = 0;
  late VenueCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<VenueCubit>();
  }

  List<Widget> venueItems() => [
    _navBuilder(index: 0, image: Assets.images.venueHome.path),
    _navBuilder(index: 1, image: Assets.images.venueHistory),
    _navBuilder(index: 2, image: Assets.images.venueSetting),
  ];

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(20.r);
    final bgColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
        Theme.of(context).colorScheme.surface;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
        color: bgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.height,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 2,
            color: AppColors.primaryColor,
          ),
          2.height,
          BottomAppBar(
            color: bgColor,
            elevation: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min, // Shrinks Row to fit content
              mainAxisAlignment: MainAxisAlignment.center, // Center the items
              children: List.generate(venueItems().length, (index) {
                final item = venueItems()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10), // 20 px gap between items
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                        cubit.changeIndex(index);
                      });
                    },
                    child: item,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navBuilder({required int index, required String image}) {
    final bool isSelected = index == _currentIndex;
    final Color color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).iconTheme.color ?? Colors.grey;
    final icon = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonImage(size: 25, fill: BoxFit.contain, imageSrc: image, imageColor: color),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: 3.w,
            width: isSelected ? 30.w : 0,
            decoration: BoxDecoration(
              color: isSelected ? color : Colors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
    return icon;
  }
}
