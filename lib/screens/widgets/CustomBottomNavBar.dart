import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uip_tv_app/core/constants/assets_paths.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 17),
      decoration: BoxDecoration(
        color: const Color(0xff1C212A),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          _navButton(
            activeIcon: AssetsPaths.homeFill,
            inActiveIcon: AssetsPaths.home,
            index: 0,
          ),
          _navButton(
            activeIcon: AssetsPaths.tvFill,
            inActiveIcon: AssetsPaths.tv,
            index: 1,
          ),
          _navButton(
            activeIcon: AssetsPaths.downloadFill,
            inActiveIcon: AssetsPaths.download,
            index: 2,
          ),
          _navButton(
            activeIcon: AssetsPaths.personFill,
            inActiveIcon: AssetsPaths.person,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _navButton(
      {required String activeIcon,
      required String inActiveIcon,
      required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: SvgPicture.asset(
          index == _selectedIndex ? activeIcon : inActiveIcon,
        ),
      ),
    );
  }
}
