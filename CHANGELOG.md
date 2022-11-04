# CHANGELOG
Documentation on how the colors were determined in every version, along with the changes.

## V3
We use black as the background, and move old brblack into black.
We then make brblack more of a gray.
Since old brblack is 14% L, we double that to a 38% for the new brblack.
This gives us a black of `#242424` and a brblack of `#616161`,
with background being equivalent to `black`.

## V2
Tweak green to be more easily differentiable from yellow using HSV.
First, make it complimentary to yellow (hue of 132).
Regular version is set to a saturation of 60 and value of 80.
Bright version is set to a saturation and value of 90.

## V1
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
