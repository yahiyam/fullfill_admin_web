import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/division_snapcard.dart';
import 'package:fullfill_admin_web_portal/features/view_model/users/users_provider.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/division_header.dart';

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
                  users: usersProvider.verifiedUsers,
                  isLoading: usersProvider.isLoading,
                ),
                computer: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Verified Users',
                        users: usersProvider.verifiedUsers,
                        isLoading: usersProvider.isLoading,
                      ),
                    ),
                    Expanded(
                      child: DivisionSnapCard(
                        title: 'Blocked Users',
                        users: usersProvider.blockedUsers,
                        isLoading: usersProvider.isLoading,
                      ),
                    ),
                  ],
                ),
                phone: DivisionSnapCard(
                  title: 'Verified Users',
                  users: usersProvider.verifiedUsers,
                  isLoading: usersProvider.isLoading,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ResponsiveLayout(
                tablet: DivisionSnapCard(
                  title: 'Blocked Users',
                  users: usersProvider.blockedUsers,
                  isLoading: usersProvider.isLoading,
                ),
                computer: const SizedBox(),
                phone: DivisionSnapCard(
                  title: 'Blocked Users',
                  users: usersProvider.blockedUsers,
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
