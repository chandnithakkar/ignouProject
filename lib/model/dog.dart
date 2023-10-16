class Dog {
   String? dogAchievements="";
   String? dogAge="";
   String? dogID="";
   String? dogBreed="";
   String? dogName="";
   String? dogPriceWTrainer="";
   String? dogPriceWoutTrainer="";
   String? trainerId="";

  Dog({
    required this.dogAchievements,
    required this.dogAge,
   required this.dogID,
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
      dogID: json['dogID'],
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
      'dogID': dogID,
      'dogBreed': dogBreed,
      'dogName': dogName,
      'dogPriceWTrainer': dogPriceWTrainer,
      'dogPriceWoutTrainer': dogPriceWoutTrainer,
      'trainerId': trainerId,
    };
  }
}
