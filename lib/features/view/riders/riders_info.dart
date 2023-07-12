import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/division_header.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/type_card.dart';
import 'package:fullfill_admin_web_portal/features/view/riders/riders_page.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';

class RidersInfo extends StatelessWidget {
  const RidersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        DivisionHeader(title: 'Riders', count: 252),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ResponsiveLayout(
            tablet: DivisionSnapCard(
              title: 'Varified Riders',
              itemCount: 5,
              navigate: RidersPage(),
            ),
            computer: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DivisionSnapCard(
                    title: 'Varified Riders',
                    itemCount: 6,
                    navigate: RidersPage(),
                  ),
                ),
                Expanded(
                  child: DivisionSnapCard(
                    title: 'Blocked Riders',
                    itemCount: 3,
                    navigate: RidersPage(),
                  ),
                ),
              ],
            ),
            phone: DivisionSnapCard(
              title: 'Varified Riders',
              itemCount: 6,
              navigate: RidersPage(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ResponsiveLayout(
            tablet: DivisionSnapCard(
              title: 'Blocked Riders',
              itemCount: 7,
              navigate: RidersPage(),
            ),
            computer: SizedBox(),
            phone: DivisionSnapCard(
              title: 'Blocked Riders',
              itemCount: 2,
              navigate: RidersPage(),
            ),
          ),
        ),
      ],
    );
  }
}
