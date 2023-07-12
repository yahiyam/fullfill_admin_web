import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/type_card.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:provider/provider.dart';

class SellersPage extends StatelessWidget {
  const SellersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedProfileButton(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer2<SellerProvider, SelectedProfileButton>(
            builder: (context, sellersP, profileP, _) {
              return ResponsiveLayout(
                phone: Column(
                  children: [
                    ProfileContainer(
                        user:
                            sellersP.verifiedSellers[profileP.selectedProfile]),
                    const SizedBox(height: KSizes.padding),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: DivisionSnapCard(
                        title: 'Verified Sellers',
                        isLoading: sellersP.isLoading,
                        users: sellersP.verifiedSellers,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: DivisionSnapCard(
                        title: 'Blocked Sellers',
                        isLoading: sellersP.isLoading,
                        users: sellersP.blockedSellers,
                      ),
                    ),
                  ],
                ),
                tablet: Center(
                  child: Column(children: [
                    ProfileContainer(
                        user:
                            sellersP.verifiedSellers[profileP.selectedProfile]),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: DivisionSnapCard(
                              title: 'Verified Sellers',
                              isLoading: sellersP.isLoading,
                              users: sellersP.verifiedSellers,
                            ),
                          ),
                          Expanded(
                            child: DivisionSnapCard(
                              title: 'Blocked Sellers',
                              isLoading: sellersP.isLoading,
                              users: sellersP.blockedSellers,
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
                              title: 'Verified Sellers',
                              isLoading: sellersP.isLoading,
                              users: sellersP.verifiedSellers,
                            ),
                            DivisionSnapCard(
                              title: 'Blocked Riders',
                              isLoading: sellersP.isLoading,
                              users: sellersP.blockedSellers,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: ProfileContainer(
                            user: sellersP
                                .verifiedSellers[profileP.selectedProfile]),
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
                            isLoading: sellersP.isLoading,
                            users: sellersP.verifiedSellers,
                          ),
                          DivisionSnapCard(
                            title: 'Blocked Riders',
                            isLoading: sellersP.isLoading,
                            users: sellersP.blockedSellers,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: ProfileContainer(
                          user: sellersP
                              .verifiedSellers[profileP.selectedProfile]),
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
