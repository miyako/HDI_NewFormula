# HDI_NewFormula

![4D](https://img.shields.io/badge/4D-21%2B-blue) ![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Windows-lightgrey) ![License](https://img.shields.io/github/license/miyako/HDI_NewFormula)

**How do I create my own methods for objects?** -- a "How Do I" (HDI) example that shows how to attach behaviour to 4D objects with `Formula`, `This`, and collections.

## Overview

Originally published by 4D as a binary database for 4D v17 R3, this example has been converted to a 4D project and brought up to date for 4D 21. The demo window has three tabs (titles come from the `INFO` table):

| Page | What it shows |
|------|---------------|
| 1 | Describes the feature (text is stored in the `INFO` table) |
| 2 | A `Calculation` object with `add`, `subtract`, `multiply` and `divide` members; edit `value1`/`value2` and watch the results update, with the object's JSON shown below |
| 3 | A list box bound to a collection of objects; buttons apply a formula to every element to build a display name |

## Requirements

- 4D 21 or later (the original example required 4D v17 R3)
- macOS or Windows

## Getting started

1. Open `Project/HDI_NewFormula.4DProject` with 4D.
2. Run **File > Demo** (or let the startup method run). The splash window opens first; click **Demo** to open the example.

## Points of interest

### Object methods with `Formula` and `This`

`NewCalculation` builds an object whose members are formulas. Inline formulas and project methods can both be bound, and `This` refers to the owning object:

```4d
$calc.add:=Formula(This.value1+This.value2)   // inline formula
$calc.multiply:=Formula(multiply)             // project method bound as a member
```

The form displays results by using `Calculation.add()`, `Calculation.multiply()`, etc. directly as data sources.

### Passing formulas as parameters

`ApplyOnCollection` receives a collection and a `4D.Function`, and calls it on every element with `.call()`. The five buttons of page 3 only differ by the formula they pass, for example:

```4d
ApplyOnCollection(Names; Formula(This.displayName:=Uppercase(This.lastName)+", "+This.firstName))
```

### Collection list box

The list box uses the collection `Names` as its data source and `This.firstName`, `This.lastName`, `This.displayName` as column expressions.

### Standard splash and startup pattern

`00_Start` serves two roles: without parameters it imports the `INFO` data if the table is empty, reuses an existing splash window if there is one, or delegates to the application process with `CALL WORKER`; with a parameter it opens the splash form non-modally with `DIALOG(...; *)`. The splash checks the minimum 4D version and any required license (4D View Pro / 4D Write Pro) and switches the button to **Close** when requirements are not met.

### Appearance

- **Dark mode:** colours use `automatic` / `automaticAlternate` values, and the few custom colours are CSS classes with `prefers-color-scheme` media queries (`styleSheets.css`).
- **macOS Tahoe Liquid Glass:** buttons get their height from CSS (`styleSheets_mac.css`, 27px for `liquid-glass`, 23px for `mac-classic`).
- **List boxes:** columns do not truncate with an ellipsis and use legacy column resizing.

### Localisation

All UI text is resolved through XLIFF (`:xliff:` references in forms and menus, `Localized string` in code). English and Japanese are provided in `Resources/en.lproj` and `Resources/ja.lproj`; standard menu items rely on 4D's built-in `Common*` strings.

## Project structure

```
Project/Sources/
  Methods/              00_Start, NewCalculation, multiply, divide, ApplyOnCollection, InitNames
  Forms/HDI/            splash window (BtnDemo opens HDI2)
  Forms/HDI2/           demo window
  TableForms/1/         input/output forms of the INFO table
  styleSheets*.css      dark mode, Liquid Glass and platform fonts
  menus.json            menu bar (standard actions)
Resources/
  {en,ja}.lproj/        XLIFF files
  INFO.4ie, INFO.4si    seed data for the INFO table
```

## References

- Blog post: [Write your own methods for objects](https://blog.4d.com/write-your-own-methods-for-objects/)
- [Formula](https://developer.4d.com/docs/commands/formula) and [4D.Function](https://developer.4d.com/docs/API/FunctionClass)
- [Collections](https://developer.4d.com/docs/Concepts/dt_collection) and [list boxes bound to collections](https://developer.4d.com/docs/FormObjects/listbox_overview#collection-or-entity-selection-list-boxes)
- [CSS in 4D forms](https://developer.4d.com/docs/FormEditor/stylesheets)
- [Original download (4D v17 R3)](https://download.4d.com/Demos/4D_v17_R3/HDI_NewFormula.zip)

## Origin

This project started as a binary `.4DB` example database distributed by 4D and was converted to the project architecture (`.4DProject`) with 4D 21, then modernised with the help of GitHub Copilot.

## License

[MIT](LICENSE)
