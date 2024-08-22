import 'package:chore_chart/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:chore_chart/app.dart';
import 'package:chore_chart/theme.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;
  var _emailController = TextEditingController();
  late FocusNode _emailFocusNode;
  var _passwordController = TextEditingController();
  late FocusNode _passwordFocusNode;
  var _passwordVisibility = false;
  var _loggingIn = false;

  @override
  void initState() {
    super.initState();

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    final config = App.of(context);

    return Scaffold(
      body: Container(
        // FIXME: color: ChoresTheme.biceBlue,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ChoresTheme.biceBlue, ChoresTheme.amethyst],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 44.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 570.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Cleanup Your Act',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .typography
                              .white
                              .headlineMedium
                              ?.apply(fontFamily: 'Outfit')
                              .copyWith(letterSpacing: 0.0),
                        ),
                        Text(
                          'Login to track your household chores.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .typography
                              .white
                              .labelLarge
                              ?.apply(fontFamily: 'Readex Pro')
                              .copyWith(letterSpacing: 0.0),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            autofocus: true,
                            autofillHints: [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Email'),
                            style: Theme.of(context)
                                .typography
                                .white
                                .bodyLarge
                                ?.copyWith(letterSpacing: 0.0),
                            keyboardType: TextInputType.emailAddress,
                            // FIXME: validator: _emailTextControllerValidator.asValidator(context),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextField(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            autofocus: true,
                            autofillHints: [AutofillHints.password],
                            obscureText: !_passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: InkWell(
                                onTap: () =>
                                    setState(() => _passwordVisibility = !_passwordVisibility),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Theme.of(context).typography.white.labelLarge?.color,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            style: Theme.of(context)
                                .typography
                                .white
                                .bodyLarge
                                ?.copyWith(letterSpacing: 0.0),
                            // FIXME: validator: _passwordTextControllerValidator.asValidator(context),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.go("/resetPassword");
                            context.pushNamed(
                              'ResetPassword',
                              extra: <String, dynamic>{
                                kTransitionInfo: PageTransitionType.rightToLeft,
                              },
                            );
                          },
                          child: Text(
                            'Reset Password',
                            style: Theme.of(context)
                                .typography
                                .white
                                .bodyMedium
                                ?.apply(color: Provider.of<AppTheme>(context).primary)
                                .copyWith(letterSpacing: 0.0),
                          ),
                        ),
                        FilledButton(
                          onPressed: () async {
                            setState(() => _loggingIn = true);
                            final user = (await Supabase.instance.client.auth.signInWithPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ))
                                .user;
                            if (user == null) return;
                            context.pushReplacementNamed('/');
                          },
                          child: Text('Log In'),
                          // options: FFButtonOptions(
                          //   width: double.infinity,
                          //   height: 44.0,
                          //   padding: EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 0.0, 0.0, 0.0),
                          //   iconPadding: EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 0.0, 0.0, 0.0),
                          //   color: Theme.of(context).primary,
                          //   textStyle: Theme.of(context)
                          //       .typography
                          //       .white
                          //       .titleSmall
                          //       ?.apply(color: Colors.white)
                          //       .copyWith(letterSpacing: 0.0),
                          //   elevation: 3.0,
                          //   borderSide: BorderSide(
                          //     color: Colors.transparent,
                          //     width: 1.0,
                          //   ),
                          //   borderRadius: BorderRadius.circular(12.0),
                          // ),
                        ),
                        if (false)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Opacity(
                                  opacity: 0.75,
                                  child: Container(
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: Provider.of<AppTheme>(context).secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  'or',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .typography
                                      .white
                                      .labelLarge
                                      ?.copyWith(letterSpacing: 0.0),
                                ),
                              ),
                              Expanded(
                                child: Opacity(
                                  opacity: 0.75,
                                  child: Container(
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color: Provider.of<AppTheme>(context).secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        // See https://console.cloud.google.com/apis/credentials?authuser=1&project=chore-chart-fo3w11
                        FilledButton(
                          onPressed: () async {
                            setState(() => _loggingIn = true);
                            await Supabase.instance.client.auth.signInWithOAuth(
                              OAuthProvider.google,
                              redirectTo: '',
                              authScreenLaunchMode: LaunchMode.inAppBrowserView,
                            );

                            final user = await Supabase.instance.client.auth.onAuthStateChange
                                .lastWhere(
                                  (state) => state.event == AuthChangeEvent.signedIn,
                                  orElse: () => AuthState(AuthChangeEvent.initialSession, null),
                                )
                                .then((state) => state.session?.user);
                            if (user != null) context.pushReplacementNamed('/');
                          },
                          child: Text('Login with Google'),
                          // FIXME: icon: FaIcon(
                          //   FontAwesomeIcons.google,
                          //   size: 20.0,
                          // ),
                          // options: FFButtonOptions(
                          //   width: double.infinity,
                          //   height: 44.0,
                          //   padding: EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 0.0, 0.0, 0.0),
                          //   iconPadding: EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 0.0, 0.0, 0.0),
                          //   color: Theme.of(context).secondaryBackground,
                          //   textStyle: Theme.of(context)
                          //       .typography
                          //       .white
                          //       .titleSmall
                          //       ?.apply(
                          //           // FIXME: color: Theme.of(context).primaryText
                          //           )
                          //       .copyWith(letterSpacing: 0.0),
                          //   elevation: 0.0,
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).alternate,
                          //     width: 2.0,
                          //   ),
                          //   borderRadius: BorderRadius.circular(12.0),
                          //   hoverColor: Theme.of(context).primaryBackground,
                          // ),
                        ),
                        // FIXME: https://supabase.com/docs/guides/auth/auth-anonymous
                        FilledButton(
                          onPressed: () async {
                            setState(() => _loggingIn = true);
                            final user = await Supabase.instance.client.auth
                                .signInAnonymously()
                                .then((response) => response.user);
                            if (user != null)
                              context.pushReplacementNamed("/");
                            else {
                              setState(() => _loggingIn = false);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Could not login anonymously. Please try again or create an account.',
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                ),
                              );
                            }
                          },
                          child: Text('Continue as Guest'),
                          // options: FFButtonOptions(
                          //   width: double.infinity,
                          //   height: 44.0,
                          //   padding: EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 0.0, 0.0, 0.0),
                          //   iconPadding: EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 0.0, 0.0, 0.0),
                          //   color: Theme.of(context).secondaryBackground,
                          //   textStyle: Theme.of(context)
                          //       .typography
                          //       .white
                          //       .titleSmall
                          //       ?.apply(
                          //         color: Theme.of(context).primaryText,
                          //       )
                          //       .copyWith(letterSpacing: 0.0),
                          //   elevation: 0.0,
                          //   borderSide: BorderSide(
                          //     color: Theme.of(context).alternate,
                          //     width: 2.0,
                          //   ),
                          //   borderRadius: BorderRadius.circular(12.0),
                          //   hoverColor: Theme.of(context).primaryBackground,
                          // ),
                        ),
                        // You will have to add an action on this rich text to go to your login page.
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account?  ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: Theme.of(context)
                                      .typography
                                      .white
                                      .bodyMedium
                                      ?.apply(
                                          color:
                                              Theme.of(context).typography.white.bodyMedium?.color)
                                      .copyWith(
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      context.pushNamed(
                                        '/signup',
                                        extra: <String, dynamic>{
                                          kTransitionInfo: PageTransitionType.rightToLeft,
                                        },
                                      );
                                    },
                                )
                              ],
                              style: Theme.of(context)
                                  .typography
                                  .white
                                  .bodyMedium
                                  ?.copyWith(letterSpacing: 0.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                // FIXME: Container.animateOnPageLoad(),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: buildSignUp(context),
                ),
              ),
              // TODO: Add login form
              Text('Copyright © 2024 Snow Developments, LLC.'),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildSignUp(BuildContext context) {
    return RichText(
      textScaler: MediaQuery.of(context).textScaler,
      text: TextSpan(
        children: [
          TextSpan(text: 'Don\'t have an account?  '),
          TextSpan(
            text: 'Sign Up',
            style: Theme.of(context)
                .typography
                .dense
                .bodyMedium
                ?.apply(color: Theme.of(context).colorScheme.primary)
                .copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.0,
                ),
            mouseCursor: SystemMouseCursors.click,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                // Go to Create Account page
                context.pushNamed(
                  'CreateAccount',
                  extra: <String, dynamic>{
                    // FIXME: Use the PageTransitionsTheme
                    // kTransitionInfoKey: TransitionInfo(
                    //     hasTransition: true,
                    //     transitionType:
                    //         PageTransitionType.rightToLeft),
                  },
                );
              },
          )
        ],
        style: Theme.of(context).typography.dense.bodyMedium?.copyWith(letterSpacing: 0.0),
      ),
    );
  }
}

extension on List<Widget> {
  List<Widget> divide(Widget divider) {
    return this.expand<Widget>((widget) => [widget, divider]).take(this.length * 2 - 1).toList();
  }
}
