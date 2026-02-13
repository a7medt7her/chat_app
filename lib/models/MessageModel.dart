class Messagemodel {
  final String text;
  Messagemodel(this.text);
  factory Messagemodel.fromJson(Map<String, dynamic> json) {
    return Messagemodel(json['text']);
  }
}
