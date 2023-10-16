import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../features/home/controller/home_controller.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final homeController = Provider.of<HomeController>(context);
        return TabBar(
          isScrollable: true,
          unselectedLabelColor: MainColor.primaryColor,
          indicatorColor: MainColor.primaryWhite,
          indicatorWeight: 1.0,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
          onTap: (index) {
            homeController.setIndex(index);
            DefaultTabController.of(context).animateTo(index);
          },
          tabs: const [
            Tab(
              text: lblTab1,
            ),
            Tab(
              text: lblTab2,
            ),
            Tab(
              text: lblTab3,
            ),
            Tab(
              text: lblTab4,
            ),
            Tab(
              text: lblTab5,
            ),
          ],
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(40);
}
