# Architectural Patterns

## 1. PageView-Based Multi-Step Forms

Every inspection form (annual, quarterly, monthly) uses a single `PageController` with a `PageView` containing one widget per section. Navigation is explicit — sections do not auto-advance.

- `BeltAnnualPage` (`lib/feature/belt/annual/pages/belt_annual.dart:49`)
- `CageQuaterlyPage` (`lib/feature/cage/quarterly/cage_quaterly.dart:41`)

The standard page order is: `HeaderForm` → section forms... → `SignaturePad` → `ImagePickingWidget` (submit).

`AutomaticKeepAliveClientMixin` is used on dynamic list pages (e.g., `AddAnnualLandingFormPage`) to preserve state when the user navigates away and back (`lib/feature/cage/annual/widgets/add_landing_form.dart:17`).

---

## 2. InheritedWidget for JSON Data

Each top-level form page loads a JSON asset (`assets/belt.json` or `assets/cage.json`) on `initState`, then wraps its entire widget tree in a custom `InheritedWidget` to make the data available to all child section widgets without prop drilling.

```
BeltAnnualPage (loads belt.json)
  └── BeltAnnualJson (InheritedWidget holding data)
        └── PageView children (Belting, TailSection, ...)
              └── each calls: BeltAnnualJson.of(context)!.data
```

Pattern defined at:
- `lib/feature/belt/annual/pages/belt_annual.dart:404` — `BeltAnnualJson`
- `lib/feature/cage/annual/pages/cage_annual.dart:376` — `CageAnnualJson`
- `lib/feature/cage/quarterly/cage_quaterly.dart:329` — `CageQuarterlyJson`

---

## 3. Dual-Model Data Flow

Every form field updates **two** targets simultaneously:

1. **Inspection model** (e.g., `BeltInspection`, `CageInspection`) — a plain Dart class whose `toMap()` is used to generate the flat inspection PDF.
2. **`SelectionRefProvider`** — a global `ChangeNotifier` that stores `{id, title, value}` entries used to build the structured reference PDF, grouped by section prefix.

This dual-write happens inside `CustomRadioTile.onChanged` and `MultipleSelectionWidget.onChanged`, and also inside each section widget's callback passed to those widgets.

Example (`lib/feature/belt/annual/widget/belting.dart:42`):
```dart
onChangeValue: (value) {
  widget.beltModel.beltingBeltingType = jsonData['belting_belting_type'][value]; // model
  // SelectionRefProvider updated inside CustomRadioTile automatically
},
```

---

## 4. JSON-Driven Field Values

Radio and checkbox selections are **not** stored as raw strings. Instead, the selected key (lowercased, spaces → underscores) is used to look up a human-readable string from the loaded JSON asset:

```dart
widget.beltModel.beltingWidth = jsonData['belting_width'][value];
```

This means `assets/belt.json` and `assets/cage.json` are the source of truth for what text appears in PDFs. When a field doesn't need a JSON lookup (free-text), the raw value is stored directly.

---

## 5. GetStorage Auto-Persistence per Field ID

Every `CustomTextField` (`lib/feature/common/widgets/custom_textfield.dart:33`) and `CustomRadioTile` (`lib/feature/common/widgets/radio_tile.dart:48`) reads its saved value from `GetStorage` on `initState` using the field's `id` as the key, and writes back on every change.

This means forms are automatically restored if the user backgrounds the app. All storage is erased on form submission via `GetStorage().erase()`.

---

## 6. Field ID Naming Convention

Field IDs follow the pattern `{section}_{index}`:

- `belting_annual_1`, `belting_annual_2`, ...
- `drive_support_1`, `drive_support_2`, ...
- `pit_1`, `pit_2`, ...
- `landing_{landingIndex}_{fieldIndex}`

These IDs serve triple duty: GetStorage key, SelectionRefProvider key, and grouping key for reference PDF section filtering. The reference PDF builder uses `id.split('_').first` (or `startsWith`) to group entries by section.

Conditional/derived field IDs append a letter suffix: `drive_support_10a`, `belting_annual_9`, `${widget.id}a`.

---

## 7. Conditional Field Rendering

Both `CustomRadioTile` and `MultipleSelectionWidget` accept a `conditionalBuilder` callback that receives the current selection and returns a widget (or `SizedBox.shrink()`). This is used extensively to show sub-fields conditionally:

```dart
conditionalBuilder: (selected) {
  if (selected == 'replace') {
    return CustomTextField(id: 'drive_support_10a', title: 'Why?');
  }
  return const SizedBox.shrink();
},
```

Additionally, both widgets **automatically** render a "Non-Compliant Reason" `CustomTextField` when the selection equals `non-compliant` — no `conditionalBuilder` needed for that case.

---

## 8. Dynamic Landing Forms

Sections with a variable number of landings (e.g., intermediate landings on belt, landing forms on cage) use a stateful list page:

- An `ElevatedButton` adds a new model instance to a local list.
- Each list item opens a `DraggableScrollableSheet` modal bottom sheet containing the landing-specific form.
- The landing form's index is passed as a prefix for its field IDs to avoid collisions (e.g., `landing_0_field1`, `landing_1_field1`).

Pattern at: `lib/feature/cage/annual/widgets/add_landing_form.dart`

---

## 9. PDF Generation Flow

On form submission (`ImagePickingWidget.onSubmit`):

1. `createinspectionPdf()` — iterates `model.toMap()`, filters out nulls, produces a flat list of strings embedded in a branded A4 PDF (logo + "Inspection Report" header + ASME standard footer).
2. `createrefrencePdf()` — reads `SelectionRefProvider.selectionsRef`, sorts entries by natural-sort on their IDs, filters by section prefix into named groups, and produces a structured "Inspection Reference" PDF with one section per group.
3. Both files are written to `/storage/emulated/0/Download/` with timestamped filenames.
4. `GetStorage().erase()` clears all persisted field values.
5. `Navigator.pushReplacement` to `FinalPage`.

The sort algorithm uses a natural-sort regex (`r'(\d+|\D+)'`) so that `belting_annual_10` sorts after `belting_annual_9` correctly (`lib/feature/belt/annual/pages/belt_annual.dart:161`).
