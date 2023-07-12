import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/division_header.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/type_card.dart';
import 'package:fullfill_admin_web_portal/features/view/riders/riders_page.dart';
import 'package:fullfill_admin_web_portal/features/view_model/riders/riders_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:provider/provider.dart';

class RidersInfo extends StatelessWidget {
  const RidersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RiderProvider>(
      builder: (context, ridersProvider, _) {
        return ListView(
          shrinkWrap: true,
          children: [
            DivisionHeader(
              title: 'Riders',
              count: ridersProvider.ridersCount,
              isLoading: ridersProvider.isLoading,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ResponsiveLayout(
                tablet: DivisionSnapCard(
                  title: 'Varified Riders',
                  itemCount: ridersProvider.verifiedRiders.length,
                  navigate: const RidersPage(),
                  isLoading: ridersProvider.isLoading,
                ),
                computer: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Verified Riders',
                        itemCount: ridersProvider.verifiedRiders.length,
                        navigate: const RidersPage(),
                        isLoading: ridersProvider.isLoading,
                      ),
                    ),
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Blocked Riders',
                        itemCount: ridersProvider.blockedRiders.length,
                        navigate: const RidersPage(),
                        isLoading: ridersProvider.isLoading,
                      ),
                    ),
                  ],
                ),
                phone: DivisionSnapCard(
                  title: 'Varified Riders',
                  itemCount: ridersProvider.verifiedRiders.length,
                  navigate: const RidersPage(),
                  isLoading: ridersProvider.isLoading,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ResponsiveLayout(
                tablet: DivisionSnapCard(
                  title: 'Blocked Riders',
                  itemCount: ridersProvider.blockedRiders.length,
                  navigate: const RidersPage(),
                  isLoading: ridersProvider.isLoading,
                ),
                computer: const SizedBox(),
                phone: DivisionSnapCard(
                  title: 'Blocked Riders',
                  itemCount: ridersProvider.blockedRiders.length,
                  navigate: const RidersPage(),
                  isLoading: ridersProvider.isLoading,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
