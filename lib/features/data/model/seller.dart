class Seller {
  String? sellerID;
  String? sellerName;
  String? sellerAvatarUrl;
  String? sellerEmail;
  String? sellerStatus;
  String? sellerDob;
  String? sellerPhoneNumber;

  Seller({
    this.sellerID,
    this.sellerName,
    this.sellerAvatarUrl,
    this.sellerEmail,
    this.sellerStatus,
    this.sellerDob,
    this.sellerPhoneNumber,
  });

  Seller.fromJson(Map<String, dynamic> json) {
    sellerID = json["sellerUID"];
    sellerName = json["sellerName"];
    sellerAvatarUrl = json["sellerAvatarUrl"];
    sellerEmail = json["sellerEmail"];
    sellerStatus = json["status"];
    sellerDob = json["sellerDob"] ?? 'not added';
    sellerPhoneNumber = json["sellerPhoneNumber"] ?? 'not added';
  }
}
