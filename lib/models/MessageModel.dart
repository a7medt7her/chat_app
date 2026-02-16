class Messagemodel {
  final String text;
  final String urlimage;
  Messagemodel(this.text, {required this.urlimage});
  factory Messagemodel.fromJson(Map<String, dynamic> json) {
    return Messagemodel(json['text'], urlimage: json['urlimage']);
  }
}
