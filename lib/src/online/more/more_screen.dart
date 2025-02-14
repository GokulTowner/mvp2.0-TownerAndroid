import '../../../imports.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Spacer(),
              ContainerNavigation(
                title: 'Business Contacts',
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteClass.businescontactsscreen);
                },
              ),
              const Spacer(),
              ContainerNavigation(
                title: 'My Trip',
                onTap: () {
                  Navigator.pushNamed(context, RouteClass.mytrips);
                },
              ),
              const Spacer(),
              ContainerNavigation(
                title: 'Scheduled Trips',
                onTap: () {
                  Navigator.pushNamed(context, RouteClass.scheduledtripscreen);
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
