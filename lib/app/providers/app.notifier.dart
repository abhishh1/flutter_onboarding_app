import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../modules/onboarding/notifier/onboarding.notifier.dart';

class AppNotifier {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => OnboardingNotifier()),
  ];
}
