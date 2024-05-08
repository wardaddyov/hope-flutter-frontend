import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hope/core/widgets/seperator.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:provider/provider.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EditButton(),
        DeleteButton(),
        SizedBox(
          width: 6,
        ),
        Separator(),
        BackToListButton(),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {

    return IconButton(
        onPressed: () {

        },
        icon: SvgPicture.asset(
          'assets/PenNewSquare.svg',
          semanticsLabel: 'edit student',
        ));
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {

        },
        icon: SvgPicture.asset(
          'assets/closeSquare.svg',
          semanticsLabel: 'delete student',
        ));
  }
}

class BackToListButton extends StatelessWidget {
  const BackToListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<CoursePageIndexProvider>()
              .changeSelectedIndex(newIndex: 3);
        },
        icon: SvgPicture.asset(
          width: 18,
          'assets/Vector.svg',
          semanticsLabel: 'delete student',
        ));
  }
}
