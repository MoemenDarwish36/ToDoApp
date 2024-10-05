import 'package:flutter/material.dart';
import 'package:todos/ui/utilities/app_colors.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            color: AppColors.primaryColor,
            height: MediaQuery.of(context).size.height * .1,
            width: 4,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "title",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "title",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .01,
              horizontal: MediaQuery.of(context).size.width * .055,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryColor),
            child: const Icon(
              Icons.check,
              color: AppColors.white,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
