import 'package:flutter/material.dart';

class CustomFilterChips extends StatefulWidget {
  final Map<String, Color> allFilters;
  final Set<String> selectedFilters;
  final ValueChanged<Set<String>> onChanged;
  final Color? selectedColor;
  final Color? textColor;

  const CustomFilterChips({
    required this.allFilters,
    required this.selectedFilters,
    required this.onChanged,
    this.selectedColor,
    this.textColor,
    super.key,
  });

  @override
  State<CustomFilterChips> createState() => _CustomFilterChipsState();
}

class _CustomFilterChipsState extends State<CustomFilterChips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter by Muscle",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedFilters.isNotEmpty
                        ? widget.selectedFilters.clear()
                        : widget.selectedFilters.addAll(widget.allFilters.keys);
                  });
                  widget.onChanged(widget.selectedFilters);
                },
                child: Text(
                  widget.selectedFilters.isNotEmpty
                      ? "Clear All"
                      : "Select All",
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.allFilters.entries.map((entry) {
                final filter = entry.key;
                final filterColor = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    showCheckmark: false,
                    label: Text(filter),
                    selected: widget.selectedFilters.contains(filter),
                    onSelected: (selected) {
                      setState(() {
                        selected
                            ? widget.selectedFilters.add(filter)
                            : widget.selectedFilters.remove(filter);
                      });
                      widget.onChanged(widget.selectedFilters);
                    },
                    backgroundColor: Colors.white,
                    selectedColor: widget.selectedColor ?? filterColor,
                    labelStyle: TextStyle(
                      letterSpacing: 1.3,
                      height: 1.5,
                      color: widget.selectedFilters.contains(filter)
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    elevation: widget.selectedFilters.contains(filter) ? 2 : 0,
                    shadowColor: filterColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: widget.selectedFilters.contains(filter)
                          ? filterColor
                          : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
