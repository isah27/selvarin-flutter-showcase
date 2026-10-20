import '../../../../core/constants/app_assets.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../../domain/repositories/onboarding_repository.dart';

class LocalOnboardingRepository implements OnboardingRepository {
  const LocalOnboardingRepository();

  @override
  List<OnboardingSlide> slides() => <OnboardingSlide>[
    OnboardingSlide(
      loopAsset: AppAssets.loop(1),
      eyebrow: 'THE MOVEMENT',
      title: 'Precision you\ncan hear.',
      subtitle:
          'Every SELVARIN calibre is finished by hand, bridge by bridge, '
          'then regulated in six positions.',
    ),
    OnboardingSlide(
      loopAsset: AppAssets.loop(2),
      eyebrow: 'THE DIAL',
      title: 'Racing green,\ncut by light.',
      subtitle:
          'Sunburst dials catch the room as you move. Slim batons, '
          'a salmon seconds hand, nothing more.',
    ),
    OnboardingSlide(
      loopAsset: AppAssets.loop(3),
      eyebrow: 'THE RITUAL',
      title: 'Made to be\nworn for life.',
      subtitle:
          'Travertine, calfskin and steel. Browse the collection and '
          'book a private viewing.',
    ),
  ];
}
