import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../screens/sign_in_screen.dart';
import '../screens/update_profile_screen.dart';
import '../utills/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.fromUpdateProfile = false,
  });
  final bool fromUpdateProfile;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColor.themeColor,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (!fromUpdateProfile) {
                Get.toNamed(UpdateProfileScreen.name);
              }
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: MemoryImage(
                  base64Decode(AuthController.userModel?.photo ?? '')),
              onBackgroundImageError: (_, __) => const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AuthController.userModel?.fullName ?? '',
                    style:
                        textTheme.titleMedium?.copyWith(color: Colors.white)),
                Text(
                  AuthController.userModel?.email ?? '',
                  style: textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () async {
              await AuthController.clearUserData();
              Get.offAllNamed(SignInScreen.name);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
