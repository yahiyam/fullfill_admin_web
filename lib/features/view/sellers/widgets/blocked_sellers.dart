import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/empty_page_messege.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/detail_page_snapcard.dart.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';

class BlockedSellers extends StatelessWidget {
  const BlockedSellers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SellerProvider, SelectedProfile>(
      builder: (context, sellersP, profileP, _) {
        final selectedBlockedProfile = profileP.selectedBlockedProfile;
        final blockedUsers = sellersP.blockedSellers;

        if (selectedBlockedProfile >= blockedUsers.length) {
          return const EmptyPageMessage(messege: 'There is no Blocked Sellers');
        }

        final selectedUser = blockedUsers[selectedBlockedProfile];
        final isBlocked = sellersP.blockedSellers.contains(selectedUser);

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
                  title: 'Blocked Sellers',
                  isLoading: sellersP.isLoading,
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
                        title: 'Blocked Sellers',
                        isLoading: sellersP.isLoading,
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
                        title: 'Blocked Sellers',
                        isLoading: sellersP.isLoading,
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
                      title: 'Blocked Sellers',
                      isLoading: sellersP.isLoading,
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
