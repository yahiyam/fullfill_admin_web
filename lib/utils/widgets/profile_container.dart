import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/features/data/model/user.dart';
import 'package:fullfill_admin_web_portal/features/data/model/rider.dart';
import 'package:fullfill_admin_web_portal/features/data/model/seller.dart';
import 'package:fullfill_admin_web_portal/utils/functions/alert_message.dart';
import 'package:fullfill_admin_web_portal/utils/functions/divition_user.dart';
import 'package:fullfill_admin_web_portal/features/view_model/users/users_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/riders/riders_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';

class ProfileContainer extends StatelessWidget {
  final List<dynamic> users;
  final bool isBlocked;
  final int index;

  const ProfileContainer({
    super.key,
    required this.users,
    required this.index,
    required this.isBlocked,
  });

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<SelectedProfile>(
      context,
      listen: false,
    );
    final riderProvider = Provider.of<RiderProvider>(
      context,
      listen: false,
    );
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    final sellerProvider = Provider.of<SellerProvider>(
      context,
      listen: false,
    );

    if (index >= users.length) {
      return const Center(child: CircleAvatar());
    }

    final user = users[index];
    final userDetails = getUserDetails(user);

    if (userDetails == null) {
      return Container();
    }
    final uId = userDetails['UID'] as String;
    final name = userDetails['name'] as String;
    final email = userDetails['email'] as String;
    final dob = userDetails['dob'] as String;
    final phoneNumber = userDetails['phoneNumber'] as String;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: KColors.lighterShade2Secondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        height: KSizes.screenHeight(50),
        width: KSizes.screenHeight(50) / 1.75,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              KColors.primary,
              KColors.darkerShade2Primary,
              KColors.darkerShade1Primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: KColors.darkerShade1Secondary.withOpacity(0.8),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: KSizes.screenHeight(8),
                    backgroundColor: KColors.selectedAvatarBgColor,
                    child: Text(
                      name[0],
                      style: TextStyle(
                        color: KColors.neutralColor,
                        fontSize: KSizes.screenHeight(8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          color: KColors.selectedAvatarBgColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: KColors.neutralColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: KSizes.screenHeight(3)),
                  Text(
                    email,
                    style: const TextStyle(
                      color: KColors.neutralColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "ID: $uId",
                    style: const TextStyle(
                      color: KColors.lighterShade2Primary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Date of Birth: $dob',
                    style: const TextStyle(
                      color: KColors.complementarySecondary,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: KSizes.screenHeight(1)),
                  Text(
                    'Phone Number: $phoneNumber',
                    style: const TextStyle(
                      color: KColors.complementarySecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              (userProvider.isLoading ||
                      sellerProvider.isLoading ||
                      riderProvider.isLoading)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: KColors.neutralColor,
                        strokeWidth: 2,
                      ),
                    )
                  : ElevatedButton.icon(
                      onPressed: () async {
                        try {
                          if (index + 1 == users.length) {
                            profile.resetIndex();
                          }

                          if (user is Rider) {
                            if (isBlocked) {
                              await riderProvider.unblockRider(uId);
                            } else {
                              await riderProvider.blockRider(uId);
                            }
                          } else if (user is Seller) {
                            if (isBlocked) {
                              await sellerProvider.unblockSeller(uId);
                            } else {
                              await sellerProvider.blockSeller(uId);
                            }
                          } else if (user is User) {
                            if (isBlocked) {
                              await userProvider.unblockUser(uId);
                            } else {
                              await userProvider.blockUser(uId);
                            }
                          }
                        } catch (error) {
                          showAlertMessege(
                            context,
                            title: 'Error blocking/unblocking user',
                            message: error.toString(),
                          );
                        }
                      },
                      icon: isBlocked
                          ? const Icon(
                              Icons.check,
                              color: KColors.accentColor,
                            )
                          : const Icon(
                              Icons.block,
                              color: KColors.accentColor,
                            ),
                      label: Text(
                        isBlocked ? "Unblock" : "Block",
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: KColors.accentColor,
                          fontSize: 16,
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
