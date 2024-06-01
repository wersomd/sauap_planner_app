import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/widgets.dart';
import '../../../routes/pages.dart';
import '../../../utils/color_palette.dart';
import '../../../utils/font_sizes.dart';
import '../../../utils/util.dart';
import '../../data/local/model/task_model.dart';
import '../bloc/tasks_bloc.dart';

class TaskItemView extends StatefulWidget {
  final TaskModel taskModel;
  final bool isOverdue;
  const TaskItemView({
    super.key,
    required this.taskModel,
    required this.isOverdue,
  });

  @override
  State<TaskItemView> createState() => _TaskItemViewState();
}

class _TaskItemViewState extends State<TaskItemView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is FetchTasksSuccess) {
          final taskModel =
              state.tasks.firstWhere((task) => task.id == widget.taskModel.id);

          final isOverdue =
              taskModel.stopDateTime != null && taskModel.endTime != null
                  ? DateTime(
                          taskModel.stopDateTime!.year,
                          taskModel.stopDateTime!.month,
                          taskModel.stopDateTime!.day,
                          taskModel.endTime!.hour,
                          taskModel.endTime!.minute)
                      .isBefore(DateTime.now())
                  : taskModel.stopDateTime?.isBefore(DateTime.now()) ?? false;

          return Container(
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
              color: widget.isOverdue ? kRed : kWhiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: widget.taskModel.completed,
                  onChanged: (value) {
                    setState(() {
                      widget.taskModel.completed = value!;
                    });

                    context.read<TasksBloc>().add(
                          UpdateTaskEvent(taskModel: widget.taskModel),
                        );
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: buildText(
                              widget.taskModel.title,
                              widget.isOverdue ? kWhiteColor : kBlackColor,
                              textMedium,
                              FontWeight.w500,
                              TextAlign.start,
                              TextOverflow.clip,
                            ),
                          ),
                          PopupMenuButton<int>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: kWhiteColor,
                            elevation: 1,
                            onSelected: (value) {
                              switch (value) {
                                case 0:
                                  Navigator.pushNamed(
                                    context,
                                    Pages.updateTask,
                                    arguments: widget.taskModel,
                                  );
                                  break;
                                case 1:
                                  context.read<TasksBloc>().add(
                                        DeleteTaskEvent(
                                          taskModel: widget.taskModel,
                                        ),
                                      );
                                  break;
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svgs/edit.svg',
                                        width: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      buildText(
                                        'Өзгерту',
                                        kBlackColor,
                                        textMedium,
                                        FontWeight.normal,
                                        TextAlign.start,
                                        TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svgs/delete.svg',
                                        width: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      buildText(
                                        'Жою',
                                        kRed,
                                        textMedium,
                                        FontWeight.normal,
                                        TextAlign.start,
                                        TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ];
                            },
                            child: SvgPicture.asset(
                                'assets/svgs/vertical_menu.svg'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildText(
                        widget.taskModel.description,
                        isOverdue ? kWhiteColor : kBlackColor,
                        textSmall,
                        FontWeight.normal,
                        TextAlign.start,
                        TextOverflow.clip,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/calender.svg',
                              width: 12,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: buildText(
                                '${formatDate(dateTime: widget.taskModel.startDateTime.toString())} - ${formatDate(dateTime: widget.taskModel.stopDateTime.toString())}',
                                widget.isOverdue ? kWhiteColor : kBlackColor,
                                textTiny,
                                FontWeight.w400,
                                TextAlign.start,
                                TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
