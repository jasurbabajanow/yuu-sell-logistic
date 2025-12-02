import 'package:flutter/material.dart';
class CalendarRangeBottomSheet extends StatefulWidget {
  const CalendarRangeBottomSheet({super.key});

  @override
  State<CalendarRangeBottomSheet> createState() => _CalendarRangeBottomSheetState();
}

class _CalendarRangeBottomSheetState extends State<CalendarRangeBottomSheet> {
  DateTime selectedDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  final List<String> weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top indicator
          Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          
          // Header with navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, size: 24),
                onPressed: _previousMonth,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Text(
                '${months[selectedDate.month - 1]} ${selectedDate.year}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, size: 24),
                onPressed: _nextMonth,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Week day headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDays.map((day) {
              return SizedBox(
                width: 45,
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          
          // Calendar grid
          _buildCalendarGrid(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final firstWeekday = firstDayOfMonth.weekday % 7;
    
    final previousMonthDays = DateTime(selectedDate.year, selectedDate.month, 0).day;
    final totalCells = ((daysInMonth + firstWeekday) / 7).ceil() * 7;

    List<Widget> dayWidgets = [];

    // Previous month's days
    for (int i = firstWeekday - 1; i >= 0; i--) {
      dayWidgets.add(_buildDayCell(
        previousMonthDays - i,
        isCurrentMonth: false,
      ));
    }

    // Current month's days
    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(_buildDayCell(day, isCurrentMonth: true));
    }

    // Next month's days
    int nextMonthDay = 1;
    while (dayWidgets.length < totalCells) {
      dayWidgets.add(_buildDayCell(
        nextMonthDay++,
        isCurrentMonth: false,
      ));
    }

    return Column(
      children: List.generate(
        (dayWidgets.length / 7).ceil(),
        (weekIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: dayWidgets
                  .skip(weekIndex * 7)
                  .take(7)
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDayCell(int day, {required bool isCurrentMonth}) {
    final currentDate = DateTime(selectedDate.year, selectedDate.month, day);
    final isSelected = isCurrentMonth && 
        currentDate.year == selectedDate.year &&
        currentDate.month == selectedDate.month &&
        day == 1;

    return GestureDetector(
      onTap: isCurrentMonth ? () {
        setState(() {
          selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
        });
      } : null,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5B7FFF) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$day',
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isCurrentMonth
                  ? (isSelected ? Colors.white : Colors.black87)
                  : Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }

  void _previousMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        1,
      );
    });
  }
}