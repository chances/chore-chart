import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:chore_chart/app.dart';
import 'package:chore_chart/theme.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

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
                          child: TextFormField(
                            controller: _model.emailTextController,
                            focusNode: _model.emailFocusNode,
                            autofocus: true,
                            autofillHints: [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: Theme.of(context)
                                  .typography
                                  .white
                                  .labelLarge
                                  ?.copyWith(letterSpacing: 0.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).cardColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).primaryBackground,
                            ),
                            style: Theme.of(context)
                                .typography
                                .white
                                .bodyLarge
                                ?.copyWith(letterSpacing: 0.0),
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.emailTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.passwordTextController,
                            focusNode: _model.passwordFocusNode,
                            autofocus: true,
                            autofillHints: [AutofillHints.password],
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: Theme.of(context)
                                  .typography
                                  .white
                                  .labelLarge
                                  ?.copyWith(letterSpacing: 0.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).cardColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).primaryBackground,
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordVisibility =
                                      !_model.passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Theme.of(context)
                                      .typography
                                      .white
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            style: Theme.of(context)
                                .typography
                                .white
                                .bodyLarge
                                ?.copyWith(letterSpacing: 0.0),
                            validator: _model.passwordTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            // Go to Forgot Password page
                            context.pushNamed(
                              'ResetPassword',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          },
                          child: Text(
                            'Reset Password',
                            style: Theme.of(context)
                                .typography
                                .white
                                .bodyMedium
                                ?.apply(color: Theme.of(context).primary)
                                .copyWith(letterSpacing: 0.0),
                          ),
                        ),
                        FilledButton(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            final user = await authManager.signInWithEmail(
                              context,
                              _model.emailTextController.text,
                              _model.passwordTextController.text,
                            );
                            if (user == null) {
                              return;
                            }
                            context.goNamedAuth('Home', context.mounted);
                          },
                          child: Text('Log In'),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Theme.of(context).primary,
                            textStyle: Theme.of(context)
                                .typography
                                .white
                                .titleSmall
                                ?.apply(color: Colors.white)
                                .copyWith(letterSpacing: 0.0),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
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
                                      color: Theme.of(context).secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
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
                                      color: Theme.of(context).secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        // See https://console.cloud.google.com/apis/credentials?authuser=1&project=chore-chart-fo3w11
                        FilledButton(
                          onPressed: () async {
                            await Future.wait([
                              Future(() async {
                                // Set `loggingIn` to `true`
                                _model.loggingIn = true;
                                setState(() {});
                              }),
                              Future(() async {
                                // Login with Google
                                GoRouter.of(context).prepareAuthEvent();
                                final user =
                                    await authManager.signInWithGoogle(context);
                                if (user == null) {
                                  return;
                                }
                              }),
                            ]);
                            context.goNamedAuth('Home', context.mounted);
                          },
                          child: Text('Login with Google'),
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Theme.of(context).secondaryBackground,
                            textStyle: Theme.of(context)
                                .typography
                                .white
                                .titleSmall
                                ?.apply(
                                    // FIXME: color: Theme.of(context).primaryText
                                    )
                                .copyWith(letterSpacing: 0.0),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Theme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            hoverColor: Theme.of(context).primaryBackground,
                          ),
                        ),
                        // FIXME: https://supabase.com/docs/guides/auth/auth-anonymous
                        FilledButton(
                          onPressed: () async {
                            await Future.wait([
                              Future(() async {
                                // Set login state
                                _model.loggingIn = true;
                                setState(() {});
                              }),
                              Future(() async {
                                // Login anonymously
                                await actions.loginAnonymously(
                                  context,
                                );
                              }),
                            ]);
                            if (currentUserUid != null &&
                                currentUserUid != '') {
                              // Navigate home
                              context.pushNamed('Home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Could not login anonymously. Please try again or create an account.',
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                ),
                              );
                              return;
                            }
                          },
                          child: Text('Continue as Guest'),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Theme.of(context).secondaryBackground,
                            textStyle: Theme.of(context)
                                .typography
                                .white
                                .titleSmall
                                ?.apply(
                                  color: Theme.of(context).primaryText,
                                )
                                .copyWith(letterSpacing: 0.0),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Theme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            hoverColor: Theme.of(context).primaryBackground,
                          ),
                        ),
                        // You will have to add an action on this rich text to go to your login page.
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
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
                                          color: Theme.of(context)
                                              .typography
                                              .white
                                              .bodyMedium
                                              ?.color)
                                      .copyWith(
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      // Go to Create Account page
                                      context.pushNamed(
                                        'CreateAccount',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
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
                Navigator.of(context).pushNamed(
                  'CreateAccount',
                  arguments: <String, dynamic>{
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
        style: Theme.of(context)
            .typography
            .dense
            .bodyMedium
            ?.copyWith(letterSpacing: 0.0),
      ),
    );
  }
}
