import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchFieldController;
  final String hintText;
  final VoidCallback? onChanged;
  final VoidCallback? onClear;

  const CustomSearchBar({
    required this.searchFieldController,
    required this.hintText,
    this.onChanged,
    this.onClear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        controller: searchFieldController,
        style: const TextStyle(fontSize: 15),
        onChanged: (_) {
          onChanged?.call();
        },
        decoration: InputDecoration(
          isDense: true,
          hintText: "Search exercises...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          filled: true,
          fillColor: Colors.grey.shade200,
          suffixIcon: searchFieldController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchFieldController.clear();
                    onClear?.call();
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}
