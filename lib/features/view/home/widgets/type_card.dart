import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/utils/functions/divition_user.dart';

class DivisionSnapCard extends StatelessWidget {
  const DivisionSnapCard({
    super.key,
    required this.title,
    required this.users,
    this.navigate,
    required this.isLoading,
  });

  final String title;
  final List<dynamic> users;
  final Widget? navigate;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: KColors.lighterShade2Secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: KColors.secondary,
                fontSize: 18,
              ),
            ),
            if (isLoading) const Center(child: CircularProgressIndicator()),
            if (!isLoading)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final userDetails = getUserDetails(user);

                  if (userDetails == null) {
                    return Container();
                  }
                  final userName = userDetails['name'];
                  return ListTile(
                    title: Text(
                      userName,
                      style: const TextStyle(
                        color: KColors.neutralColor,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: KColors.avatarBgColor,
                      child: Text(
                        userName[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            if (users.isNotEmpty)
              TextButton(
                onPressed: () {
                  if (navigate != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => navigate!,
                      ),
                    );
                  }
                },
                child: const Text(
                  'Show more',
                  style: TextStyle(
                    color: KColors.analogous1Primary,
                  ),
                ),
              ),
            if (users.isEmpty && !isLoading)
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  "It's empty",
                  style: TextStyle(
                    color: KColors.neutralColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
