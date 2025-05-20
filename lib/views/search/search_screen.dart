import 'package:flutter/material.dart';
import 'package:flutfest/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: AppTheme.getColorForTheme(
                context: context,
                lightModeColor: Colors.grey,
                darkModeColor: Colors.grey,
              ),
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: AppTheme.getColorForTheme(
              context: context,
              lightModeColor: AppTheme.lightTextColor,
              darkModeColor: AppTheme.darkTextColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}