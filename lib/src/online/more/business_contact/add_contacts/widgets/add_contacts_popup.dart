import '../../../../../../imports.dart';

class AddContactPopUpSuccessMessage {
  void showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: contentBox(context),
        );
      },
    );
  }

  Widget contentBox(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        sizedBoxHeight20,
        Image.asset(
          'assets/images/success.png', // Replace with your image path
          width: 300,
          height: 300,
        ),
        sizedBoxHeight20,
        const Text(
          'Your new contact has been saved successfully',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        sizedBoxHeight20,
        CustomButton(
          onTap: () {
            Navigator.pushNamed(context, RouteClass.businescontactsscreen);
          },
          title: 'Next',
        ),
      ],
    );
  }
}
