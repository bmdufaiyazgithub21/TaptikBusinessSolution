class AddBusiness {
  final int industryId;
  final String ownerName;
  final String businessName;
  final int businessMobile;
  final String city;
  final String state;
  final String zip;
  final String createdAt;
  final int id;

  AddBusiness({
    required this.industryId,
    required this.ownerName,
    required this.businessName,
    required this.businessMobile,
    required this.city,
    required this.state,
    required this.zip,
    required this.createdAt,
    required this.id,
  });

  factory AddBusiness.fromJson(Map<String, dynamic> json) {
    return AddBusiness(
      industryId: json['data']['industry_id'],
      ownerName: json['data']['owner_name'],
      businessName: json['data']['business_name'],
      businessMobile: json['data']['business_mobile'],
      city: json['data']['city'],
      state: json['data']['state'],
      zip: json['data']['zip'],
      createdAt: json['data']['created_at'],
      id: json['data']['id'],
    );
  }
}
