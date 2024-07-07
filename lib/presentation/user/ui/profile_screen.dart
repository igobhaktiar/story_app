import 'package:flutter/material.dart';
import 'package:my_story_app/core/utils/colors.dart';
import 'package:my_story_app/core/utils/text_style.dart';
import 'package:my_story_app/data/model/user_model.dart';
import 'package:my_story_app/domain/usecases/user_usecase.dart';
import 'package:my_story_app/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final UserModel userData = await UserUseCase().getUserData();
    setState(() {
      user = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: appBarTextStyle,
        ),
        backgroundColor: ColorsAssets.eerieBlack,
        foregroundColor: ColorsAssets.white,
      ),
      backgroundColor: ColorsAssets.primary,
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorsAssets.eerieBlack,
                  ColorsAssets.primary,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user?.avatar ?? ''),
                ),
                const SizedBox(height: 16),
                Text(
                  user?.name ?? '',
                  style: titleTextStyle,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: ColorsAssets.eerieBlack,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Username',
                            style: labelTextStyle,
                          ),
                          const Spacer(),
                          Text(
                            user?.username ?? '',
                            style: bodyTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Divider(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: labelTextStyle,
                          ),
                          const Spacer(),
                          Text(
                            user?.email ?? '',
                            style: bodyTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Divider(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorsAssets.eerieBlack,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        minTileHeight: 0,
                        minVerticalPadding: 0,
                        leading: const Icon(Icons.person),
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          'Edit Profile',
                          style: bodyTextStyle,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Divider(),
                      const SizedBox(height: 16),
                      ListTile(
                        minTileHeight: 0,
                        minVerticalPadding: 0,
                        leading: const Icon(Icons.lock),
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          'Change Password',
                          style: bodyTextStyle,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Divider(),
                      const SizedBox(height: 16),
                      ListTile(
                        minTileHeight: 0,
                        minVerticalPadding: 0,
                        leading: const Icon(Icons.logout),
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          'Logout',
                          style: bodyTextStyle,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Logout'),
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      UserUseCase().clearUserData();
                                      UserUseCase().setLoginState(false);
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(
                                        context,
                                        Routes.login,
                                      );
                                    },
                                    child: const Text('Logout'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      const Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
