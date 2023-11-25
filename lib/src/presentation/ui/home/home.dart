import 'package:flutter/material.dart';
import 'package:sauap_planner/src/domain/models/categories.model.dart';
import 'package:sauap_planner/src/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:sauap_planner/src/presentation/widgets/categories_tile.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

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
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Орындалмаған ',
                    style: theme.textTheme.bodyMedium,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '10 тапсырмаңыз',
                        style: TextStyle(
                          color: blueColor,
                        ),
                      ),
                      TextSpan(text: ' бар'),
                    ],
                  ),
                ),
              ),
              sizedBox,
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Іздеу...',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  suffixIcon: Icon(
                    Icons.keyboard_voice_outlined,
                    size: 30,
                  ),
                ),
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Категориялар',
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
                      'Барлығы',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              sizedBox,
              SizedBox(
                width: size.width,
                height: 160,
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
                    'Бүгінгі тапсырмалар',
                    style: theme.textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      textStyle: theme.textTheme.labelSmall,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/details');
                    },
                    child: Text(
                      'Барлығы',
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
