class Seller {
  String? sellerID;
  String? sellerName;
  String? sellerAvatarUrl;
  String? sellerEmail;
  String? sellerDob;
  String? sellerPhoneNumber;

  Seller({
    this.sellerID,
    this.sellerName,
    this.sellerAvatarUrl,
    this.sellerEmail,
    this.sellerDob,
    this.sellerPhoneNumber,
  });

  Seller.fromJson(Map<String, dynamic> json) {
    sellerID = json["sellerUID"];
    sellerName = json["sellerName"];
    sellerAvatarUrl = json["sellerAvatarUrl"];
    sellerEmail = json["sellerEmail"];
    sellerDob = json["sellerDob"] ?? 'Not specified';
    sellerPhoneNumber = json["sellerPhoneNumber"] ?? 'Not specified';
  }
}
