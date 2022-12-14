import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onchanged;

  final Function(BuildContext)? settingTapped;
  final Function(BuildContext)? deleteTapped;
  const HabitTile({
    Key? key,
    required this.habitName,
    required this.habitCompleted,
    required this.onchanged,
    required this.deleteTapped,
    required this.settingTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: settingTapped,
              backgroundColor: const Color(0xffFFFFFF),
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red.shade400,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xff4b4e6d),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                  value: habitCompleted,
                  onChanged: onchanged,
                  hoverColor: Colors.white),
              Text(
                habitName,
                style: const TextStyle(
                    color: Color(0xffFFFFFF), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
