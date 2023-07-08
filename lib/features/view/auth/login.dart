import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smartwatch: buildSmartwatchLayout(),
      smallPhone: buildSmallPhoneLayout(),
      phone: buildPhoneLayout(),
      miniTablet: buildMiniTabletLayout(),
      tablet: buildTabletLayout(),
      largeTablet: buildLargeTabletLayout(),
      computer: buildComputerLayout(),
    );
  }

  Widget buildMiniTabletLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Mini Tablet Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
      ),
    );
  }

  Widget buildSmallPhoneLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'SmallPhone Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
      ),
    );
  }

  Widget buildFoldablePhoneLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'FoldablePhone Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
      ),
    );
  }

  Widget buildSmartwatchLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Smartwatch Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
      ),
    );
  }

  Widget buildLargeComputerLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'LargeComputer Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
      ),
    );
  }

  Widget buildPhoneLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Phone Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
        // child: Icon(Icons.call),
      ),
    );
  }

  Widget buildTabletLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Tablet Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
        // child: Icon(Icons.tablet_mac_outlined),
      ),
    );
  }

  Widget buildLargeTabletLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Large Tablet Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
        // child: Icon(Icons.tv),
      ),
    );
  }

  Widget buildComputerLayout() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Computer Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Height : ${Screen.height()} :: width ${Screen.width()}"),
          ],
        ),
        // child: Icon(Icons.computer),
      ),
    );
  }
}
