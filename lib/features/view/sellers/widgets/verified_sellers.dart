import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/empty_page_messege.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/detail_page_snapcard.dart.dart';
import 'package:provider/provider.dart';

class VerifiedSellers extends StatelessWidget {
  const VerifiedSellers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SellerProvider, SelectedProfile>(
      builder: (context, sellersP, profileP, _) {
        final selectedVerifiedProfile = profileP.selectedVerifiedProfile;
        final verifiedUsers = sellersP.verifiedSellers;

        if (selectedVerifiedProfile >= verifiedUsers.length) {
          return const EmptyPageMessage(
            messege: 'There is no Verified Sellers',
          );
        }

        final selectedUser = verifiedUsers[selectedVerifiedProfile];
        final isBlocked = sellersP.blockedSellers.contains(selectedUser);
        return ResponsiveLayout(
          phone: Column(
            children: [
              ProfileContainer(
                users: verifiedUsers,
                index: selectedVerifiedProfile,
                isBlocked: isBlocked,
              ),
              const SizedBox(height: KSizes.padding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DetailPageSnapCard(
                  isBlocked: isBlocked,
                  title: 'Verified Sellers',
                  isLoading: sellersP.isLoading,
                  users: verifiedUsers,
                ),
              ),
            ],
          ),
          tablet: Center(
            child: Column(children: [
              ProfileContainer(
                users: verifiedUsers,
                index: selectedVerifiedProfile,
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
                        title: 'Verified Sellers',
                        isLoading: sellersP.isLoading,
                        users: verifiedUsers,
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
                        title: 'Verified Sellers',
                        isLoading: sellersP.isLoading,
                        users: verifiedUsers,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: ProfileContainer(
                    users: verifiedUsers,
                    index: selectedVerifiedProfile,
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
                      title: 'Verified Sellers',
                      isLoading: sellersP.isLoading,
                      users: verifiedUsers,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: ProfileContainer(
                  users: verifiedUsers,
                  index: selectedVerifiedProfile,
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
