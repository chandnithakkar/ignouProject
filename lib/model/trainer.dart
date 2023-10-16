class Trainer {
  final String trainerAchievements;
  final String trainerDetails;
  final String trainerExperience;
  final String trainerName;
  final String trainerSpecialization;
  final String trainerId;

  Trainer({
    required this.trainerAchievements,
    required this.trainerDetails,
    required this.trainerExperience,
    required this.trainerName,
    required this.trainerSpecialization,
    required this.trainerId,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      trainerAchievements: json['trainerAchievements'],
        trainerDetails: json['trainerDetails'],
      trainerExperience: json['trainerExperience'],
      trainerName: json['trainerName'],
        trainerSpecialization: json['trainerSpecialization'],
      trainerId: json['trainerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trainerAchievements': trainerAchievements,
      'trainerDetails': trainerDetails,
      'trainerExperience': trainerExperience,
      'trainerName': trainerName,
      'trainerSpecialization': trainerSpecialization,
      'trainerId': trainerId,
    };
  }
}
