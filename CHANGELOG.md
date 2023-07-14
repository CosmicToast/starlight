# CHANGELOG
Documentation on how the colors were determined in every version, along with the changes.

## V4
V4 is a reimagining of starlight using the LCH color space.
The comments in particular were regarding the accessibility (lack of contrast) of red and magenta.
After some testing, WCAG AAA is not a particularly big deal, but a contrast ratio of at least 4 is highly recommendable.
With some math and focus group testing,
I determined that highly variable lightness values are somewhat inevitable when catering to color blindnesses:
in part because they're what permit colorblind people to differentiate the colors,
and in part because of the need to fit into sRGB.

The new colors aim for an LCH L of 65 for the basic version and 75 for the bright version.
Additionally, bright versions are hue-shifted right by 10.
Chroma values are either 40, 60, or 80, depending on sRGB and colorblindness constraints.

That said, the new colors are (L, C, H):
* Red: 55, 80, 20 and 60, 80, 30.
  The lightness needed to be reduced to fit into sRGB, but be high enough to remain legible.
  For bright red, it looked different enough at 60, so it was kept to remain mostly within sRGB.
* Green: 65, 80, 130 and 75, 80, 140.
* Yellow: 80, 80, 90 and 90, 80, 100.
* Blue: 65, 40, 230 and 75, 40, 240.
  The chromacity had to be reduced to fit into sRGB.
* Magenta: 65, 60, 330 and 75, 60, 340.
  The chromacity had to be reduced to fit into sRGB.
* Cyan: 70, 50, 170 and 80, 50, 180.
  The chromacity had to be reduced to fit into sRGB.
  The hue and lightness had to be further played around with to accomodate color blindness.

The white and black values were left alone, as no one had issues with them.
They may be changed in a patch.

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
