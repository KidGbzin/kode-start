part of '../home_handler.dart';

class _Drawer extends StatelessWidget {
  
  final _HomeController controller;

  const _Drawer(this.controller);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 130 + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              border: Border(),
              color: Color(0xFF1C1B1F),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 76.99,
                    width: 115,
                  ),
                  Text(
                    "ALL ENDPOINTS",
                    style: Typography().kobe.regular,
                  ),
                ],
              ),
            ),
          ),
          ...BaseEndpoints.values.map((endpoint) {
              return ListTile(
                leading: Icon(
                  endpoint.icon,
                  color: Colors.white,
                ),
                title: Text(
                  endpoint.title.toUpperCase(),
                  style: Typography().kobe.black,
                ),
                onTap: () => {
                  controller.updateEndpoint(endpoint),
                  context.pop(),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
