import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/type_card.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/features/view_model/riders/riders_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:provider/provider.dart';

class RidersPage extends StatelessWidget {
  const RidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedProfileButton(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer2<RiderProvider, SelectedProfileButton>(
            builder: (context, ridersP, profileP, _) {
              final selectedProfile = profileP.selectedProfile;
              final verifiedUsers = ridersP.verifiedRiders;
              final blockedUsers = ridersP.blockedRiders;

              List<dynamic> users;
              if (verifiedUsers.isNotEmpty) {
                users = verifiedUsers;
              } else {
                users = blockedUsers;
              }

              if (selectedProfile >= 0 && selectedProfile < users.length) {
                final selectedUser = users[selectedProfile];

                return ResponsiveLayout(
                  phone: Column(
                    children: [
                      ProfileContainer(
                        user: selectedUser,
                        isBlocked: ridersP.blockedRiders.contains(selectedUser),
                      ),
                      const SizedBox(height: KSizes.padding),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: DivisionSnapCard(
                          title: 'Verified Riders',
                          isLoading: ridersP.isLoading,
                          users: ridersP.verifiedRiders,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: DivisionSnapCard(
                          title: 'Blocked Riders',
                          isLoading: ridersP.isLoading,
                          users: ridersP.blockedRiders,
                        ),
                      ),
                    ],
                  ),
                  tablet: Center(
                    child: Column(children: [
                      ProfileContainer(
                        user: selectedUser,
                        isBlocked: ridersP.blockedRiders.contains(selectedUser),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: DivisionSnapCard(
                                title: 'Verified Riders',
                                isLoading: ridersP.isLoading,
                                users: ridersP.verifiedRiders,
                              ),
                            ),
                            Expanded(
                              child: DivisionSnapCard(
                                title: 'Blocked Riders',
                                isLoading: ridersP.isLoading,
                                users: ridersP.blockedRiders,
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
                                title: 'Verified Riders',
                                isLoading: ridersP.isLoading,
                                users: ridersP.verifiedRiders,
                              ),
                              DivisionSnapCard(
                                title: 'Blocked Riders',
                                isLoading: ridersP.isLoading,
                                users: ridersP.blockedRiders,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(50),
                          child: ProfileContainer(
                            user: ridersP
                                .verifiedRiders[profileP.selectedProfile],
                            isBlocked:
                                ridersP.blockedRiders.contains(selectedUser),
                          ),
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
                              title: 'Verified Riders',
                              isLoading: ridersP.isLoading,
                              users: ridersP.verifiedRiders,
                            ),
                            DivisionSnapCard(
                              title: 'Blocked Riders',
                              isLoading: ridersP.isLoading,
                              users: ridersP.blockedRiders,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: ProfileContainer(
                          user: selectedUser,
                          isBlocked:
                              ridersP.blockedRiders.contains(selectedUser),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'Invalid profile selection',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
