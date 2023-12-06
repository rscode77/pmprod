import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmprod/bloc/authentication_bloc.dart';
import 'package:pmprod/extensions/sized_box_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/pages/bloc_page_state.dart';
import 'package:pmprod/routing/routing.dart';
import 'package:pmprod/styles/app_dimensions.dart';
import 'package:pmprod/styles/app_text_styles.dart';
import 'package:pmprod/widgets/action_button.dart';
import 'package:pmprod/widgets/data_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BlocPageState<LoginPage, AuthenticationBloc> {
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: _userLoginListener,
          builder: (_, loginState) {
            if (loginState is LoginLoading || loginState is LoginSuccess) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(AppDimensions.defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildBody(),
              ),
            );
          },
        ),
      ),
    );
  }

  void _userLoginListener(BuildContext context, AuthenticationState state) {
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
      _buildHeader(),
      const Space.vertical(AppDimensions.defaultPadding),
      _buildLoginTextField(),
      const Space.vertical(AppDimensions.defaultPadding),
      _buildLoginButton(),
    ];
  }

  Widget _buildHeader() {
    return Text(
      S.of(context).appName,
      style: AppTextStyles.title(),
    );
  }

  Widget _buildLoginTextField() {
    return DataTextField(
      controller: _userIdController,
      hintText: S.of(context).userId,
    );
  }

  Widget _buildLoginButton() {
    return ActionButton(
      title: S.of(context).login,
      onPressed: () => bloc.add(
         LoginUserEvent(userId: _userIdController.value.text),
      ),
    );
  }
}
