class AddressModel {
  final String street;
  final String number;
  final String neighborhood;
  final String city;
  AddressModel({
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      number: json['number'],
      neighborhood: json['neighborhood'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['street'] = street;
    data['number'] = number;
    data['neighborhood'] = neighborhood;
    data['city'] = city;

    return data;
  }
}
