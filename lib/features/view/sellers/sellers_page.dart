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
    return ChangeNotifierProvider<SelectedProfileButton>(
      create: (context) => SelectedProfileButton(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer2<SellerProvider, SelectedProfileButton>(
            builder: (context, sellersP, profileP, _) {
              final selectedProfile = profileP.selectedProfile;
              final verifiedSellers = sellersP.verifiedSellers;
              final blockedSellers = sellersP.blockedSellers;

              List<dynamic> sellers;
              if (verifiedSellers.isNotEmpty) {
                sellers = verifiedSellers;
              } else {
                sellers = blockedSellers;
              }

              if (selectedProfile >= 0 && selectedProfile < sellers.length) {
                final selectedSeller = sellers[selectedProfile];

                return ResponsiveLayout(
                  phone: Column(
                    children: [
                      ProfileContainer(
                        user: selectedSeller,
                        isBlocked:
                            sellersP.blockedSellers.contains(selectedSeller),
                      ),
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
                        user: selectedSeller,
                        isBlocked:
                            sellersP.blockedSellers.contains(selectedSeller),
                      ),
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
                                title: 'Blocked Sellers',
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
                                .verifiedSellers[profileP.selectedProfile],
                            isBlocked: sellersP.blockedSellers
                                .contains(selectedSeller),
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
                              title: 'Verified Sellers',
                              isLoading: sellersP.isLoading,
                              users: sellersP.verifiedSellers,
                            ),
                            DivisionSnapCard(
                              title: 'Blocked Sellers',
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
                              .verifiedSellers[profileP.selectedProfile],
                          isBlocked:
                              sellersP.blockedSellers.contains(selectedSeller),
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
