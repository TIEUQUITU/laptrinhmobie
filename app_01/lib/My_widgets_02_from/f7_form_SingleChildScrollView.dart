import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormBasicDemoState();
}

class FormBasicDemoState extends State<FormBasicDemo> {
  // Sử dụng GlobalKey để truy cập Form
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateOfBirthController = TextEditingController();


  bool _obscurePassword = true;
  String? _name;
  String? _selectedCity;
  String? _gender;
  bool _isAgreed = false;
  DateTime? _dateOfBirth;

  final List<String> _cities = [
    'Hà Nội',
    'TP.HCM',
    'Đà Nẵng',
    'Cần Thơ',
    'Hải Phòng',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form cơ bản")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Họ và tên

                TextFormField(
                  controller: _dateOfBirthController, // Dùng để lấy/gán giá trị ô nhập
                  decoration: InputDecoration(
                    labelText: 'Ngày sinh',            // Nhãn hiển thị phía trên ô
                    hintText: 'Chọn ngày sinh của bạn',// Gợi ý hiển thị khi ô còn trống
                    border: OutlineInputBorder(),      // Viền hình chữ nhật
                    suffixIcon: Icon(Icons.calendar_today), // Icon lịch bên phải
                  ),
                  readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(), // 👉 luôn là ngày hiện tại
                      );

                      if (pickedDate != null) {
                        String formatted = DateFormat('dd/MM/yyyy').format(pickedDate);
                        setState(() {
                          _dateOfBirthController.text = formatted;
                        });
                      }
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vui lòng chọn ngày sinh";
                        }
                        return null; // Hợp lệ
                      };
                    }
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: "Họ và tên",
                    hintText: "Nhập họ và tên của bạn",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _name = value,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty || RegExp(r'\d').hasMatch(value)) {
                      return 'Họ và tên không được để trống hoặc chứa số';
                    }
                    return null;
                  },
                ),
                Text(
                  'Giới tính',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                FormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng chọn giới tính';
                    }
                    return null;
                  },
                  initialValue: _gender,
                  builder: (FormFieldState<String> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioListTile<String>(
                          title: Text('Nam'),
                          value: 'male',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                              state.didChange(value);
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Text('Nữ'),
                          value: 'female',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                              state.didChange(value);
                            });
                          },
                        ),

                        if (state.hasError)
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              state.errorText!,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 24),

                SizedBox(height: 20),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Email không hợp lệ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Số điện thoại
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Số điện thoại',
                    hintText: 'Nhập số điện thoại của bạn',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Số điện thoại phải có đúng 10 chữ số';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Mật khẩu
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    hintText: 'Nhập mật khẩu',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    }
                    if (value.length < 6) {
                      return 'Mật khẩu phải có ít nhất 6 ký tự';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Xác nhận mật khẩu
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Xác nhận mật khẩu',
                    hintText: 'Nhập lại mật khẩu',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng xác nhận mật khẩu';
                    }
                    if (value != _passwordController.text) {
                      return 'Mật khẩu không khớp';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Thành phố
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Thành phố",
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedCity,
                  items: _cities.map((city) {
                    return DropdownMenuItem(
                      child: Text(city),
                      value: city,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng chọn thành phố';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                CheckboxListTile(
                  title: Text("Đồng ý với điều khoản của công ty ABC."),
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                      print("Đồng ý : $_isAgreed");
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),




                SizedBox(height: 50),
                // Nút Submit và Reset
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Xin chào $_name")),
                          );
                        }
                      },
                      child: Text("Submit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          _name = null;
                          _selectedCity = null;
                          _fullnameController.clear();
                          _emailController.clear();
                          _phoneController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                        });
                      },
                      child: Text("Reset"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
