import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/home/bloc/home_cubit.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/gen/assets.gen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = context.read<HomeCubit>();
  }

  List<BottomNavigationBarItem> organizer() => [
    _navBuilder(index: 0, image: Assets.images.navHome.path),
    _navBuilder(index: 1, image: Assets.images.navTicket.path),
    _navBuilder(index: 2, image: Assets.images.navAccount.path),
    _navBuilder(index: 3, image: Assets.images.navChat.path),
  ];

  List<BottomNavigationBarItem> attendee() => [
    _navBuilder(index: 0, image: Assets.images.navHome.path),
    _navBuilder(index: 1, image: Assets.images.navFavorite.path),
    _navBuilder(index: 2, image: Assets.images.navFanClub.path),
    _navBuilder(index: 3, image: Assets.images.navTicket.path),
    _navBuilder(index: 4, image: Assets.images.navChat.path),
  ];

  @override
  Widget build(BuildContext context) {
    final role = context.read<AuthCubit>().state.userLoginInfoModel.role;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => setState(() {
        _currentIndex = index;
        _homeCubit.changeIndex(index);
      }),
      items: role == Role.ORGANIZER ? organizer() : attendee(),
    );
  }

  BottomNavigationBarItem _navBuilder({required int index, required String image}) {
    final bool isSelected = index == _currentIndex;
    final Color color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).iconTheme.color ?? Colors.grey;
    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonImage(imageSrc: image, imageColor: color),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: 2,
            width: isSelected ? 20 : 0,
            decoration: BoxDecoration(
              color: isSelected ? color : Colors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}
