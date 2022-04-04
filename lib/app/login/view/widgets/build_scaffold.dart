import '../../../../export_import.dart';

Scaffold buildScaffold(
  BuildContext context,
  LoginState state,
  GlobalKey<FormState> formKey,
  TextEditingController usernameController,
  TextEditingController passwordController,
) {
  return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(assetNeuLogo),
                maxRadius: 80,
                minRadius: 50,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF01579B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75.0),
                ),
              ),
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode(state),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 20),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, bottom: 30),
                            child:
                                buildTextFormFieldUsername(usernameController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, bottom: 40),
                            child: buildTextFormFieldPassword(
                                context, state, passwordController),
                          ),
                          buildElevatedButton(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
}
