import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/division_header.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/type_card.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';

class RidersInfo extends StatelessWidget {
  const RidersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DivisionHeader(title: 'Riders', count: 252),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ResponsiveLayout(
            tablet: DivisionSnapCard(title: 'Varified Riders', itemCount: 5),
            computer: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                      DivisionSnapCard(title: 'Varified Riders', itemCount: 6),
                ),
                Expanded(
                  child: DivisionSnapCard(title: 'Blocked Riders', itemCount: 3),
                ),
              ],
            ),
            phone: DivisionSnapCard(title: 'Varified Riders', itemCount: 6),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ResponsiveLayout(
            tablet: DivisionSnapCard(title: 'Blocked Riders', itemCount: 7),
            computer: SizedBox(),
            phone: DivisionSnapCard(title: 'Blocked Riders', itemCount: 2),
          ),
        ),
      ],
    );
  }
}
