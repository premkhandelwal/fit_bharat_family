import 'dart:convert';

class Images {
  String src;
  Images({
    required this.src,
  });

  Map<String, dynamic> toMap() {
    return {
      'src': src,
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      src: map['src'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source));
}
