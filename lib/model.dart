class Etape {
  int id;
  String nom;
  String description;
  String videoUrl;
  int levelId;
  String createdAt;
  String updatedAt;
  int isValidated;

  Etape({
    required this.id,
    required this.nom,
    required this.description,
    required this.videoUrl,
    required this.levelId,
    required this.createdAt,
    required this.updatedAt,
    required this.isValidated,
  });

  factory Etape.fromMap(Map<String, dynamic> map) {
    return Etape(
      id: map['id'],
      nom: map['nom'],
      description: map['description'],
      videoUrl: map['video_url'],
      levelId: map['level_id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      isValidated: map['isValidated'],
    );
  }


}
