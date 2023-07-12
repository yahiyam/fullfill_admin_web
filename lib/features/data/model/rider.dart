class Rider {
  String? riderID;
  String? riderName;
  String? riderAvatarUrl;
  String? riderEmail;
  String? riderStatus;
  String? riderDob;
  String? riderPhoneNumber;

  Rider({
    this.riderID,
    this.riderName,
    this.riderAvatarUrl,
    this.riderEmail,
    this.riderStatus,
    this.riderDob,
    this.riderPhoneNumber,
  });

  Rider.fromJson(Map<String, dynamic> json) {
    riderID = json["riderUID"];
    riderName = json["riderName"];
    riderAvatarUrl = json["riderAvatarUrl"];
    riderEmail = json["riderEmail"];
    riderStatus = json["status"];
    riderDob = json["riderDob"] ?? 'Not specified';
    riderPhoneNumber = json["riderPhoneNumber"] ?? 'Not specified';
  }
}
