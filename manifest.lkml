# =====================================================================
# manifest.lkml – design tokens for the Citizen Centricity dashboards.
# Referenced from html: blocks with the at-brace syntax.
# Constants deliberately do NOT reference other constants.
# Use single quotes only inside values (the value itself is "...").
# =====================================================================

# ---- Hosted artwork ----------------------------------------------------
# This Looker instance renders NO artwork that is carried inside the html:
# block itself. Two transports were tried and both are removed by the HTML
# sanitiser that runs over every html: block:
#
#   inline <svg>      the <svg>, <path>, <circle>, <g> and <rect> tags are not
#                     on Looker's allow-list, so the markup is deleted and the
#                     wrapper <span> is left behind as an empty white disc.
#   <img src='data:'> the <img> tag and its style survive, but the data: URI
#                     is stripped out of src, leaving a correctly-sized empty
#                     box. This is why the CBC header logo never rendered.
#
# See https://cloud.google.com/looker/docs/html-sanitization for the tag and
# attribute allow-list. Sanitisation is on by default and cannot be disabled.
#
# So every image is an ordinary https URL that the VIEWER'S browser fetches
# anonymously. The host must need no sign-in: a URL that works for a signed-in
# developer (for example storage.cloud.google.com, which authenticates off the
# browser session) returns 403 for everyone else and the icon goes blank.
#
# Set asset_base to the directory holding the PNGs in assets/png/ - no
# trailing slash. Everything else in the project is written relative to it,
# so this is the only line to change if the artwork moves.
#
# Usage:  <span style='width:48px;height:48px;display:block;'>
#           <img src='@{asset_base}/courses.png' style='width:100%;height:100%;display:block;' alt=''>
#         </span>
# The <img> fills its wrapper, so the span controls the size, the white disc
# and the padding. Each PNG is rendered at 3x its on-screen size so it stays
# sharp on retina screens and in PDF / scheduled-image delivery.
# Source vectors live in assets/icons/; assets/icons/rasterise.py regenerates
# the PNGs. Never paste SVG markup into an html: block - it will not render.
constant: asset_base {
  value: "https://raw.githubusercontent.com/abhishekranjan/citizen-centricity-looker/refs/heads/dev-abhishek-ranjan-bvwv/assets/png"
}

# Diagnostic control only - a 64x64 data: URI, used by the Zz Render Test
# measure to demonstrate that data: URIs do not survive sanitisation here.
constant: zz_test_png {
  value: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAIAAAAlC+aJAAAA80lEQVR42u2ZyxHCMAxEg8ZVcIAyaQHK5AB1cCd8bFmW5PHTNcnuPluZ8edwuj62mUu2yQsAAAAAAAAAAIisMkL0fjl+e3S+PfMC/Mi9f8eKpLhF//hJP0bxj26LIYHpTXQkPH2nmmRI36MpSdKrlSVPep2+pEqvcFlpLeQz/K1ey8yA5/A3ObIfmALAv3/qfWkhAAAAAAAA/pb5aVRl1fjSQrMA+HdRpeNKLeQ5CfVei/3EPpPQ5CJD1UenV7bQOAaFsrg5DdIUZz9zNQlxNdQpJt7qY4v4OzI1Rq5byrdMs94Thyw62A8AAAAAAAAAQGS9AP4vV6kGS6l7AAAAAElFTkSuQmCC"
}

# ---- Typography --------------------------------------------------------
# Roboto is already loaded by the Looker UI, so it renders for every viewer
# without any web-font import (html: cannot load Google Fonts itself).
# Type scale: 600 for titles/labels, 400 for values; one navy for headings.
constant: font {
  value: "font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}

# ---- Orange header band + tab buttons ---------------------------------
constant: hdr_table {
  value: "width:100%;border-collapse:collapse;background:#F0961E;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;table-layout:auto;"
}
constant: hdr_logo_td {
  value: "width:170px;padding:5px 0 5px 10px;vertical-align:middle;"
}
constant: hdr_logo {
  value: "height:46px;background:#ffffff;padding:2px 4px;display:block;"
}
constant: hdr_title_td {
  value: "padding-left:14px;vertical-align:middle;color:#ffffff;font-size:21px;font-weight:600;letter-spacing:.2px;white-space:nowrap;text-align:left;"
}
constant: hdr_tabs_td {
  value: "text-align:right;vertical-align:middle;padding:4px 10px;white-space:nowrap;"
}
constant: tab {
  value: "display:inline-block;min-width:112px;text-align:center;background:#0B3A75;color:#ffffff;padding:6px 10px;margin-left:6px;border-radius:3px;font-size:13px;text-decoration:none;"
}
constant: tab_on {
  value: "display:inline-block;min-width:112px;text-align:center;background:#E0E0E0;color:#212121;padding:6px 10px;margin-left:6px;border-radius:3px;font-size:13px;text-decoration:none;"
}

# ---- Navy question bar -------------------------------------------------
constant: qbar {
  value: "width:100%;box-sizing:border-box;background:#0B3A75;color:#ffffff;text-align:center;font-size:17px;font-weight:600;letter-spacing:.2px;padding:8px 10px;border-radius:4px;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}
constant: qbar_table {
  value: "width:100%;border-collapse:collapse;background:#0B3A75;border-radius:4px;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}
constant: qbar_td {
  value: "text-align:center;color:#ffffff;font-size:17px;font-weight:600;letter-spacing:.2px;padding:8px 10px;"
}

# ---- Pills / links -----------------------------------------------------
constant: pill {
  value: "display:inline-block;background:#64B5F6;color:#ffffff;padding:4px 18px;border-radius:14px;font-size:12px;text-decoration:none;box-shadow:0 1px 3px rgba(0,0,0,.25);"
}
constant: link_pill {
  value: "display:inline-block;background:#E3F2FD;color:#1565C0;border-radius:14px;padding:4px 10px;font-size:13px;text-decoration:none;"
}

# ---- Go Back -----------------------------------------------------------
constant: go_back {
  value: "width:100%;text-align:left;padding-left:30px;box-sizing:border-box;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}
constant: go_back_a {
  value: "font-size:24px;color:#212121;text-decoration:none;"
}

# ---- Cards -------------------------------------------------------------
constant: card_score {
  value: "background:#EEF3C4;border:1.5px solid #8D8D6E;border-radius:10px;padding:8px 10px;text-align:left;box-sizing:border-box;vertical-align:top;"
}
constant: card_dashed {
  value: "background:#FAFAFA;border:1.5px dashed #9E9E9E;border-radius:10px;padding:8px 10px;text-align:left;box-sizing:border-box;vertical-align:top;"
}
constant: card_green {
  value: "background:#C8E6C9;border:1.5px dashed #9CCC65;border-radius:6px;padding:6px 8px;text-align:center;box-sizing:border-box;vertical-align:top;"
}
constant: card_salmon {
  value: "background:#FFCCBC;border:1.5px dashed #E57373;border-radius:6px;padding:6px 8px;text-align:center;box-sizing:border-box;vertical-align:top;"
}
constant: card_cream {
  value: "background:#FFF8E1;border:1.5px dashed #FFD54F;border-radius:6px;padding:6px 8px;text-align:center;box-sizing:border-box;vertical-align:top;"
}
constant: card_grey {
  value: "background:#EEEEEE;border:1.5px dashed #757575;border-radius:6px;padding:6px 8px;text-align:center;box-sizing:border-box;vertical-align:top;"
}
constant: inner_white {
  value: "background:#ffffff;border-radius:12px;padding:6px 8px;margin-top:5px;"
}
constant: row_table {
  value: "width:100%;border-collapse:separate;border-spacing:5px 0;table-layout:fixed;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}
constant: arrow_td {
  value: "width:2%;text-align:center;vertical-align:middle;line-height:0;"
}

# ---- KPI cards with icon ----------------------------------------------
constant: kpi_table {
  value: "width:100%;border-collapse:collapse;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}
constant: kpi_icon_td {
  value: "width:50px;vertical-align:middle;"
}
constant: kpi_icon {
  value: "width:48px;height:48px;display:block;"
}
constant: kpi_body_td {
  value: "vertical-align:middle;padding-left:6px;"
}
constant: kpi_strip {
  value: "background:#E3F2FD;text-align:center;font-size:14px;font-weight:500;color:#263238;padding:5px;border-radius:3px;"
}
constant: kpi_big {
  value: "text-align:center;font-size:26px;color:#0B3A75;padding:3px 0;"
}
constant: kpi_pair {
  value: "font-size:22px;color:#0B3A75;"
}
constant: kpi_sub {
  value: "font-size:11px;color:#0B3A75;"
}
constant: kpi_chip {
  value: "margin:8px auto 0;width:62%;background:#F5F5F5;border-radius:10px;text-align:center;font-size:32px;color:#0B3A75;padding:4px 0;"
}

# ---- Text styles -------------------------------------------------------
constant: kpi_value {
  value: "font-size:26px;font-weight:400;color:#0B3A75;line-height:1.15;"
}
constant: kpi_label {
  value: "font-size:12px;font-weight:500;color:#455A64;margin-top:3px;"
}
constant: card_title {
  value: "font-size:14px;font-weight:600;color:#0B3A75;line-height:1.25;"
}
constant: panel {
  value: "width:100%;box-sizing:border-box;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}

# ---- Skeleton placeholders (aspirational tables) -----------------------
constant: sk_bar {
  value: "height:6px;background:#EEEEEE;border-radius:3px;"
}
constant: sk_chip {
  value: "height:13px;width:28px;background:#F5F5F5;border-radius:3px;"
}
constant: ff_bar {
  value: "height:6px;background:#E3F2FD;border-radius:3px;"
}

# ---- Aspirational badge (inline HTML snippet) --------------------------
# The leading glyph is the warning icon as an <img>, not the &#9888; text
# entity: the entity renders in whatever the viewer's font supplies (often a
# monochrome outline, sometimes an orange emoji) and takes the span's colour,
# so it never matched the solid blue triangle in the approved design.
# The icon is baked in here rather than pointing at the svg_warning constant
# because constants in this project never reference other constants;
# assets/icons/rasterise.py keeps this copy in step with warning.svg.
# svg_warning itself stays in the library for full-size use.
constant: badge_asp {
  value: "<span style='display:inline-block;border:1.5px solid #37474F;background:#D2E7F9;color:#1F2933;border-radius:4px;padding:2px 7px;font-size:10px;font-weight:700;letter-spacing:.3px;white-space:nowrap;'><img src='@{asset_base}/warning_badge.png' style='width:11px;height:11px;display:inline-block;vertical-align:-1px;margin-right:4px;' alt=''>ASPIRATIONAL</span>"
}

# ---- Card header strip (sits directly above a native chart/table) ------
# Every chart/table card = one strip tile (height 1) + the viz tile below
# with its Looker title hidden. The strip carries the title and, where the
# demo has one, the "Get more details" pill or MDO/State toggle - so the
# pill always belongs visibly to the card underneath it.
constant: strip_table {
  value: "width:100%;border-collapse:collapse;background:#E3F2FD;border-radius:4px;border-bottom:2px solid #BBDEFB;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}
constant: strip_title {
  value: "color:#0B3A75;font-size:15px;font-weight:600;padding:8px 12px;text-align:left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"
}
constant: strip_right {
  value: "text-align:right;padding:6px 10px;white-space:nowrap;width:1%;"
}
constant: toggle_on {
  value: "display:inline-block;min-width:70px;text-align:center;background:#0B3A75;color:#ffffff;padding:4px 14px;border-radius:14px;font-size:13px;font-weight:500;text-decoration:none;margin-left:6px;"
}
constant: toggle_off {
  value: "display:inline-block;min-width:70px;text-align:center;background:#ffffff;color:#0B3A75;border:1px solid #90CAF9;padding:3px 14px;border-radius:14px;font-size:13px;font-weight:500;text-decoration:none;margin-left:6px;"
}
constant: page_title {
  value: "width:100%;text-align:center;color:#0B3A75;font-size:20px;font-weight:600;letter-spacing:.2px;font-family:Roboto,Google Sans,Segoe UI,Helvetica Neue,Arial,sans-serif;"
}
