import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice_page/advice_cubit/advice_cubit.dart';
import 'package:advicer/application/pages/advice_page/widgets/advice_field.dart';
import 'package:advicer/application/pages/advice_page/widgets/custom_button.dart';
import 'package:advicer/application/pages/advice_page/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart ';

// import 'advice_bloc/advice_bloc.dart';

class AdvicePageBlocProvider extends StatelessWidget {
  const AdvicePageBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdviceCubit>(),
      child: AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adviser'),
        actions: [
          Consumer<ThemeService>(
            builder:
                (context, themeService, child) => Switch(
                  value: themeService.isDarkMode,
                  onChanged: (_) {
                    themeService.toggleTheme();
                  },
                ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdviceCubit, AdviceCubitState>(
                  builder: (context, state) {
                    if (state is AdviceInitial) {
                      return Text('Tap the button below to get advice');
                    } else if (state is AdviceLoading) {
                      return CircularProgressIndicator();
                    } else if (state is AdviceLoaded) {
                      return AdviceField(advice: state.advice);
                    } else if (state is AdviceErrorState) {
                      return ErrorMessage(errorMessage: state.errorMessage);
                    } else {
                      return ErrorMessage(
                        errorMessage: 'Something Went Wrong!',
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 200, child: Center(child: CustomButton())),
          ],
        ),
      ),
    );
  }
}
