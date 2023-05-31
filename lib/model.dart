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
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'description': description,
      'video_url': videoUrl,
      'level_id': levelId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'isValidated': isValidated,
    };
  }
}

class Progression {
  int id;
  String date;
  String location;
  String weather;
  String notes;
  int userId;
  int etapeId;
  int surfProgression;
  int kiteProgression;
  int wingfoilProgression;
  String createdAt;
  String updatedAt;
  String photo1Url;
  String photo2Url;
  String photo3Url;

  Progression({
    required this.id,
    required this.date,
    required this.location,
    required this.weather,
    required this.notes,
    required this.userId,
    required this.etapeId,
    required this.surfProgression,
    required this.kiteProgression,
    required this.wingfoilProgression,
    required this.createdAt,
    required this.updatedAt,
    required this.photo1Url,
    required this.photo2Url,
    required this.photo3Url,
  });

  factory Progression.fromMap(Map<String, dynamic> map) {
    return Progression(
      id: map['id'],
      date: map['date'],
      location: map['location'],
      weather: map['weather'],
      notes: map['notes'],
      userId: map['user_id'],
      etapeId: map['etape_id'],
      surfProgression: map['surf_progression'],
      kiteProgression: map['kite_progression'],
      wingfoilProgression: map['wingfoil_progression'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      photo1Url: map['photo1_url'],
      photo2Url: map['photo2_url'],
      photo3Url: map['photo3_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'location': location,
      'weather': weather,
      'notes': notes,
      'user_id': userId,
      'etape_id': etapeId,
      'surf_progression': surfProgression,
      'kite_progression': kiteProgression,
      'wingfoil_progression': wingfoilProgression,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'photo1_url': photo1Url,
      'photo2_url': photo2Url,
      'photo3_url': photo3Url,
    };
  }
}

class Level {
  int id;
  String nom;
  String description;
  int hoursNeeded;
  String videoUrl;
  int sportId;
  String createdAt;
  String updatedAt;

  Level({
    required this.id,
    required this.nom,
    required this.description,
    required this.hoursNeeded,
    required this.videoUrl,
    required this.sportId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Level.fromMap(Map<String, dynamic> map) {
    return Level(
      id: map['id'],
      nom: map['nom'],
      description: map['description'],
      hoursNeeded: map['hours_needed'],
      videoUrl: map['video_url'],
      sportId: map['sport_id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'description': description,
      'hours_needed': hoursNeeded,
      'video_url': videoUrl,
      'sport_id': sportId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}



