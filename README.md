# HDI_TabbableObjectOrder

A 4D **HDI** (How Do I) example demonstrating how to read and change a form's tab (entry) order at runtime — including a subform, whose own internal tab order has to be handled separately from its parent form.

## Overview

The demo form (`HDI2`) has nine tabbable objects: a subform, a page-0 variable, a page-0 combo box, a variable, a checkbox, a radio button, a drop-down, a combo box, and a button. Each one is paired with a pop-up list (`List1`-`List9`) that lets you assign it a position from 1 to 9. **GET** reads the form's actual entry order with `FORM GET ENTRY ORDER` and reflects it back into the pop-ups and a row of numbered badge pictures; **SET** rebuilds the order array from whatever the pop-ups currently show and applies it in one call to `FORM SET ENTRY ORDER`. Assign the same object to two slots (or leave a non-tabbable gap) and the demo detects the mismatch and warns you instead of failing silently.

## Features

- **Read the current tab order** — `getTabOrder` calls `FORM GET ENTRY ORDER` and maps each returned object name back onto its `List{n}` pop-up plus a numbered badge picture (`setPicture`), so the on-screen list always reflects reality.
- **Write a new tab order** — `setTabOrder` walks the nine `List{n}` pop-ups (skipping blanks), builds the array 4D expects, and applies it with `FORM SET ENTRY ORDER`.
- **Duplicate/invalid selection detection** — if the array built from the pop-ups doesn't match what `FORM GET ENTRY ORDER` reports back after being set (the same object was picked twice, or a non-tabbable one), a warning icon and message (`PicWarning`/`StWarning`) appear instead of the assignment silently failing.
- **A subform has its own tab order** — the host form only ever sees `"Subform"` as a single entry in its order; jumping *into* the subform's own first tabbable object is a separate call, `EXECUTE METHOD IN SUBFORM("Subform"; "goToFirstObjectInSubform")`.
- **Focus follows the new order** — after `SET`, focus jumps to whichever object is now first with `GOTO OBJECT`, so you can immediately verify the change by pressing Tab.
- **Localized, data-driven intro tabs** — `initHDI` parses `SAMPLES-en.json`/`SAMPLES-ja.json` into a collection, sorts it, and spreads it into the `Info`/`Example` tab control text with `COLLECTION TO ARRAY`.
- **Modern startup flow** — `00_Start` uses `CALL WORKER`, a non-blocking `DIALOG(...;*)`, and window-reuse detection instead of spawning a new process or blocking on a modal dialog.
- **XLIFF localisation** — all user-facing menu, form, and message strings are externalised to `Resources/{lang}.lproj/*.xlf` (English and Japanese), grouped by purpose (menus, per-form, messages).
- **Dark mode & Liquid Glass** — `styleSheets.css` uses `"automatic"` colour values so text/controls adapt to light/dark mode; `styleSheets_mac.css` sizes buttons correctly for macOS Tahoe's Liquid Glass appearance as well as classic rendering.
- **Modern method declarations** — all methods use `#DECLARE`/`var` typing instead of legacy `C_*` directives, with subroutines and form-dependent methods marked `invisible` so only real entry points show up in the Run Method dialog.

## Points of Interest

| File | Why it's worth reading |
|------|-------------------------|
| `Project/Sources/Methods/setTabOrder.4dm` | The core of the demo: builds the order array from the `List{n}` pop-ups, applies it with `FORM SET ENTRY ORDER`, then detects a bad/duplicate assignment by comparing array sizes before and after. |
| `Project/Sources/Methods/getTabOrder.4dm` | The inverse operation — reads the live order with `FORM GET ENTRY ORDER` and reflects it back into the pop-ups and badge pictures. |
| `Project/Sources/Methods/setPicture.4dm` | Combines a numbered badge onto each object's icon with `COMBINE PICTURES`, purely to visualize the assigned position. |
| `Project/Sources/Methods/goToFirstObjectInSubform.4dm` | Called via `EXECUTE METHOD IN SUBFORM` from `setTabOrder` — shows that a subform's tab order is independent of its host form and must be entered explicitly. |
| `Project/Sources/lists.json` | The `ObjectName` pop-up list backing every `List{n}` object — the nine assignable names shown in the demo. |
| `Project/Sources/Methods/00_Start.4dm` | The splash/startup pattern: worker dispatch, window reuse, non-blocking dialog. |
| `Project/Sources/styleSheets.css`, `styleSheets_mac.css` | Dark mode and Liquid Glass adaptation via colour-scheme/form-theme media queries. |
| `Resources/*.lproj/*.xlf` | XLIFF localisation structure (menus, per-form, messages), in English and Japanese. |

## Requirements

4D 21 or later (project mode, `.4DProject`).

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16 R4. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised (syntax, localisation, dark mode) with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/define-the-tab-order-by-programming/
- **Original download:** https://download.4d.com/Demos/4D_v16_R4/HDI_TabbableObjectOrder.zip

## References

- `FORM GET ENTRY ORDER`: https://developer.4d.com/docs/commands/form-get-entry-order
- `FORM SET ENTRY ORDER`: https://developer.4d.com/docs/commands/form-set-entry-order
- `EXECUTE METHOD IN SUBFORM`: https://developer.4d.com/docs/commands/execute-method-in-subform
- `GOTO OBJECT`: https://developer.4d.com/docs/commands/goto-object
- CSS in 4D (dark mode, Liquid Glass): https://developer.4d.com/docs/FormEditor/stylesheets
- XLIFF localisation: https://developer.4d.com/docs/Notions/localization
