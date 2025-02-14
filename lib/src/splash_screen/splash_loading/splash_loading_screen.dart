import '../../../imports.dart';

class SplashLoadingScreen extends StatelessWidget {
  const SplashLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashLoadingProvider = context.read<SplashLoadingProvider>();
    splashLoadingProvider.startProgressAnimation(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              imgLogo,
              fit: BoxFit.none,
            ),
          ),
          sizedBoxHeight20,
          Consumer<SplashLoadingProvider>(
            builder: (context, provider, child) => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                width: 338.0,
                height: 12.0,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: cDarkBlack,
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 5),
                      color: cBackgroundGreen,
                      width: MediaQuery.of(context).size.width *
                          provider.progressValue,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              imgBottomCity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
