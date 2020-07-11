import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/project/model/waitermodel.dart';

import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  Color _eyeColor;
  WaiterModel waiterModel;

  String _password = '';
  String _name = '';

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      _name = _nameController.text;
      setState(() {});
    });
    _passwordController.addListener(() {
      _password = _passwordController.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/huanghun.jpeg'),
                  fit: BoxFit.cover)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            children: <Widget>[
            SizedBox(
            height: 250,
            ),
              Container(
                child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _eyeColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                                _eyeColor = _isObscure
                                    ? Colors.grey
                                    : Theme.of(context).iconTheme.color;
                              });
                            })
                    )),
              ),
//          Text('输入的值是：$_password'),
              RaisedButton(
                  child: Text(
                    '登录',
                  ),
                  onPressed: () {
                    waiterModel.login(_name, _password);
                    if(waiterModel.getIsLogin() == true) {
                      Navigator.of(context).pushNamed('/');
                    }else {
                        showDialog(context: context,builder: (context){
                          return MyAlertDialog();
                        }, barrierDismissible: false );//当点击Dialog区域外不关闭Dialog
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: AlertDialog(
        title: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                  Icons.info_outline
              ),
            ),
            Text('AlertDialog')
          ],
        ),
        content: Text('账号密码错误，请重新输入'),
        elevation: 24,
        actions: <Widget>[
          FlatButton(
            child: Text('NO'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('YES'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}