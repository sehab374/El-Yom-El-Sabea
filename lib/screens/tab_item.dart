import 'package:flutter/material.dart';
import 'package:news/models/sourceModel.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;

  TabItem(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green)),
      child: Text(sources.name ?? "",
          style: TextStyle(color: isSelected ? Colors.white : Colors.green)),
    );
  }
}
