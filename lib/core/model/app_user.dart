class AppUser {
  String? id;
  String? name;
  String? email;
  String? password;
  String? DOB;
  String? Bio;
  AppUser({this.id, this.name, this.email, this.password, this.DOB, this.Bio});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['DOB'] = DOB;
    data['Bio'] = Bio;
    return data;
  }

  AppUser.fromJson(Map<String, dynamic> json, String id) {
    this.id = id;
    name = json['name'];
    email = json['email'];
    password = json['password'];
    DOB = json['DOB'];
    Bio = json['Bio'];
  }
}