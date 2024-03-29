#!/usr/bin/env bash

dart pub get

# enable arb_utils globally on machine
# if already enabled, this will download latest version, if one is available
dart pub global activate arb_utils

# generate from csv
dart run arb_generator

# sort arbs
dart pub global run arb_utils:sort assets_dev/l10n/intl_de.arb

# generate localization delegates
flutter pub run intl_utils:generate

# format loca delegates
flutter format lib/generated