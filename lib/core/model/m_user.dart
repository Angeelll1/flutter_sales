class MUser {
 String? username;
       String? name;
       String? user_type;

  MUser({
    this.username,
    this.name,
    this.user_type
  });

  MUser.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    user_type = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['user_type'] = this.user_type;

    return data;
  }
}
