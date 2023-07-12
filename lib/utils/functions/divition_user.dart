import 'package:fullfill_admin_web_portal/features/data/model/rider.dart';
import 'package:fullfill_admin_web_portal/features/data/model/seller.dart';
import 'package:fullfill_admin_web_portal/features/data/model/user.dart';

Map<String, dynamic>? getUserDetails(dynamic item) {
  String? name;
  String? avatarUrl;
  String? email;
  String? dob;
  String? phoneNumber;

  if (item is User) {
    name = item.userName ?? 'Not specified';
    avatarUrl = item.userAvatarUrl ?? '';
    email = item.userEmail ?? '';
    dob = item.userDob ?? 'Not specified';
    phoneNumber = item.userPhoneNumber ?? 'Not specified';
  } else if (item is Seller) {
    name = item.sellerName ?? 'Not specified';
    avatarUrl = item.sellerAvatarUrl ?? '';
    email = item.sellerEmail ?? '';
    dob = item.sellerDob ?? 'Not specified';
    phoneNumber = item.sellerPhoneNumber ?? 'Not specified';
  } else if (item is Rider) {
    name = item.riderName ?? 'Not specified';
    avatarUrl = item.riderAvatarUrl ?? '';
    email = item.riderEmail ?? '';
    dob = item.riderDob ?? 'Not specified';
    phoneNumber = item.riderPhoneNumber ?? 'Not specified';
  } else {
    return null;
  }

  return {
    'name': name,
    'avatarUrl': avatarUrl,
    'email': email,
    'dob': dob,
    'phoneNumber': phoneNumber,
  };
}
