import 'package:flutter/material.dart';
import 'package:wort_plus/src/theme/app_colors.dart';

enum SegmentSwitcherType { learn, quiz }

class SegmentSwitcher extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  final SegmentSwitcherType type;

  const SegmentSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    this.type = SegmentSwitcherType.learn, // Standard
  });

  @override
  Widget build(BuildContext context) {
    final isQuiz = type == SegmentSwitcherType.quiz;

    final Color borderColor = isQuiz
        ? AppColors.secondaryColor
        : AppColors.secondaryColor;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300.0, maxHeight: 32.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              _buildTab(context, 'Levels', 0),
              _buildTab(context, 'Word Types', 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, int index) {
    final isSelected = index == selectedIndex;
    final isQuiz = type == SegmentSwitcherType.quiz;

    final Color selectedColor = isQuiz
        ? AppColors.primaryColor
        : AppColors.primaryColor;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: AppColors.textColor.withAlpha(
                  isSelected ? 255 : (0.85 * 255).round(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
