import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view/users/users_page.dart';
import 'package:fullfill_admin_web_portal/features/view_model/users/users_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/division_header.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/type_card.dart';
import 'package:provider/provider.dart';

class UsersInfo extends StatelessWidget {
  const UsersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, usersProvider, _) {
        return ListView(
          shrinkWrap: true,
          children: [
            DivisionHeader(
              title: 'Users',
              count: usersProvider.usersCount,
              isLoading: usersProvider.isLoading,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ResponsiveLayout(
                tablet: DivisionSnapCard(
                  title: 'Verified Users',
                  itemCount: usersProvider.verifiedUsers.length,
                  navigate: const UsersPage(),
                  isLoading: usersProvider.isLoading,
                ),
                computer: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Verified Users',
                        itemCount: usersProvider.verifiedUsers.length,
                        navigate: const UsersPage(),
                        isLoading: usersProvider.isLoading,
                      ),
                    ),
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Blocked Users',
                        itemCount: usersProvider.blockedUsers.length,
                        navigate: const UsersPage(),
                        isLoading: usersProvider.isLoading,
                      ),
                    ),
                  ],
                ),
                phone: DivisionSnapCard(
                  title: 'Varified Users',
                  itemCount: usersProvider.verifiedUsers.length,
                  navigate: const UsersPage(),
                  isLoading: usersProvider.isLoading,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ResponsiveLayout(
                tablet: DivisionSnapCard(
                  title: 'Blocked Users',
                  itemCount: usersProvider.blockedUsers.length,
                  navigate: const UsersPage(),
                  isLoading: usersProvider.isLoading,
                ),
                computer: const SizedBox(),
                phone: DivisionSnapCard(
                  title: 'Blocked Users',
                  itemCount: usersProvider.blockedUsers.length,
                  navigate: const UsersPage(),
                  isLoading: usersProvider.isLoading,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
