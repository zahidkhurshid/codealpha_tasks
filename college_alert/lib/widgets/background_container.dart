import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_provider.dart';
import '../utils/app_styles.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final bool useGradient;
  final String? backgroundImage;

  const BackgroundContainer({
    super.key,
    required this.child,
    this.useGradient = true,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;

    return Container(
      decoration: BoxDecoration(
        gradient: useGradient
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isDarkMode
                    ? [
                        AppStyles.darkBackground,
                        AppStyles.darkBackground.withOpacity(0.8),
                      ]
                    : [
                        AppStyles.lightBackground,
                        AppStyles.lightBackground.withOpacity(0.8),
                      ],
              )
            : null,
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  (isDarkMode ? Colors.black : Colors.white).withOpacity(0.5),
                  BlendMode.dstATop,
                ),
              )
            : null,
      ),
      child: child,
    );
  }
}
