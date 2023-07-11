import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/division_header.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/type_card.dart';

class UsersInfo extends StatelessWidget {
  const UsersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DivisionHeader(title: 'Users', count: 502),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ResponsiveLayout(
            tablet: DivisionSnapCard(title: 'Varified Users', itemCount: 5),
            computer: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DivisionSnapCard(title: 'Varified Users', itemCount: 6),
                ),
                Expanded(
                  child: DivisionSnapCard(title: 'Blocked Users', itemCount: 3),
                ),
              ],
            ),
            phone: DivisionSnapCard(title: 'Varified Users', itemCount: 6),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ResponsiveLayout(
            tablet: DivisionSnapCard(title: 'Blocked Users', itemCount: 7),
            computer: SizedBox(),
            phone: DivisionSnapCard(title: 'Blocked Users', itemCount: 2),
          ),
        ),
      ],
    );
  }
}
