import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/text_strings.dart';
import 'package:fullfill_admin_web_portal/utils/functions/divition_user.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';

class DetailPageSnapCard extends StatelessWidget {
  const DetailPageSnapCard({
    super.key,
    required this.title,
    required this.users,
    required this.isLoading,
    required this.isBlocked,
  });

  final String title;
  final List<dynamic> users;
  final bool isLoading;
  final bool isBlocked;

  @override
  Widget build(BuildContext context) {
    final selectedProfile = Provider.of<SelectedProfile>(context);
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
            if (isLoading)
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: LinearProgressIndicator(
                  color: KColors.complementarySecondary,
                  backgroundColor: KColors.lighterShade2Secondary,
                ),
              )),
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
                    onTap: () {
                      isBlocked
                          ? selectedProfile.selectBlockedProfile(index)
                          : selectedProfile.selectVerifiedProfile(index);
                    },
                    leading: CircleAvatar(
                      backgroundColor:
                          selectedProfile.getSelectedProfile(isBlocked) == index
                              ? KColors.selectedAvatarBgColor
                              : KColors.nonSelectedAvatarBgColor,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: KColors.neutralColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            if (users.isEmpty && !isLoading)
              Container(
                margin: const EdgeInsets.all(10),
                child: const Column(
                  children: [
                    Text(
                      KTexts.sadFace,
                      style: TextStyle(
                        fontSize: 20,
                        color: KColors.neutralColor,
                      ),
                    ),
                    Text(
                      "It's empty",
                      style: TextStyle(
                        color: KColors.neutralColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
