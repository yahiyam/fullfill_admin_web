import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/features/view_model/riders/riders_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/empty_page_messege.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/detail_page_snapcard.dart.dart';
import 'package:provider/provider.dart';

class BlockedRiders extends StatelessWidget {
  const BlockedRiders({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<RiderProvider, SelectedProfile>(
      builder: (context, ridersP, profileP, _) {
        final selectedBlockedProfile = profileP.selectedBlockedProfile;
        final blockedUsers = ridersP.blockedRiders;

        if (selectedBlockedProfile >= blockedUsers.length) {
          return const EmptyPageMessage(messege: 'There is no Blocked Riders');
        }

        final selectedUser = blockedUsers[selectedBlockedProfile];
        final isBlocked = ridersP.blockedRiders.contains(selectedUser);

        return ResponsiveLayout(
          phone: Column(
            children: [
              ProfileContainer(
                index: selectedBlockedProfile,
                users: blockedUsers,
                isBlocked: isBlocked,
              ),
              const SizedBox(height: KSizes.padding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DetailPageSnapCard(
                  isBlocked: isBlocked,
                  title: 'Blocked Riders',
                  isLoading: ridersP.isLoading,
                  users: blockedUsers,
                ),
              ),
            ],
          ),
          tablet: Center(
            child: Column(children: [
              ProfileContainer(
                index: selectedBlockedProfile,
                users: blockedUsers,
                isBlocked: isBlocked,
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: DetailPageSnapCard(
                        isBlocked: isBlocked,
                        title: 'Blocked Riders',
                        isLoading: ridersP.isLoading,
                        users: blockedUsers,
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
                      DetailPageSnapCard(
                        isBlocked: isBlocked,
                        title: 'Blocked Riders',
                        isLoading: ridersP.isLoading,
                        users: blockedUsers,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: ProfileContainer(
                    index: selectedBlockedProfile,
                    users: blockedUsers,
                    isBlocked: isBlocked,
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
                    DetailPageSnapCard(
                      isBlocked: isBlocked,
                      title: 'Blocked Riders',
                      isLoading: ridersP.isLoading,
                      users: blockedUsers,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: ProfileContainer(
                  index: selectedBlockedProfile,
                  users: blockedUsers,
                  isBlocked: isBlocked,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
