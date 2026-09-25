#!/usr/bin/env python3
"""Re-bake assets/icons/*.svg into the data: URI constants in manifest.lkml.

Looker's HTML sanitiser strips <svg> from html: blocks, so the icons must ship
as <img src='data:image/png;base64,...'>. Edit the SVGs in this folder, then:

    pip install cairosvg
    python3 assets/icons/rasterise.py          # run from the project root

Each icon is rendered at 3x the size it is drawn at on screen (DISPLAY_PX
below) so it stays sharp on retina displays and in PDF / scheduled images.
If you change a wrapper <span>'s width in a view, update DISPLAY_PX to match.
"""
import base64
import pathlib
import re

import cairosvg

# on-screen CSS size of each icon, in px (see the wrapper spans in views/ui/).
# A single number is a square; a (width, height) pair is used for the funnel
# arrows, which are wider than they are tall.
DISPLAY_PX = {
    "ai_tool": 28, "arrow_right": 40, "completions": 48, "composite": 56,
    "courses": 48, "enrolment": 48, "flag_gap": 28, "info": 26,
    "officials": 74, "officials_solid": 74, "participation": 54,
    "responsiveness": 54, "service_knowledge": 54, "subthemes": 48,
    "themes": 48, "transparency": 54, "warning": 24,
    "arrow_green": (30, 26), "arrow_amber": (30, 26), "arrow_grey": (30, 26),
}
SCALE = 3

# The ASPIRATIONAL badge carries its own copy of the warning icon, sized for
# the 11px it is drawn at inside the badge. It cannot use @{svg_warning}:
# constants in this project never reference other constants.
BADGE_ICON = ("warning", 11)

root = pathlib.Path(__file__).resolve().parents[2]
manifest = root / "manifest.lkml"
src = manifest.read_text()

pattern = re.compile(
    r'(constant:\s+svg_([a-z_]+)\s*\{\s*\n\s*value:\s*")[^"]*(")'
)


def encode(stem: str, size) -> str:
    """Render assets/icons/<stem>.svg to a PNG data URI at SCALE x size."""
    svg = (root / "assets" / "icons" / f"{stem}.svg").read_bytes()
    w, h = size if isinstance(size, tuple) else (size, size)
    w, h = w * SCALE, h * SCALE
    png = cairosvg.svg2png(bytestring=svg, output_width=w, output_height=h)
    print(f"{stem:20} {w}x{h}  {len(png) / 1024:5.1f} KB png")
    return "data:image/png;base64," + base64.b64encode(png).decode()


def bake(match: re.Match) -> str:
    stem = match.group(2)
    return f"{match.group(1)}{encode(stem, DISPLAY_PX.get(stem, 48))}{match.group(3)}"


out, count = pattern.subn(bake, src)

# the warning icon embedded in the badge_asp markup
badge_stem, badge_px = BADGE_ICON
out, badge_count = re.subn(
    r"(constant:\s+badge_asp\s*\{\s*\n\s*value:\s*\"[^\"]*?src=')[^']*(')",
    lambda m: f"{m.group(1)}{encode(badge_stem, badge_px)}{m.group(2)}",
    out,
)

manifest.write_text(out)
print(f"\nrebaked {count} icon constants + {badge_count} badge icon in {manifest}")
