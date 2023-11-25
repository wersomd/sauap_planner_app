class WelcomeModel {
  const WelcomeModel(
      {required this.title, required this.subtitle, required this.image});

  final String title;
  final String subtitle;
  final String image;
}

List<WelcomeModel> welcomeContents = [
  const WelcomeModel(
    title: 'Армандарыңды басқар!',
    subtitle:
        'Қош келдіңіз - сіздің мақсаттарыңызға жетудегі сенімді серіктесіңіз!',
    image: 'assets/images/welcome/welcome-1.png',
  ),
  const WelcomeModel(
    title: 'Ұйымдастыру әлемі!',
    subtitle:
        'Күн сайын мақсаттарыңызға жету және армандарыңызды жүзеге асырудың жаңа мүмкіндігі',
    image: 'assets/images/welcome/welcome-2.png',
  ),
  const WelcomeModel(
    title: 'Өнімділік лигасы!',
    subtitle:
        'Мұнда сіз тек күніңізді жоспарлап қана қоймайсыз. Мұнда сіз өзіңіздің табысқа жету жолыңызды кезең-кезеңімен жасайсыз.',
    image: 'assets/images/welcome/welcome-3.png',
  )
];
