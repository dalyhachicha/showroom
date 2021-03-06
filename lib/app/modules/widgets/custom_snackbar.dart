import 'package:get/get.dart';
import 'package:showroom/app/data/services/theme_service.dart';
import 'package:showroom/app/data/theme/color_theme.dart';

customSnackbar({
  required String title,
  required String message,
  required SnackPosition position,
}) {
  bool isDarkMode = ThemeService().isDarkMode();
  Get.snackbar(
    title,
    message,
    overlayBlur: 1,
    snackPosition: position,
    colorText: isDarkMode ? AppColors.darkGrey : AppColors.extraLightGrey,
    backgroundColor: isDarkMode ? AppColors.lightGrey : AppColors.darkGrey,
  );
}
