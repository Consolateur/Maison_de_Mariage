Build APK - Maison de Mariage (guide rapide)

## Obtenir l'APK via GitHub Actions (recommandé)
1. Pusher le code vers la branche `main` du repo GitHub.
2. Aller sur l'onglet **Actions** → sélectionner **Build Flutter APK** workflow → lancer si nécessaire.
3. Attendre la fin de la job, puis télécharger l'artefact `maison-de-mariage-apk`.
4. Transférer l'APK sur ton téléphone et installer.

## Build local (optionnel)
- Installer Flutter : https://flutter.dev/docs/get-started/install
- Puis dans `mobile/flutter_app` :
  - `flutter pub get`
  - `flutter build apk --release`
  - APK généré : `build/app/outputs/flutter-apk/app-release.apk`

## Signature (si tu veux publier)
- Créer un keystore :
  - `keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias maison_key`
- Signer/aligner l'apk (voir doc Flutter).
- Pour CI : encoder keystore en base64 et créer secret GitHub `KEYSTORE_BASE64`, puis activer job de signature.

## Notes
- L’APK initial (unsigned) est OK pour tests locaux.
- Pour production (publication) il faut un keystore signé.
