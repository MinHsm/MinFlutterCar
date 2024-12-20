import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool _isClick = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('MinFlutterApp'),
          backgroundColor: Colors.blue,
        ),
        body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/ic_travel_car.jpg',
                  fit: BoxFit.cover,
                )),
                Positioned.fill(
                    child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                )),
                Center(
                  child: Container(
                    clipBehavior: Clip.none,
                    width: 350,
                    height: 450,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 55,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          _isClick = true;
                                        });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(_isClick
                                                  ? Colors.white
                                                  : Colors.blue),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          )),
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                                  width: 1,
                                                  color: _isClick
                                                      ? Colors.blue
                                                      : Colors.white))),
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            color: _isClick
                                                ? Colors.blue
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 55,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          _isClick = false;
                                        });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(_isClick
                                                  ? Colors.blue
                                                  : Colors.white),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          )),
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                                  width: 1,
                                                  color: _isClick
                                                      ? Colors.white
                                                      : Colors.blue))),
                                      child: Text('Sign up',
                                          style: TextStyle(
                                              color: _isClick
                                                  ? Colors.white
                                                  : Colors.blue)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Center(
                                child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email)),
                                  validator: (mEmail) {
                                    if (mEmail == null || mEmail.isEmpty) {
                                      return '请输入邮箱';
                                    }
                                    var emailReg = RegExp(
                                        r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
                                    if (!emailReg.hasMatch(mEmail)) {
                                      return '请输入正确的邮箱地址';
                                    }
                                    return null;
                                  },
                                  onChanged: (mEmail) {
                                    _email = mEmail;
                                  }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: _isObscure,
                                onChanged: (mPwd) {
                                  _password = mPwd;
                                },
                                validator: (mPwd) {
                                  if (mPwd!.isEmpty) {
                                    return '请输入密码';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon:
                                        const Icon(Icons.lock_clock_outlined),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                        icon: Icon(_isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              child: SizedBox(
                                height: 55,
                                width: 230,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue),
                                        shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    onPressed: () {
                                      // if (_formKey.currentState?.validate() ??
                                      //     false) {
                                      //   // 如果验证通过，保存数据
                                      //   _formKey.currentState?.save();
                                      //   // 跳转页面
                                      //   Navigator.pushNamed(context, '/tabs');
                                      // } else {
                                      //   // 如果验证失败，弹出提示框
                                      //   showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) {
                                      //       return AlertDialog(
                                      //         title: const Text('错误'),
                                      //         content: const Text('账号密码输入错误！'),
                                      //         actions: <Widget>[
                                      //           TextButton(
                                      //             onPressed: () {
                                      //               Navigator.of(context).pop();
                                      //             },
                                      //             child: const Text('确认'),
                                      //           ),
                                      //         ],
                                      //       );
                                      //     },
                                      //   );
                                      // }
                                      Navigator.pushNamed(context, '/tabs');
                                    },
                                    child: Text(
                                        _isClick ? 'Sign In' : 'Sign Up',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                            Center(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(_isClick
                                      ? 'Forgot your password ?'
                                      : '')),
                            )
                          ],
                        ),
                        Positioned(
                            top: -65,
                            left: 112,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.blue, width: 2)),
                              child: CircleAvatar(
                                backgroundImage: _isClick
                                    ? const AssetImage(
                                        'assets/sigin_boy_img.jpg')
                                    : const AssetImage(
                                        'assets/sigup_boy_img.jpg'), // 替换为你的图片路径
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
