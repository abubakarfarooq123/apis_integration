class UserModel {
  UserModel({
    required num id,
    required String name,
    required String username,
    required String email,
    required Address address,
    required String phone,
    required String website,
    required Company company,
  })  : _id = id,
        _name = name,
        _username = username,
        _email = email,
        _address = address,
        _phone = phone,
        _website = website,
        _company = company;

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _address = Address.fromJson(json['address']);
    _phone = json['phone'];
    _website = json['website'];
    _company = Company.fromJson(json['company']);
  }

  late num _id;
  late String _name;
  late String _username;
  late String _email;
  late Address _address;
  late String _phone;
  late String _website;
  late Company _company;

  num get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  Address get address => _address;
  String get phone => _phone;
  String get website => _website;
  Company get company => _company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['address'] = _address.toJson();
    map['phone'] = _phone;
    map['website'] = _website;
    map['company'] = _company.toJson();
    return map;
  }
}

class Company {
  Company({
    required String name,
    required String catchPhrase,
    required String bs,
  })  : _name = name,
        _catchPhrase = catchPhrase,
        _bs = bs;

  Company.fromJson(dynamic json) {
    _name = json['name'];
    _catchPhrase = json['catchPhrase'];
    _bs = json['bs'];
  }

  late String _name;
  late String _catchPhrase;
  late String _bs;

  String get name => _name;
  String get catchPhrase => _catchPhrase;
  String get bs => _bs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['catchPhrase'] = _catchPhrase;
    map['bs'] = _bs;
    return map;
  }
}

class Address {
  Address({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required Geo geo,
  })  : _street = street,
        _suite = suite,
        _city = city,
        _zipcode = zipcode,
        _geo = geo;

  Address.fromJson(dynamic json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    _geo = Geo.fromJson(json['geo']);
  }

  late String _street;
  late String _suite;
  late String _city;
  late String _zipcode;
  late Geo _geo;

  String get street => _street;
  String get suite => _suite;
  String get city => _city;
  String get zipcode => _zipcode;
  Geo get geo => _geo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['suite'] = _suite;
    map['city'] = _city;
    map['zipcode'] = _zipcode;
    map['geo'] = _geo.toJson();
    return map;
  }
}

class Geo {
  Geo({
    required String lat,
    required String lng,
  })  : _lat = lat,
        _lng = lng;

  Geo.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  late String _lat;
  late String _lng;

  String get lat => _lat;
  String get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }
}
