class Dog {
  final String dogAchievements;
  final String dogAge;
  final String dogBreed;
  final String dogName;
  final String dogPriceWTrainer;
  final String dogPriceWoutTrainer;
  final String trainerId;

  Dog({
    required this.dogAchievements,
    required this.dogAge,
    required this.dogBreed,
    required this.dogName,
    required this.dogPriceWTrainer,
    required this.dogPriceWoutTrainer,
    required this.trainerId,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      dogAchievements: json['dogAchievements'],
      dogAge: json['dogAge'],
      dogBreed: json['dogBreed'],
      dogName: json['dogName'],
      dogPriceWTrainer: json['dogPriceWTrainer'],
      dogPriceWoutTrainer: json['dogPriceWoutTrainer'],
      trainerId: json['trainerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dogAchievements': dogAchievements,
      'dogAge': dogAge,
      'dogBreed': dogBreed,
      'dogName': dogName,
      'dogPriceWTrainer': dogPriceWTrainer,
      'dogPriceWoutTrainer': dogPriceWoutTrainer,
      'trainerId': trainerId,
    };
  }
}
