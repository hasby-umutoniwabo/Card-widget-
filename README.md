# Card Widget Demo — Flutter

A Flutter demo app showcasing the `Card` widget through a real-world profile card use case, built for a team directory scenario.

## How to Run

1. Clone this repo
```
   git clone https://github.com/hasby-umutoniwabo/Card-widget-.git
```
2. Navigate into the project
```
   cd Card-widget-
```
3. Install dependencies
```
   flutter pub get
```
4. Run the app
```
   flutter run -d chrome
```

## What is the Card Widget?

The `Card` widget is a Material Design surface used to group related content. It supports shadow depth, background color, and border shape — making it one of the most commonly used widgets in Flutter for displaying structured content like profiles, product listings, and dashboards.

## Three Attributes Demonstrated

| Attribute | Type | Default | What it changes on screen | Why a developer would adjust it |
|-----------|------|---------|--------------------------|----------------------------------|
| `elevation` | `double` | `8` | Shadow depth beneath the card — higher value means more shadow and a more raised look | To control visual hierarchy; flat for minimal UIs, high for cards that need to stand out |
| `color` | `Color` | `Colors.white` | The background color of the entire card surface | To reflect different states like active, selected, premium, or error without changing the layout |
| `shape` | `ShapeBorder` | `BorderRadius.circular(16)` | The corner style — sharp, rounded, or pill-like | To match the app's design system; banking apps use sharp corners, social apps use rounded ones |

## Screenshot

![App Screenshot](Card-widget.png)

## Notes

- No external packages used — built with Flutter's core Material library only
- Uses `StatefulWidget` with `setState` so each property can be changed live during the demo via on-screen buttons
- Source: built from scratch, no tutorial code used
