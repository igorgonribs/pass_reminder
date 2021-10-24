class Access {
  late String accessName;
  late String username;
  late String password;

  Access(this.accessName, this.username, this.password);

  factory Access.fromJson(dynamic json) {
    return Access(json['accessName'] as String, json['username'] as String, json['password'] as String);
  }

  @override
  String toString() {
    return '{ ${this.accessName}, ${this.username}, ${this.password} }';
  }
}