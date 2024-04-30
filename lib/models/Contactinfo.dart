class ContactInfo {
  final String name;
  final String email;
  final String phone;
  final String city;
  final String region;
  final String gender;
  final String address;

  ContactInfo({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.region,
    required this.gender,
    required this.address,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      city: json['city'],
      region: json['region'],
      gender: json['gender'],
      address: json['address'],
    );
  }
}
