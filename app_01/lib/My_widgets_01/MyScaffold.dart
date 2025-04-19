import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _selectedIndex = 0; // Chỉ mục của tab được chọn

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật tab được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Scaffold")),
      body: Center(child: Text("Nội dung của tab $_selectedIndex")),
      backgroundColor: Colors.yellowAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("hello");
        },
        child: const Icon(Icons.add_ic_call),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Thêm thuộc tính này
        onTap: _onItemTapped, // Thêm xử lý khi chọn tab
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),

        ],
      ),
    );
  }
}
