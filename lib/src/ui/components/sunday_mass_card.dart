import 'package:canton_design_system/canton_design_system.dart';
import 'package:elisha/src/providers/local_user_repository_provider.dart';
import 'package:elisha/src/ui/views/sunday_mass_view/sunday_mass_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SundayMassCard extends ConsumerWidget {
  const SundayMassCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return GestureDetector(
      onTap: () {
        CantonMethods.viewTransition(context, const SundayMassView());
      },
      child: Card(
        color: CantonMethods.alternateCanvasColorType3(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImage(context, watch),
              const SizedBox(height: 15),
              Text(
                'Sunday Mass',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 7),
              Text(
                'ONLINE CHURCH SERVICE',
                style: Theme.of(context).textTheme.overline?.copyWith(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Join in on Sunday Mass today by watching today\'s service online.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, ScopedReader watch) {
    final churchImage = watch(localUserRepositoryProvider).getChurchImage;

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image.asset(
            churchImage,
            fit: BoxFit.fitWidth,
            height: 140,
            width: MediaQuery.of(context).size.width,
            errorBuilder: (_, __, ___) {
              return Container();
            },
          ),
        ),
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.play_arrow,
              color: Theme.of(context).colorScheme.onBackground,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}