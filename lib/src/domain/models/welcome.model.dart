class WelcomeModel {
  const WelcomeModel(
      {required this.title, required this.subtitle, required this.image});

  final String title;
  final String subtitle;
  final String image;
}

List<WelcomeModel> welcomeContents = [
  const WelcomeModel(
    title: 'Manage Task With Planner',
    subtitle: 'Manage your team and task everyday with Planner',
    image: 'assets/images/welcome/welcome-1.png',
  ),
  const WelcomeModel(
    title: 'Manage Task With Planner',
    subtitle: 'Manage your team and task everyday with Planner',
    image: 'assets/images/welcome/welcome-2.png',
  ),
  const WelcomeModel(
    title: 'Manage Task With Planner',
    subtitle: 'Manage your team and task everyday with Planner',
    image: 'assets/images/welcome/welcome-3.png',
  )
];
