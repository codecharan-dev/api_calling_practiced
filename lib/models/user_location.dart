class UserLocation {
  final String state;
  final String postCode;
  final String city;
  final String country;
  final UserLocationStreet userLocationStreet;
  final UserLocationCoOrdinates userLocationCoOrdinates;
  final UserLocationTimeZone userLocationSTimeZone;

  UserLocation({
    required this.userLocationStreet,
    required this.userLocationCoOrdinates,
    required this.userLocationSTimeZone,
    required this.state,
    required this.postCode,
    required this.city,
    required this.country,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coOrdinates = UserLocationCoOrdinates.fromMap(json["coordinates"]);

    final timeZone = UserLocationTimeZone.fromMap(json["timezone"]);

    final street = UserLocationStreet.fromMap(json["street"]);

    return UserLocation(
      userLocationStreet: street,
      userLocationCoOrdinates: coOrdinates,
      state: json["state"],
      postCode: json["postcode"].toString(),
      city: json["city"],
      country: json["country"],
      userLocationSTimeZone: timeZone,
    );
  }
}

class UserLocationStreet {
  final int number;
  final String name;
  UserLocationStreet({
    required this.number,
    required this.name,
  });

  factory UserLocationStreet.fromMap(Map<String, dynamic> json) {
    return UserLocationStreet(
      number: json["number"],
      name: json["name"],
    );
  }
}

class UserLocationCoOrdinates {
  final String latitude;
  final String longitude;
  UserLocationCoOrdinates({
    required this.latitude,
    required this.longitude,
  });

  factory UserLocationCoOrdinates.fromMap(Map<String, dynamic> json) {
    return UserLocationCoOrdinates(
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }
}

class UserLocationTimeZone {
  final String offset;
  final String description;
  UserLocationTimeZone({
    required this.offset,
    required this.description,
  });

  factory UserLocationTimeZone.fromMap(Map<String, dynamic> json) {
    return UserLocationTimeZone(
      offset: json["offset"],
      description: json["description"],
    );
  }
}
