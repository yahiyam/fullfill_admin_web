import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/division_header.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/type_card.dart';
import 'package:provider/provider.dart';

class SellersInfo extends StatelessWidget {
  const SellersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellerProvider>(
      builder: (context, sellersProvider, _) {
        return ListView(
          shrinkWrap: true,
          children: [
            DivisionHeader(
              title: 'Sellers',
              count: sellersProvider.sellersCount,
              isLoading: sellersProvider.isLoading,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ResponsiveLayout(
                tablet: DivisionSnapCard(
                  title: 'Verified Sellers',
                  users: sellersProvider.verifiedSellers,
                  isLoading: sellersProvider.isLoading,
                ),
                computer: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Verified Sellers',
                        users: sellersProvider.verifiedSellers,
                        isLoading: sellersProvider.isLoading,
                      ),
                    ),
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Blocked Sellers',
                        users: sellersProvider.blockedSellers,
                        isLoading: sellersProvider.isLoading,
                      ),
                    ),
                  ],
                ),
                phone: DivisionSnapCard(
                  title: 'Verified Sellers',
                  users: sellersProvider.verifiedSellers,
                  isLoading: sellersProvider.isLoading,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ResponsiveLayout(
                tablet: DivisionSnapCard(
                  title: 'Blocked Sellers',
                  users: sellersProvider.blockedSellers,
                  isLoading: sellersProvider.isLoading,
                ),
                computer: const SizedBox(),
                phone: DivisionSnapCard(
                  title: 'Blocked Sellers',
                  users: sellersProvider.blockedSellers,
                  isLoading: sellersProvider.isLoading,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
