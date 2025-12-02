import 'package:flutter/material.dart';
import 'labs/lab6_screen.dart';
import 'labs/lab7_screen.dart';
import 'labs/lab8_screen.dart';
import 'labs/lab9_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Labs',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF38BDF8),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? _selectedLab; // 6,7,8,9 або null

  Widget _buildLabContent() {
    switch (_selectedLab) {
      case 6:
        return const Lab6Screen();
      case 7:
        return const Lab7Screen();
      case 8:
        return const Lab8Screen();
      case 9:
        return const Lab9Screen();
      default:
        return const Center(
          child: Text(
            'Вибери лабораторну в меню зліва',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedLab == null
              ? 'Головний екран'
              : 'Лабораторна $_selectedLab',
        ),
      ),
      drawer: _CustomDrawer(
        onLabSelected: (labNumber) {
          setState(() {
            _selectedLab = labNumber;
          });
          Navigator.pop(context);
        },
      ),
      body: _buildLabContent(),
    );
  }
}

class _CustomDrawer extends StatelessWidget {
  final Function(int) onLabSelected;

  const _CustomDrawer({required this.onLabSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF38BDF8), Color(0xFF0EA5E9)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.science, size: 48, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'Лабораторні',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildLabTile(6, 'Лабораторна 6', Icons.looks_6),
          _buildLabTile(7, 'Лабораторна 7', Icons.filter_7),
          _buildLabTile(8, 'Лабораторна 8', Icons.filter_8),
          _buildLabTile(9, 'Лабораторна 9', Icons.filter_9),
        ],
      ),
    );
  }

  Widget _buildLabTile(int labNumber, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => onLabSelected(labNumber),
    );
  }
}
