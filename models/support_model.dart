class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"] ?? '',
        text: json["text"] ?? '',
      );

  /// Use toJson Method only if needed
  // Map<String, dynamic> toJson() => {
  //     "url": url ?? '',
  //     "text": text ?? '',
  // };
}
