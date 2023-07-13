import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/data/model/rider.dart';
import 'package:fullfill_admin_web_portal/features/data/model/seller.dart';
import 'package:fullfill_admin_web_portal/features/data/model/user.dart';
import 'package:fullfill_admin_web_portal/features/view_model/riders/riders_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/users/users_provider.dart';
import 'package:fullfill_admin_web_portal/utils/functions/alert_message.dart';
import 'package:fullfill_admin_web_portal/utils/functions/divition_user.dart';
import 'package:provider/provider.dart';

class ProfileContainer extends StatefulWidget {
  final dynamic user;

  final bool isBlocked;
  const ProfileContainer({
    super.key,
    required this.user,
    required this.isBlocked,
  });

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final userDetails = getUserDetails(widget.user);

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
              CircleAvatar(
                radius: KSizes.screenHeight(8),
                backgroundColor: KColors.avatarBgColor,
                child: Text(
                  name[0],
                  style: TextStyle(
                    color: KColors.neutralColor,
                    fontSize: KSizes.screenHeight(8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              ElevatedButton.icon(
                onPressed: isLoading
                    ? null
                    : () async {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          if (widget.user is Rider) {
                            final riderProvider = Provider.of<RiderProvider>(
                              context,
                              listen: false,
                            );

                            if (widget.isBlocked) {
                              // Unblock the user
                              await riderProvider.unblockRider(uId);
                            } else {
                              // Block the user
                              await riderProvider.blockRider(uId);
                            }
                          } else if (widget.user is Seller) {
                            final sellerProvider = Provider.of<SellerProvider>(
                              context,
                              listen: false,
                            );

                            if (widget.isBlocked) {
                              // Unblock the user
                              await sellerProvider.unblockSeller(uId);
                            } else {
                              // Block the user
                              await sellerProvider.blockSeller(uId);
                            }
                          } else if (widget.user is User) {
                            final userProvider = Provider.of<UserProvider>(
                              context,
                              listen: false,
                            );

                            if (widget.isBlocked) {
                              // Unblock the user
                              await userProvider.unblockUser(uId);
                            } else {
                              // Block the user
                              await userProvider.blockUser(uId);
                            }
                          }
                        } catch (error) {
                          showAlertMessege(
                            context,
                            title: 'Error blocking/unblocking user',
                            message: error.toString(),
                          );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                icon: widget.isBlocked
                    ? const Icon(
                        Icons.check,
                        color: KColors.accentColor,
                      )
                    : const Icon(
                        Icons.block,
                        color: KColors.accentColor,
                      ),
                label: Text(
                  widget.isBlocked ? "Unblock $name" : "Block $name",
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
