class Employee {
  final int id;
  final String name;
  final int userName;
  final String email;
  final String profileImage;
  final Address address;
  final String phone;
  final String webSite;
  final Company company;

  const Employee(
      {this.id,
      this.name,
      this.company,
      this.userName,
      this.email,
      this.phone,
      this.address,
      this.profileImage,
      this.webSite});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'company': company,
      'address': address,
      'username': userName,
      'phone': phone,
      'website': webSite,
      'email': email
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '{id: $id, name: $name,company: $company,address: $address,username: $userName,phone: $phone,website: $webSite,email: $email }';
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  const Address({this.street, this.suite, this.city, this.zipcode});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      "zipcode": zipcode,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'address{street: $street,suite: $suite,city: $city,zipcode:$zipcode}';
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({
    this.name,
    this.bs,
    this.catchPhrase,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'company{name: $name,catchPhrase: $catchPhrase,bs: $bs}';
  }
}
