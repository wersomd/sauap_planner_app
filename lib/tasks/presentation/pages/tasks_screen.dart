import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sauap_planner/components/build_text_field.dart';
import 'package:sauap_planner/components/custom_app_bar.dart';
import 'package:sauap_planner/components/custom_menu.dart';
import 'package:sauap_planner/tasks/data/local/model/task_model.dart';
import 'package:sauap_planner/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:sauap_planner/tasks/presentation/widget/task_item_view.dart';
import 'package:sauap_planner/utils/color_palette.dart';
import 'package:sauap_planner/utils/util.dart';

import '../../../components/widgets.dart';
import '../../../utils/font_sizes.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();

  int getTaskCount(BuildContext context) {
    final state = context.read<TasksBloc>().state;
    if (state is FetchTasksSuccess) {
      return state.tasks.length;
    }
    return 0;
  }

  List<TaskModel> getTasks(BuildContext context) {
    final state = context.read<TasksBloc>().state;
    if (state is FetchTasksSuccess) {
      return state.tasks;
    }
    return [];
  }
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController searchController = TextEditingController();
  // final _user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    context.read<TasksBloc>().add(FetchTaskEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FocusScope.of(context).requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kTransparentColor,
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          key: scaffoldKey,
          drawer: const CustomMenu(),
          backgroundColor: kScaffoldColor,
          appBar: CustomAppBar(
            title: "",
            scaffoldKey: scaffoldKey,
          ),
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocConsumer<TasksBloc, TasksState>(
                listener: (context, state) {
                  if (state is LoadTaskFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(getSnackBar(state.error, kRed));
                  }

                  if (state is AddTaskFailure || state is UpdateTaskFailure) {
                    context.read<TasksBloc>().add(
                          FetchTaskEvent(),
                        );
                  }
                },
                builder: (context, state) {
                  if (state is TasksLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }

                  if (state is LoadTaskFailure) {
                    return Center(
                      child: buildText(
                        state.error,
                        kBlackColor,
                        textMedium,
                        FontWeight.normal,
                        TextAlign.center,
                        TextOverflow.clip,
                      ),
                    );
                  }

                  if (state is FetchTasksSuccess) {
                    return state.tasks.isNotEmpty || state.isSearching
                        ? Column(
                            children: [
                              BuildTextField(
                                hint: "Іздеу",
                                controller: searchController,
                                inputType: TextInputType.text,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: kGrey2,
                                ),
                                fillColor: kWhiteColor,
                                onChange: (value) {
                                  context.read<TasksBloc>().add(
                                        SearchTaskEvent(keywords: value),
                                      );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: state.tasks.length,
                                  itemBuilder: (context, index) {
                                    final task = state.tasks[index];
                                    final isOverdue = task.stopDateTime
                                        ?.isBefore(DateTime.now());
                                    return TaskItemView(
                                      taskModel: state.tasks[index],
                                      isOverdue: isOverdue!,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider(
                                      color: kGrey3,
                                    );
                                  },
                                ),
                              )
                            ],
                          )
                        : Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/tasks.svg',
                                  height: size.height * .20,
                                  width: size.width,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                buildText(
                                    'Тапсырмаларды жоспарлаңыз',
                                    kBlackColor,
                                    textBold,
                                    FontWeight.w600,
                                    TextAlign.center,
                                    TextOverflow.clip),
                                buildText(
                                    'Тапсырмаларды оңай әрі жеңіл орындаңыз',
                                    kBlackColor.withOpacity(.5),
                                    textMedium,
                                    FontWeight.normal,
                                    TextAlign.center,
                                    TextOverflow.clip),
                              ],
                            ),
                          );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
