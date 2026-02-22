class Userdata {
  final String name;
  final String age;
  final String bio;
  final String gender;
  final String imageurl;

  Userdata(this.name, this.age, this.bio, this.gender, this.imageurl);
  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      json['name'],
      json['age'],
      json['bio'],
      json['gender'],
      json['imageurl'],
    );
  }
}
