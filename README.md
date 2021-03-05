# Starlight
Starlight is an ansi color theme focused on usability.

It was made after I made the discovery that I have a color perception deficiency: I have trouble differentiating between hues of blue (a greater one than the average person, making it impossible for me to read typical default blue text on black backgrounds).
I also have a mild deficiency along the same lines for red, but not nearly as bad.
I set out to make a high contrast theme that would work for me (a non-normative survey helped discover that some others have no issues with this content, while a few others do still struggle, but due to not struggling as much as I do, they simply live with it).
This repository is me sharing it.

You can find the exact rgb data in `colors/colors.sh`.
Other files inside of `colors/*.sh` are generators for various applications I use.
The goal is for me to only need to modify `colors/colors.sh` and the explanation/implementation section whenever I make adjustments.

## Screenshots

## Goals
* All base colors (black, red, green, yellow, blue, magenta, cyan, white) should be easily uniquely identifiable.
* Bright variants should be identifiable side by side, but do not need to be uniquely identifiable.
* Text in any color (except black) should be legible on the black, even when not bold.

## Implementation
Non black/white colors are picked mathematically using a six-tone model, then tweaked individually by HSL.
On the baseline, the hue used to generate the six tones is 180, the saturation 80-100 (regular/bright) and lightness +/-5% (45-55, regular/bright).

* Red is tweaked away from blue, to a hue of 195.
* Green is too vibrant, so the regular saturation is pushed down to 70.
* Yellow is not as easily differentiable, so the bright version is tweaked towards green (185).
* Blue is illegible, so it's tweaked towards green, to 165.
* Regular blue is also bumped up to 90 saturation, to compensate for the extra effect lightness has.
* Magenta is tweaked away from blue, to 195, lower saturation (70-90) and higher in lightness to compensate (0-10).
* Cyan is tweaked similar to blue hue-wise (to 165), but is otherwise normal.

Black and white are then hand-picked just to be mostly pleasant on the eyes.
We use bright black and bright white for background/foreground.
Both black and white are defined by hsl L % (with H and S both being 0).

Black: 5% and 14%.
White: 90% and 100%.
