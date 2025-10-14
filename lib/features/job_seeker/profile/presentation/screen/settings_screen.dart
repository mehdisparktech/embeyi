import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/utils/extensions/extension.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool emailNotifications = true;
  bool pushNotifications = true;
  bool jobAlerts = true;
  bool profileVisibility = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'Settings',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Account Settings
                const CommonText(
                  text: 'Account Settings',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildSettingItem(
                  icon: Icons.person,
                  title: 'Edit Profile',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.email,
                  title: 'Change Email',
                  onTap: () {},
                ),
                24.height,

                /// Notification Settings
                const CommonText(
                  text: 'Notifications',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildSwitchItem(
                  icon: Icons.notifications,
                  title: 'Enable Notifications',
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
                _buildSwitchItem(
                  icon: Icons.email,
                  title: 'Email Notifications',
                  value: emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      emailNotifications = value;
                    });
                  },
                ),
                _buildSwitchItem(
                  icon: Icons.phone_android,
                  title: 'Push Notifications',
                  value: pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      pushNotifications = value;
                    });
                  },
                ),
                _buildSwitchItem(
                  icon: Icons.work,
                  title: 'Job Alerts',
                  value: jobAlerts,
                  onChanged: (value) {
                    setState(() {
                      jobAlerts = value;
                    });
                  },
                ),
                24.height,

                /// Privacy Settings
                const CommonText(
                  text: 'Privacy',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildSwitchItem(
                  icon: Icons.visibility,
                  title: 'Profile Visibility',
                  subtitle: 'Make your profile visible to recruiters',
                  value: profileVisibility,
                  onChanged: (value) {
                    setState(() {
                      profileVisibility = value;
                    });
                  },
                ),
                _buildSettingItem(
                  icon: Icons.shield,
                  title: 'Privacy Policy',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.description,
                  title: 'Terms & Conditions',
                  onTap: () {},
                ),
                24.height,

                /// Appearance Settings
                const CommonText(
                  text: 'Appearance',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildSwitchItem(
                  icon: Icons.dark_mode,
                  title: 'Dark Mode',
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
                _buildSettingItem(
                  icon: Icons.language,
                  title: 'Language',
                  trailing: 'English',
                  onTap: () {},
                ),
                24.height,

                /// Support Settings
                const CommonText(
                  text: 'Support',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildSettingItem(
                  icon: Icons.help,
                  title: 'Help Center',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.contact_support,
                  title: 'Contact Support',
                  onTap: () {},
                ),
                _buildSettingItem(
                  icon: Icons.info,
                  title: 'About',
                  onTap: () {},
                ),
                24.height,

                /// Danger Zone
                const CommonText(
                  text: 'Danger Zone',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
                16.height,
                _buildSettingItem(
                  icon: Icons.delete_forever,
                  title: 'Delete Account',
                  iconColor: AppColors.error,
                  textColor: AppColors.error,
                  onTap: () {
                    _showDeleteAccountDialog();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    String? trailing,
    Color? iconColor,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: (iconColor ?? AppColors.primary).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, color: iconColor ?? AppColors.primary, size: 24.sp),
        ),
        title: CommonText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor ?? AppColors.primaryText,
        ),
        subtitle: subtitle != null
            ? CommonText(
                text: subtitle,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              )
            : null,
        trailing: trailing != null
            ? CommonText(
                text: trailing,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryText,
              )
            : Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: AppColors.secondaryText,
              ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: SwitchListTile(
        secondary: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24.sp),
        ),
        title: CommonText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        subtitle: subtitle != null
            ? CommonText(
                text: subtitle,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              )
            : null,
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: const CommonText(
          text: 'Delete Account',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        content: CommonText(
          text:
              'Are you sure you want to delete your account? This action cannot be undone and all your data will be permanently deleted.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const CommonText(
              text: 'Cancel',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              // Delete account logic
              Navigator.pop(context);
            },
            child: CommonText(
              text: 'Delete',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
