import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.confirmation_number_sharp,
            size: 28,
          ),
          label: lblTab1,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.confirmation_number_sharp,
            size: 28,
          ),
          label: lblTab2,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.confirmation_number_sharp,
            size: 28,
          ),
          label: lblTab3,
        ),
      ],
      currentIndex: 1,
      backgroundColor: MainColor.primaryColor,
      iconSize: 22,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: MainColor.primaryColor300,
      unselectedItemColor: MainColor.primaryColor,
      onTap: (index){
        //bottomNavigationController.setTab(index);
      },
    );
  }
}
