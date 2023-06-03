import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/features/welcome/presentation/providers/welcome_page_providers.dart';
import 'package:sample_web/lib/features/welcome/presentation/widgets/greetings_label.dart';
import 'package:sample_web/lib/shared/widgets/error_notification.dart';
import 'package:sample_web/lib/styles/personal_portfolio_colors.dart';
import 'package:sample_web/lib/styles/personal_portfolio_icons.dart';

class WelcomePage extends ConsumerWidget {

  static const String route = "/welcome";
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // reformat this code to use the new AsyncValue
    var welcomeData = ref.watch(welcomeProvider);
    if (welcomeData is AsyncLoading) {
      return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ));
    } else if (welcomeData is AsyncError) {
      // return const Text('error');
      return ErrorNotification(message: welcomeData.asError.toString());
    } else if (welcomeData is AsyncData) {
      return Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: PersonalPortfolioColors.welcomePrimary, width: 8),
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage(welcomeData.value!.imgPath), fit: BoxFit.cover))),
                  const SizedBox(width: 40),
                  const Icon(PersonalPortfolioIcons.wave, size: 90, color: PersonalPortfolioColors.welcomeIcon)
                ]),
                const GreetingsLabel(),
                // Text(
                //   welcomeData.value!.greetings[0],
                //   style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
                // ),
                Text.rich(
                  TextSpan(style: const TextStyle(fontSize: 100, color: Colors.white), children: [
                    const TextSpan(text: "I'm "),
                    TextSpan(text: welcomeData.value!.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ]),
                  textAlign: TextAlign.center,
                ),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(PersonalPortfolioIcons.badge, color: PersonalPortfolioColors.welcomePrimary, size: 80),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(welcomeData.value!.title,
                              textAlign: TextAlign.center, style: const TextStyle(fontSize: 40, color: Colors.white)),
                          Text(welcomeData.value!.subTitle,
                              textAlign: TextAlign.center, style: const TextStyle(fontSize: 40, color: Colors.white)),
                        ],
                      )
                    ])
              ]));
    } else {
      return const Text('error');
    }

    // ref.watch(welcomeProvider) is now an AsyncValue<WelcomeData>

    //
    //   var welcomeDataAsync = ref.watch(welcomeProvider);
    //
    //   return welcomeDataAsync.when(
    //       loading: () => const Center(
    //               child: CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation(Colors.white),
    //           )),
    //       error: (error, stackTrace) => const Text('error'),
    //       data: (welcomeData) {
    //         return Center(
    //             child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //               Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
    //                 Container(
    //                     width: 100,
    //                     height: 100,
    //                     decoration: BoxDecoration(
    //                         border: Border.all(color: PersonalPortfolioColors.welcomePrimary, width: 8),
    //                         shape: BoxShape.circle,
    //                         image: DecorationImage(image: NetworkImage(welcomeData.imgPath), fit: BoxFit.cover))),
    //                 const SizedBox(width: 40),
    //                 const Icon(PersonalPortfolioIcons.wave, size: 90, color: PersonalPortfolioColors.welcomeIcon)
    //               ]),
    //               Text(
    //                 welcomeData.greetings[0],
    //                 style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
    //               ),
    //               Text.rich(
    //                 TextSpan(style: const TextStyle(fontSize: 100, color: Colors.white), children: [
    //                   const TextSpan(text: "I'm "),
    //                   TextSpan(text: welcomeData.name, style: const TextStyle(fontWeight: FontWeight.bold)),
    //                 ]),
    //                 textAlign: TextAlign.center,
    //               ),
    //               Row(
    //                   mainAxisSize: MainAxisSize.min,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     const Icon(PersonalPortfolioIcons.badge, color: PersonalPortfolioColors.welcomePrimary, size: 80),
    //                     const SizedBox(width: 20),
    //                     Column(
    //                       mainAxisSize: MainAxisSize.min,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Text(welcomeData.title,
    //                             textAlign: TextAlign.center, style: const TextStyle(fontSize: 40, color: Colors.white)),
    //                         Text(welcomeData.subTitle,
    //                             textAlign: TextAlign.center, style: const TextStyle(fontSize: 40, color: Colors.white)),
    //                       ],
    //                     )
    //                   ])
    //             ]));
    //       }
    //   );
    // }
  }
}
