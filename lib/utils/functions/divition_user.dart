import 'package:fullfill_admin_web_portal/features/data/model/rider.dart';
import 'package:fullfill_admin_web_portal/features/data/model/seller.dart';
import 'package:fullfill_admin_web_portal/features/data/model/user.dart';

Map<String, dynamic>? getUserDetails(dynamic user) {
  String? uId;
  String? name;
  String? avatarUrl;
  String? email;
  String? dob;
  String? phoneNumber;

  if (user is User) {
    uId = user.userID ?? '';
    name = user.userName ?? 'Not specified';
    avatarUrl = user.userAvatarUrl ?? '';
    email = user.userEmail ?? '';
    dob = user.userDob ?? 'Not specified';
    phoneNumber = user.userPhoneNumber ?? 'Not specified';
  } else if (user is Seller) {
    uId = user.sellerID ?? '';
    name = user.sellerName ?? 'Not specified';
    avatarUrl = user.sellerAvatarUrl ?? '';
    email = user.sellerEmail ?? '';
    dob = user.sellerDob ?? 'Not specified';
    phoneNumber = user.sellerPhoneNumber ?? 'Not specified';
  } else if (user is Rider) {
    uId = user.riderID ?? '';
    name = user.riderName ?? 'Not specified';
    avatarUrl = user.riderAvatarUrl ?? '';
    email = user.riderEmail ?? '';
    dob = user.riderDob ?? 'Not specified';
    phoneNumber = user.riderPhoneNumber ?? 'Not specified';
  } else {
    return null;
  }

  return {
    'UID': uId,
    'name': name,
    'avatarUrl': avatarUrl,
    'email': email,
    'dob': dob,
    'phoneNumber': phoneNumber,
  };
}
