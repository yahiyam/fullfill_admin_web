class User {
  String? userID;
  String? userName;
  String? userAvatarUrl;
  String? userEmail;
  String? userDob;
  String? userPhoneNumber;

  User({
    this.userID,
    this.userName,
    this.userAvatarUrl,
    this.userEmail,
    this.userDob,
    this.userPhoneNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    userID = json["userUID"];
    userName = json["userName"];
    userAvatarUrl = json["userAvatarUrl"];
    userEmail = json["userEmail"];
    userDob = json["userDob"] ?? 'Not specified';
    userPhoneNumber = json["userPhoneNumber"] ?? 'Not specified';
  }
}
