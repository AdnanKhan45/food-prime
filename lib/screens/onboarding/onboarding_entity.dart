
class OnBoardingEntity {
  final String? image;
  final String? title;
  final String? description;

  OnBoardingEntity({this.image, this.title, this.description});

  static List<OnBoardingEntity> onBoardingData = [
    OnBoardingEntity(
        image: "onboarding_1.png",
        title: "On demand & runtime\nlocation",
        description: "Pick from your location at\nyour preferred date\nand time."
    ),
    OnBoardingEntity(
        image: "onboarding_2.png",
        title: "Anything, anytime,\nanywhere.",
        description: "Whether it's a parcel, a cheque or\nan important doc, we'll parcel."
    ),
    OnBoardingEntity(
        image: "onboarding_3.png",
        title: "Live track\nyour shipments",
        description: "See a realtime view of your courier\non the map on the day of delivery."
    ),
  ];
}