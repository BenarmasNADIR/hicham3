import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:ui';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive breakpoints
    final bool isExtraSmall = screenWidth < 280;
    final bool isSmall = screenWidth < 350;
    final bool isMedium = screenWidth < 450;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 12 : 20,
        vertical: isSmall ? 10 : 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(isSmall ? 20 : 25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isSmall ? 20 : 25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isExtraSmall ? 8 : (isSmall ? 12 : 15),
                vertical: isExtraSmall ? 5 : 8,
              ),
              child: GNav(
                gap: isExtraSmall ? 0 : (isSmall ? 4 : (isMedium ? 6 : 8)),
                activeColor: Colors.blue,
                iconSize: isExtraSmall ? 18 : (isSmall ? 20 : 24),
                padding: EdgeInsets.symmetric(
                  horizontal:
                      isExtraSmall ? 6 : (isSmall ? 10 : (isMedium ? 15 : 20)),
                  vertical: isExtraSmall ? 6 : (isSmall ? 8 : 12),
                ),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.blue.withOpacity(0.1),
                color: Colors.grey[600],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: isSmall ? '' : 'Home',
                    iconColor: Colors.grey[600],
                    iconActiveColor: Colors.blue,
                  ),
                  GButton(
                    icon: LineIcons.history,
                    text: isSmall ? '' : 'History',
                    iconColor: Colors.grey[600],
                    iconActiveColor: Colors.blue,
                  ),
                  GButton(
                    icon: LineIcons.list,
                    text: isSmall ? '' : 'Quizzes',
                    iconColor: Colors.grey[600],
                    iconActiveColor: Colors.blue,
                  ),
                  GButton(
                    icon: LineIcons.cog,
                    text: isSmall ? '' : 'Settings',
                    iconColor: Colors.grey[600],
                    iconActiveColor: Colors.blue,
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: onTabChange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
