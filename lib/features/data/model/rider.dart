class Rider {
  String? riderID;
  String? riderName;
  String? riderAvatarUrl;
  String? riderEmail;
  String? riderDob;
  String? riderPhoneNumber;

  Rider({
    this.riderID,
    this.riderName,
    this.riderAvatarUrl,
    this.riderEmail,
    this.riderDob,
    this.riderPhoneNumber,
  });

  Rider.fromJson(Map<String, dynamic> json) {
    riderID = json["riderUID"];
    riderName = json["riderName"];
    riderAvatarUrl = json["riderAvatarUrl"];
    riderEmail = json["riderEmail"];
    riderDob = json["riderDob"] ?? 'Not specified';
    riderPhoneNumber = json["riderPhoneNumber"] ?? 'Not specified';
  }
}
