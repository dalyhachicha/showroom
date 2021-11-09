import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/models/user_model.dart';
import 'package:showroom/app/data/services/theme_service.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';
import 'package:showroom/app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            SizedBox(height: 12),
            buildHeader(),
            SizedBox(height: 12),
            buildSearchField(),
            SizedBox(height: 12),
            buildDrawerItem(
              text: 'Home',
              icon: Icons.home,
              onTap: () => selectedItem(0),
            ),
            buildDrawerItem(
              text: 'Cart',
              icon: Icons.shopping_bag,
              onTap: () => selectedItem(1),
            ),
            buildDrawerItem(
              text: 'Wishlist',
              icon: Icons.favorite,
              onTap: () => selectedItem(2),
            ),
            buildDrawerItem(
              text: 'History',
              icon: Icons.history,
              onTap: () => selectedItem(3),
            ),
            Divider(
              color: AppColors.grey,
            ),
            buildDrawerItem(
              text: 'Logout ${getPhoneNumber()}',
              icon: Icons.logout,
              onTap: () => selectedItem(4),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('LIGHT'),
                  SizedBox(width: 4),
                  DayNightSwitcher(
                    cratersColor: AppColors.grey,
                    isDarkModeEnabled: ThemeService().isDarkMode(),
                    onStateChanged: (isDarkModeEnabled) {
                      ThemeService().changeThemeMode();
                    },
                  ),
                  SizedBox(width: 4),
                  Text('DARK'),
                ],
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget buildSearchField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Search'.tr,
        ),
      ),
    );
  }

  String getPhoneNumber() {
    return GetStorage().read(GetStorageKey.PHONE_NUMBER);
  }

  Widget buildHeader() {
    return ListTile(
      title: Center(
        child: Text(
          'Showroom',
          style: AppTextStyle.drawerTitle,
        ),
      ),
    );
  }

  Widget buildDrawerItem(
      {required String text, required IconData icon, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: AppTextStyle.drawerItemText,
      ),
      onTap: onTap,
    );
  }

  void selectedItem(int index) {
    switch (index) {
      case 0:
        Get.back();
        Future.delayed(Duration(milliseconds: 300));
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        // CART
        break;
      case 2:
        // WISHLIST
        break;
      case 3:
        // HISTORY
        break;
      case 4:
        UserModel().logout();
        Get.offAllNamed(Routes.SPLASH);
        break;
    }
  }
}
