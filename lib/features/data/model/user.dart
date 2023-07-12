class User {
  String? userID;
  String? userName;
  String? userAvatarUrl;
  String? userEmail;
  String? userStatus;
  String? userDob;
  String? userPhoneNumber;

  User({
    this.userID,
    this.userName,
    this.userAvatarUrl,
    this.userEmail,
    this.userStatus,
    this.userDob,
    this.userPhoneNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    userID = json["userUID"];
    userName = json["userName"];
    userAvatarUrl = json["userAvatarUrl"];
    userEmail = json["userEmail"];
    userStatus = json["status"];
    userDob = json["userDob"] ?? 'not added';
    userPhoneNumber = json["userPhoneNumber"] ?? 'not added';
  }
}
