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
![Starlight](data/starlight.png)

## Goals
* All base colors (black, red, green, yellow, blue, magenta, cyan, white) should be easily uniquely identifiable.
* Bright variants should be identifiable side by side, but do not need to be uniquely identifiable.
* Text in any color (except black) should be legible on the black, even when not bold.

See the [CHANGELOG](CHANGELOG) to see implementation details.
