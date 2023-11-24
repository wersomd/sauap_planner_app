import 'package:flutter/material.dart';
import 'package:sauap_planner/src/domain/models/categories.model.dart';
import 'package:sauap_planner/src/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:sauap_planner/src/presentation/widgets/categories_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final searchController = SearchController();

    const int itemCount = 4;

    const sizedBox = SizedBox(
      height: 20,
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 14,
            left: 14,
            top: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: 'You have ',
                  style: theme.textTheme.bodyLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: '10 tasks',
                      style: TextStyle(
                        color: Colors.blue[600],
                      ),
                    ),
                    const TextSpan(text: ' this week'),
                  ],
                ),
              ),
              sizedBox,
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Поиск...',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: theme.textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      textStyle: theme.textTheme.labelSmall,
                    ),
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              sizedBox,
              SizedBox(
                width: size.width,
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCount,
                  itemBuilder: (context, index) => CategoriesTile(
                    icon: categoriesModel[index].icon,
                    iconColor: categoriesModel[index].iconColor,
                    tileColor: categoriesModel[index].tileColor,
                    name: categoriesModel[index].name,
                  ),
                  separatorBuilder: (content, index) => const SizedBox(
                    width: 24.0,
                  ),
                ),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's task",
                    style: theme.textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      textStyle: theme.textTheme.labelSmall,
                    ),
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
