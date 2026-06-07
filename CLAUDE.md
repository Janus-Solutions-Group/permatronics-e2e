# Permatronics E2E — Claude Context

## Project Overview

Flutter mobile app for **Perma Tronic Elevator, Inc.** that digitizes manlift inspection forms. Technicians fill multi-step forms for two manlift types (Cage, Belt), each with three inspection frequencies (Monthly, Quarterly, Annual). On submission, the app generates two PDFs (inspection report + reference) saved to device storage.

Standards referenced: ASME A90.1 (Belt), ASME A17.1 (Cage).

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter / Dart (SDK >=3.4.1) |
| State management | `provider` ^6.1.2 (`ChangeNotifier`) |
| Local persistence | `get_storage` (key-value, cleared on submit) |
| PDF generation | `pdf` ^3.11.1 |
| Signature capture | `syncfusion_flutter_signaturepad` |
| Image picking | `image_picker` ^1.1.2 |
| Fonts | OpenSans (bundled asset) |

## Key Directories

```
lib/
  main.dart                        # App entry, MultiProvider setup
  provider/
    selection_ref_provider.dart    # Global store for reference PDF entries
  util/
    navigate.dart                  # moveTo() / moveBack() helpers
  data/
    models/                        # Shared models (HeaderModel, OriginalModel, etc.)
  feature/
    Home/pages/homepage.dart       # Entry: Cage vs Belt selection
    belt/
      pages/belt.page.dart         # Monthly / Quarterly / Annual selection
      model/belt_inspection_model.dart  # All belt form fields (~250 fields)
      annual/                      # Annual belt form (pages + widgets)
      quarterly_monthly/           # Monthly/Quarterly belt form (pages + widgets)
    cage/
      pages/cage.page.dart         # Monthly / Quarterly / Annual selection
      model/cage_model.dart        # All cage form fields
      annual/                      # Annual cage form (pages + widgets)
      quarterly/                   # Monthly/Quarterly cage form (pages + widgets)
    common/widgets/                # Shared form widgets (see below)
    final/final_page.dart          # Shown after successful submission
assets/
  belt.json                        # Human-readable strings for belt radio/checkbox options
  cage.json                        # Human-readable strings for cage radio/checkbox options
  customers.json / units.json      # Reference data
  perma_tronic.png                 # Logo embedded in PDFs
```

### Common Widgets (`lib/feature/common/widgets/`)

| Widget | Purpose |
|---|---|
| `CustomRadioTile` | Radio group — persists via GetStorage, updates SelectionRefProvider |
| `MultipleSelectionWidget` | Checkbox group — same persistence pattern |
| `CustomTextField` | Text input — same persistence pattern |
| `HeaderForm` | First page of every form (customer, date, unit info) |
| `PageNavigationButton` | Prev/Next buttons for PageView navigation |
| `SignaturePad` | Captures technician signature as PNG bytes |
| `ImagePickingWidget` | Final page: attach photos, trigger PDF generation + submit |

## Build & Run Commands

```bash
# Install dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Build Android APK (release)
flutter build apk --release

# Build Android App Bundle
flutter build appbundle

# Analyze
flutter analyze

# Run tests
flutter test
```

PDFs are saved to `/storage/emulated/0/Download/` on Android. The app requires write permission to external storage.

## Email Delivery (AWS SES)

On submit, each form (Cage/Belt × Monthly/Quarterly/Annual) emails the two generated PDFs (inspection + reference) via AWS SES `SendRawEmail`. The implementation lives in `lib/services/aws_ses_service.dart`; SigV4 is computed in-app and the request is sent directly to `https://email.{region}.amazonaws.com/`.

Credentials and recipients are injected at build time via `--dart-define`:

```bash
flutter build apk --release \
  --dart-define=AWS_ACCESS_KEY_ID=AKIA... \
  --dart-define=AWS_SECRET_ACCESS_KEY=... \
  --dart-define=AWS_REGION=us-east-1 \
  --dart-define=SES_FROM=reports@permatronic.com \
  --dart-define=SES_TO=ops@permatronic.com,gordon.butler@permatronic.com
```

Optional: `--dart-define=AWS_SESSION_TOKEN=...` for temporary credentials.

**Security:** the IAM principal embedded in the binary must be locked down to `ses:SendRawEmail` only, and ideally pinned to the From address via the `ses:FromAddress` condition. Anyone with the APK can extract these values. Sending failures are non-blocking — the PDFs remain on the device under `/Download/` and the user proceeds to the Final page with a snackbar showing the error.

## Additional Documentation

- `.claude/docs/architectural_patterns.md` — Form architecture, InheritedWidget JSON pattern, dual-model data flow, ID naming convention, PDF generation flow, dynamic landing forms
