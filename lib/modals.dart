class User {
  final int? id; // make id nullable
  final String companyname;
  final String catagories;
  final String year;

  User({this.id, required this.companyname, required this.catagories, required this.year});

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id, // only include id if it's not null
      'companyname': companyname,
      'catagories': catagories,
      'year': year,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      companyname: map['companyname'],
      catagories: map['catagories'],
      year: map['year'],
    );
  }
}