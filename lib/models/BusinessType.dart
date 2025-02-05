class Businesstype {
  final int id;
  final String name;

  Businesstype({required this.id, required this.name});

  factory Businesstype.fromJson(Map<String, dynamic> json) {
    return Businesstype(
      id: json['id'],
      name: json['name'] ?? '', // Ensure 'name' is being mapped correctly
    );
  }
}
