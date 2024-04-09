class OnboardingModel {
  const OnboardingModel(
      {required this.title, required this.subtitle, required this.image});

  final String title;
  final String subtitle;
  final String image;
}

List<OnboardingModel> onboardingContents = [
  const OnboardingModel(
    title: 'Армандарыңды басқар!',
    subtitle:
        'Қош келдіңіз - сіздің мақсаттарыңызға жетудегі сенімді серіктесіңіз!',
    image: 'assets/images/onboarding/onboarding-1.png',
  ),
  const OnboardingModel(
    title: 'Ұйымдастыру әлемі!',
    subtitle:
        'Күн сайын мақсаттарыңызға жету және армандарыңызды жүзеге асырудың жаңа мүмкіндігі',
    image: 'assets/images/onboarding/onboarding-2.png',
  ),
  const OnboardingModel(
    title: 'Өнімділік лигасы!',
    subtitle:
        'Мұнда сіз тек күніңізді жоспарлап қана қоймайсыз. Мұнда сіз өзіңіздің табысқа жету жолыңызды кезең-кезеңімен жасайсыз.',
    image: 'assets/images/onboarding/onboarding-3.png',
  )
];
