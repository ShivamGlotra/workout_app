import 'package:flutter/material.dart';

class TabButtons extends StatelessWidget {
  final int selectedTabIndex;
  final ValueChanged<int> onTabSelected;
  static const List<String> _tabs = ['Beginner', 'Intermediate', 'Advanced'];

  const TabButtons({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_tabs.length, (index) {
          final isSelected = selectedTabIndex == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 20),
              curve: Curves.easeInOutCubic,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.widthOf(context) * 0.05,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                _tabs[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.blue : Colors.black.withAlpha(200),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
