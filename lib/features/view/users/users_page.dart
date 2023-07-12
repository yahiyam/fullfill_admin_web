import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/type_card.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/features/view_model/users/users_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedProfileButton(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer2<UserProvider, SelectedProfileButton>(
            builder: (context, usersP, profileP, _) {
              return ResponsiveLayout(
                phone: Column(
                  children: [
                    ProfileContainer(
                        user: usersP.verifiedUsers[profileP.selectedProfile]),
                    const SizedBox(height: KSizes.padding),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: DivisionSnapCard(
                        title: 'Verified Users',
                        isLoading: usersP.isLoading,
                        users: usersP.verifiedUsers,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: DivisionSnapCard(
                        title: 'Blocked Users',
                        isLoading: usersP.isLoading,
                        users: usersP.blockedUsers,
                      ),
                    ),
                  ],
                ),
                tablet: Center(
                  child: Column(children: [
                    ProfileContainer(
                        user: usersP.verifiedUsers[profileP.selectedProfile]),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: DivisionSnapCard(
                              title: 'Verified Users',
                              isLoading: usersP.isLoading,
                              users: usersP.verifiedUsers,
                            ),
                          ),
                          Expanded(
                            child: DivisionSnapCard(
                              title: 'Blocked Users',
                              isLoading: usersP.isLoading,
                              users: usersP.blockedUsers,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ]),
                ),
                largeTablet: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(child: SizedBox()),
                      Flexible(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DivisionSnapCard(
                              title: 'Verified Users',
                              isLoading: usersP.isLoading,
                              users: usersP.verifiedUsers,
                            ),
                            DivisionSnapCard(
                              title: 'Blocked Users',
                              isLoading: usersP.isLoading,
                              users: usersP.blockedUsers,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: ProfileContainer(
                            user:
                                usersP.verifiedUsers[profileP.selectedProfile]),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                computer: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox()),
                    Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DivisionSnapCard(
                            title: 'Verified Users',
                            isLoading: usersP.isLoading,
                            users: usersP.verifiedUsers,
                          ),
                          DivisionSnapCard(
                            title: 'Blocked Users',
                            isLoading: usersP.isLoading,
                            users: usersP.blockedUsers,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: ProfileContainer(
                          user: usersP.verifiedUsers[profileP.selectedProfile]),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
