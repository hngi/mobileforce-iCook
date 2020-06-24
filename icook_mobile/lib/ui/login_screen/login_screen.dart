import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class OrDivider extends StatelessWidget {
  //static const kPrimaryColor = Color(0x3);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }
}
class _LoginScreenState extends State<LoginScreen> {

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',

            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blueAccent,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,


            ),
          ),
        ),
      ],
    );
  }


    Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blueAccent,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }


  Widget _passwordRow() {
    return Container(
      child: Row(
        children: <Widget>[
           Text(
          'Password',
          style: kLabelStyle,
              ),
           SizedBox(width: 120.0),
           Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () => print('Forgot Password Button Pressed'),
              padding: EdgeInsets.only(right: 0.0),
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 14),

              ),
            ),
          ),
        ]
       ),
     );
  }

  Widget _createAccountRow() {
    return Container(
      child: Row(
          children: <Widget>[
            Text(
              'New on iCook?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(width: 20.0),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () => print('Create Account Button Pressed'),
                padding: EdgeInsets.only(right: 0.0),
                child: Text(
                  'CREATE AN ACCOUNT',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 16),

                ),
              ),
            ),
          ]

      ),
    );

  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 200,
        child: Container(
          width: 200.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey, width: 1.0),
            color: Colors.grey,
          ),
          child: new Material(
            child: MaterialButton(
              child: Text('Log in',
                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
              ),
              onPressed: (){},
              highlightColor: Colors.blueAccent,
              splashColor: Colors.blueAccent,
            ),
            color: Colors.transparent,
            borderRadius: new BorderRadius.circular(12.0),
          ),
        ),

    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        OrDivider(),
        ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35.0,
        width: 217.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildFSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35.0,
        width: 42.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/images/google.png',
            ),
          ),
          _buildFSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/images/facebook.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,

              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        height: 100,
                        width: 120,
                        child: Image.asset('assets/images/images3.png',)
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _passwordRow(),
                      _buildPasswordTF(),
                                            //_buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignupBtn(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _createAccountRow(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


