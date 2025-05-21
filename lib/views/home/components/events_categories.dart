import 'package:flutfest/theme.dart';
import 'package:flutter/material.dart';

class EventsCategories extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;

  const EventsCategories({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTab('All', context),
          _buildTab('Upcoming', context),
          _buildTab('Expired', context),
          _buildTab('Favorites', context),
        ],
      ),
    );
  }

  Widget _buildTab(String title, BuildContext context) {
    final bool isSelected = title == selectedTab;
    final bool isDark = AppTheme.isDarkMode(context);
    final Color selectedButtonColor =
        isDark ? AppTheme.darkButtonColor : AppTheme.lightButtonColor;
    final Color selectedTextColor =
        isDark ? AppTheme.darkTextColor : AppTheme.lightTextColor;

    final Color unselectedButtonColor = Colors.transparent;
    final Color unselectedTextColor =
        isDark ? AppTheme.darkTextColor : AppTheme.lightTextColor;

    return Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => onTabSelected(title),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              isSelected ? selectedButtonColor : unselectedButtonColor,
          foregroundColor: isSelected ? selectedTextColor : unselectedTextColor,
          side: BorderSide(color: selectedButtonColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? selectedTextColor : unselectedTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
