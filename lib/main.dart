import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // 달력에서 선택된 날짜를 저장할 변수 (지금은 안 쓰지만 선언만 해둠)
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나만의 캘린더'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: TableCalendar(
          // 1. 달력의 시작과 끝 날짜 설정
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),

          // 2. 현재 포커스된 날짜 (오늘 날짜)
          focusedDay: _focusedDay,

          // 3. 달력 스타일 꾸미기 (선택 사항)
          headerStyle: const HeaderStyle(
            formatButtonVisible: false, // 2주 보기/1주 보기 버튼 숨기기
            titleCentered: true,        // 달력 제목 중앙 정렬
          ),
        ),
      ),
    );
  }
}