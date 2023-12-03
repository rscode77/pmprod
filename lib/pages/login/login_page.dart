import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/pages/bloc_page_state.dart';
import 'package:pmprod/pages/login/bloc/login_bloc.dart';
import 'package:pmprod/routing/routing.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/data_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BlocPageState<LoginPage, LoginBloc> {
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: _userLoginListener,
          builder: (_, loginState) {
            if(loginState is LoginLoading || loginState is LoginSuccess){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: _buildBody(),
            );
          },
        ),
      ),
    );
  }

  void _userLoginListener(BuildContext context, LoginState state) {
    if (state is LoginSuccess) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routing.workPlan,
        (_) => false,
      );
    }
    if (state is LoginFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
        ),
      );
    }
  }

  List<Widget> _buildBody() {
    return [
      _buildheader(),
      _buildLoginTextField(),
      _buildLoginButton(),
    ];
  }

  Widget _buildheader() {
    return Text(S.of(context).appName);
  }

  Widget _buildLoginTextField() {
    return DataTextField(
      controller: _userIdController,
      hintText: S.of(context).userId,
    );
  }

  Widget _buildLoginButton() {
    return ActionButton(
      title: S.of(context).appName,
      onPressed: () => bloc.add(
        const LoginUserEvent(userId: '1'),
      ),
    );
  }
}
