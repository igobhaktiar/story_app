class UserModel {
  UserModel({
    String? createdAt,
    String? name,
    String? avatar,
    String? email,
    String? username,
    String? password,
    String? id,
  }) {
    _createdAt = createdAt;
    _name = name;
    _avatar = avatar;
    _email = email;
    _username = username;
    _password = password;
    _id = id;
  }

  UserModel.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _name = json['name'];
    _avatar = json['avatar'];
    _email = json['email'];
    _username = json['username'];
    _password = json['password'];
    _id = json['id'];
  }

  String? _createdAt;
  String? _name;
  String? _avatar;
  String? _email;
  String? _username;
  String? _password;
  String? _id;

  UserModel copyWith({
    String? createdAt,
    String? name,
    String? avatar,
    String? email,
    String? username,
    String? password,
    String? id,
  }) =>
      UserModel(
        createdAt: createdAt ?? _createdAt,
        name: name ?? _name,
        avatar: avatar ?? _avatar,
        email: email ?? _email,
        username: username ?? _username,
        password: password ?? _password,
        id: id ?? _id,
      );

  String? get createdAt => _createdAt;

  String? get name => _name;

  String? get avatar => _avatar;

  String? get email => _email;

  String? get username => _username;

  String? get password => _password;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['email'] = _email;
    map['username'] = _username;
    map['password'] = _password;
    map['id'] = _id;
    return map;
  }
}
