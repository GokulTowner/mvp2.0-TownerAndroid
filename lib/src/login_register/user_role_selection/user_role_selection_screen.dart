import '../../../imports.dart';

class UserRoleSelectionScreen extends StatelessWidget {
  const UserRoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('T-${AppLocalizations.of(context)!.ownerLogin}',
            //     style: tsLargeTextBold),
            // sizedBoxHeight20,
            // InkWell(
            //   onTap: () {
            //     Provider.of<LoginProvider>(context, listen: false)
            //         .setIsOwnerTrue();
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LoginScreen(
            //           isOwner: true,
            //         ),
            //       ),
            //     );
            //   },
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(rRadius_90),
            //     ),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(rRadius_90),
            //       child: Image.asset(
            //         imgOwnerSide,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            sizedBoxHeight30,
            Text(AppLocalizations.of(context)!.driverLogin,
                style: tsLargeTextBold),
            sizedBoxHeight20,
            InkWell(
              onTap: () {
                Provider.of<LoginProvider>(context, listen: false)
                    .setIsOwnerFalse();
                Navigator.pushNamed(context, RouteClass.loginScreen);
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    imgDriverSide,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
