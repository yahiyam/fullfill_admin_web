import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/presentation/riders/blocked_riders_page.dart';
import 'package:fullfill_admin_web_portal/presentation/riders/verified_riders_page.dart';
import 'package:fullfill_admin_web_portal/presentation/seller/blocked_sellers_page.dart';
import 'package:fullfill_admin_web_portal/presentation/seller/verified_sellers_page.dart';
import 'package:fullfill_admin_web_portal/presentation/user/blocked_users_page.dart';
import 'package:fullfill_admin_web_portal/presentation/user/verified_users_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Web Portal",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 5,
            // color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: screenWidth < 1300
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //users activate and block accounts button ui
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //active
                      FunctionalityButton(
                        label: "All Verified Users Accounts",
                        icon: Icons.person,
                        navigate: AllVerifiedUsersScreen(),
                      ),
                      //block
                      FunctionalityButton(
                        label: "All Blocked Users Accounts",
                        icon: Icons.block,
                        navigate: AllBlockedUsersScreen(),
                        color: Colors.cyan,
                      ),
                    ],
                  ),

                  //sellers activate and block accounts button ui
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //active
                      FunctionalityButton(
                        label: "All Verified Sellers Accounts",
                        icon: Icons.person,
                        navigate: AllVerifiedSellersScreen(),
                        color: Colors.cyan,
                      ),
                      //block
                      FunctionalityButton(
                        label: "All Blocked Sellers Accounts",
                        icon: Icons.block,
                        navigate: AllBlockedSellersScreen(),
                      ),
                    ],
                  ),

                  //riders activate and block accounts button ui
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //active
                      FunctionalityButton(
                        label: "All Verified Riders Accounts",
                        icon: Icons.person,
                        navigate: AllVerifiedRidersScreen(),
                      ),
                      //block
                      FunctionalityButton(
                        label: "All Blocked Riders Accounts",
                        icon: Icons.block,
                        navigate: AllBlockedRidersScreen(),
                        color: Colors.cyan,
                      ),
                    ],
                  ),

                  //logout button
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Logout".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(40),
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //users activate and block accounts button ui
                  //active
                  const FunctionalityButton(
                    label: "All Verified Users Accounts",
                    icon: Icons.person,
                    navigate: AllVerifiedUsersScreen(),
                  ),
                  //block
                  const FunctionalityButton(
                    label: "All Blocked Users Accounts",
                    icon: Icons.block,
                    navigate: AllBlockedUsersScreen(),
                    color: Colors.cyan,
                  ),

                  //sellers activate and block accounts button ui
                  //active
                  const FunctionalityButton(
                    label: "All Verified Sellers Accounts",
                    icon: Icons.person,
                    navigate: AllVerifiedSellersScreen(),
                  ),
                  //block
                  const FunctionalityButton(
                    label: "All Blocked Sellers Accounts",
                    icon: Icons.block,
                    navigate: AllBlockedSellersScreen(),
                    color: Colors.cyan,
                  ),

                  //riders activate and block accounts button ui
                  //active
                  const FunctionalityButton(
                    label: "All Verified Riders Accounts",
                    icon: Icons.person,
                    navigate: AllVerifiedRidersScreen(),
                  ),
                  //block
                  const FunctionalityButton(
                    label: "All Blocked Riders Accounts",
                    icon: Icons.block,
                    navigate: AllBlockedRidersScreen(),
                    color: Colors.cyan,
                  ),
                  //logout button
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Logout".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(40),
                      backgroundColor: Colors.cyan,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
    );
  }
}

class FunctionalityButton extends StatelessWidget {
  const FunctionalityButton({
    super.key,
    this.navigate,
    this.icon,
    this.color,
    required this.label,
  });
  final Widget? navigate;
  final IconData? icon;
  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth < 1300 ? screenWidth / 2.5 : screenWidth / 2.5 / 2,
      height: screenWidth < 1300 ? screenWidth / 9 : screenWidth / 9 / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: color ?? Colors.amber,
      ),
      child: Material(
        color: color ?? Colors.amber,
        borderRadius: BorderRadius.circular(60),
        child: InkWell(
          splashColor: Colors.black12,
          borderRadius: BorderRadius.circular(60),
          onTap: () {
            if (navigate != null) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => navigate!,
              ));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: screenWidth < 1300
                    ? screenWidth / 20
                    : screenWidth / 20 / 2,
              ),
              SizedBox(
                width:
                    screenWidth < 1300 ? screenWidth / 4 : screenWidth / 4 / 2,
                child: Text(
                  label.toUpperCase(),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: screenWidth < 1300
                        ? screenWidth / 50
                        : screenWidth / 50 / 2,
                    color: Colors.white,
                    letterSpacing: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
