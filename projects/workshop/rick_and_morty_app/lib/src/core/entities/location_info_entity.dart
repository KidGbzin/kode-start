class LocationInfo {
  
  final String name;
  final String url;

  LocationInfo({
    required this.name,
    required this.url,
  });

  factory LocationInfo.fromMap(Map<String, dynamic> map) {
    return LocationInfo(
      name: map['name'],
      url: map['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}