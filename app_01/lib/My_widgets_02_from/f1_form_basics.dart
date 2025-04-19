import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  // sử dụng Glabal Key để truy cập form
  final _formKey = GlobalKey<FormState>();
  String? _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form cơ bản"),
      ), // AppBar

      body: Padding(
        padding: EdgeInsets.all(16.0),
        // Form là widget chứa và quản lý các trường nhập liệu

        child: Form(
           key : _formKey ,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Ho va Ten",
                  hintText: "nhap ho ten",
                  border: OutlineInputBorder()
                ),
                onSaved : (value){
                    _name = value;
                },
              ),
              SizedBox(height: 50,),
              Row( // Bố cục theo hàng ngang (horizontal)
                children: [
                  ElevatedButton(
                    onPressed: () { // Callback khi nhấn nút
                      if (_formKey.currentState!.validate()) { // Kiểm tra các trường trong form có hợp lệ không
                        _formKey.currentState!.save(); // Lưu giá trị đã nhập (gọi hàm onSaved nếu có)

                        ScaffoldMessenger.of(context).showSnackBar( // Hiển thị SnackBar (hộp thông báo nhỏ)
                            SnackBar(content: Text("Xin chào $_name")) // Nội dung thông báo, dùng biến _name
                        );
                      }
                    },
                    child: Text("Submit"), // Văn bản hiển thị trên nút
                  ), // ElevatedButton
                      SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        _name = null;
                      });
                    }, // Nút Reset (chưa có chức năng)
                    child: Text("Reset"), // Văn bản của nút
                  ),
                ],
              )
            ],
          ),
        ), // Form
      ), // Padding
    ); // Scaffold
  }
}
