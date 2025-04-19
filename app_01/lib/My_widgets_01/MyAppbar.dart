import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    return Scaffold(
      // Tiêu đề của ứng dụng
      appBar: AppBar(
        title: Text("App 02"),
        backgroundColor: Colors.blue,
        //độ đổ bóng của appbar
        elevation: 20,
        actions: [
          IconButton(
            onPressed: () {
              print('b1');
            },
           icon: Icon(Icons.search),
          ),
        ],
      ),

      // AppBar
      backgroundColor: Colors.amberAccent,

      body: Center(child: Text("Nội dung chính")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("pressed");
        },
        child: const Icon(Icons.add_ic_call),
      ),

      // FloatingActionButton
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
        ],
      ), // BottomNavigationBar
    ); // Scaffold
  }
}
