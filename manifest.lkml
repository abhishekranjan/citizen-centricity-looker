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

# ---- Sizing: why every px value has a vw twin --------------------------
# Looker scales dashboard tiles with the dashboard width, so a tile shrinks
# when the browser is zoomed in or the window is narrower. Fixed px content
# does not shrink with it, which is what pushed text out of the header
# buttons and clipped the pillar cards on zoom. Each declaration is written
# twice:  font-size:14px;font-size:0.972vw;
#   - the vw copy (1vw = 14.4px at a 1440px-wide window) scales with the
#     tiles, so every page keeps the same proportions at any zoom;
#   - the px copy is a fallback if a browser ever drops the vw value.
# When you change a size, change both (vw = px / 14.4).
# Looker's sanitiser also strips box-sizing, so never combine width:100%
# with horizontal padding on a div - use a table cell for the padding.

# ---- Dashboard theme ---------------------------------------------------
# The grey canvas between tiles in dashboards-next cannot be set from
# dashboard LookML (embed_style only affects legacy dashboards). It comes
# from a Looker Theme. cc_theme names the theme created by
# scripts/create_theme.py (white canvas, white tiles, no tile shadows).
# Every inter-dashboard href appends ?theme=@{cc_theme} (or &theme=... when
# the link already has a query string) so the theme survives navigation.
# Change the value here if the theme is renamed.
constant: cc_theme {
  value: "cc_plain_white"
}

# Diagnostic control only - a 64x64 data: URI, used by the Zz Render Test
# measure to demonstrate that data: URIs do not survive sanitisation here.
constant: zz_test_png {
  value: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAIAAAAlC+aJAAAA80lEQVR42u2ZyxHCMAxEg8ZVcIAyaQHK5AB1cCd8bFmW5PHTNcnuPluZ8edwuj62mUu2yQsAAAAAAAAAAIisMkL0fjl+e3S+PfMC/Mi9f8eKpLhF//hJP0bxj26LIYHpTXQkPH2nmmRI36MpSdKrlSVPep2+pEqvcFlpLeQz/K1ey8yA5/A3ObIfmALAv3/qfWkhAAAAAAAA/pb5aVRl1fjSQrMA+HdRpeNKLeQ5CfVei/3EPpPQ5CJD1UenV7bQOAaFsrg5DdIUZz9zNQlxNdQpJt7qY4v4OzI1Rq5byrdMs94Thyw62A8AAAAAAAAAQGS9AP4vV6kGS6l7AAAAAElFTkSuQmCC"
}

# ---- Typography --------------------------------------------------------
# Body / UI text: Calibri, then Arial, then Aptos Narrow.
# Headings:       Aptos Display (see font_head below).
#
# An html: block cannot import a web font, so BOTH families must already be
# installed on the viewer's machine. Calibri and the Aptos family ship with
# Microsoft Office / Microsoft 365: they resolve on most Windows desktops,
# but not on a stock macOS or Linux machine, and not in Looker's PDF and
# scheduled-image renderer. Every stack below therefore ends in a plain
# sans-serif so a miss degrades to Arial, never to a serif.
#
# Ordering note: Arial precedes Aptos Narrow exactly as specified. Arial is
# present on virtually every machine, so Aptos Narrow is in practice only
# reached where Arial is absent - swap the two if Aptos Narrow is meant to
# win on Office machines.
#
# Type scale: 600/700 for titles/labels, 400 for values; one navy for headings.
constant: font {
  value: "font-family:Calibri,Arial,Aptos Narrow,sans-serif;"
}

# Heading face. Applied to the header-band title, navy question bars, card
# header strips, drill-through page titles and the large in-card titles.
# Falls back to the body stack so headings never drop to a serif.
constant: font_head {
  value: "font-family:Aptos Display,Calibri,Arial,sans-serif;"
}

# ---- Orange header band + tab buttons ---------------------------------
constant: hdr_table {
  value: "width:100%;border-collapse:collapse;background:#F0961E;font-family:Calibri,Arial,Aptos Narrow,sans-serif;table-layout:auto;"
}
constant: hdr_logo_td {
  value: "width:150px;width:10.417vw;padding:4px 0 4px 8px;padding:0.278vw 0 0.278vw 0.556vw;vertical-align:middle;"
}
constant: hdr_logo {
  value: "height:42px;height:2.917vw;background:#ffffff;padding:2px 4px;padding:0.139vw 0.278vw;display:block;"
}
constant: hdr_title_td {
  value: "width:1%;padding:0 60px 0 12px;padding:0 4.167vw 0 0.833vw;vertical-align:middle;color:#ffffff;font-size:20px;font-size:1.389vw;font-weight:700;letter-spacing:0;white-space:nowrap;text-align:left;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}
constant: hdr_tabs_td {
  value: "vertical-align:middle;padding:4px 8px 4px 0;padding:0.278vw 0.556vw 0.278vw 0;"
}
# Tab buttons. Sized up from the original 112px / 13px so the labels read at
# a glance on a wall display and in PDF export. min-width holds all five the
# same width; padding gives the taller hit area shown in the approved design.
constant: tab {
  value: "display:block;text-align:center;background:#0B3A75;color:#ffffff;padding:7px 4px;padding:0.486vw 0.278vw;border-radius:4px;border-radius:0.278vw;font-size:14px;font-size:0.972vw;font-weight:400;white-space:nowrap;text-decoration:none;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}
constant: tab_on {
  value: "display:block;text-align:center;background:#E0E0E0;color:#212121;padding:7px 4px;padding:0.486vw 0.278vw;border-radius:4px;border-radius:0.278vw;font-size:14px;font-size:0.972vw;font-weight:400;white-space:nowrap;text-decoration:none;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}

# ---- Navy question bar -------------------------------------------------
# Header tab row: a fixed-layout table, five equal cells, one button each.
constant: hdr_tabs_table {
  value: "width:100%;border-collapse:separate;border-spacing:8px 0;border-spacing:0.556vw 0;table-layout:fixed;"
}
constant: hdr_tab_cell {
  value: "padding:0;vertical-align:middle;"
}

# ---- Navy question bar (table form: width:100% + padding on a div would
# overflow, because Looker strips box-sizing) --------------------------
constant: qbar {
  value: "width:100%;background:#0B3A75;color:#ffffff;text-align:center;font-size:18px;font-size:1.25vw;font-weight:700;letter-spacing:.2px;padding:7px 0;padding:0.486vw 0;border-radius:4px;border-radius:0.278vw;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}
constant: qbar_table {
  value: "width:100%;border-collapse:collapse;background:#0B3A75;border-radius:4px;border-radius:0.278vw;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}
constant: qbar_td {
  value: "text-align:center;vertical-align:middle;color:#ffffff;font-size:18px;font-size:1.25vw;font-weight:700;letter-spacing:.2px;padding:7px 12px;padding:0.486vw 0.833vw;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}

# ---- Pills / links -----------------------------------------------------
constant: pill {
  value: "display:inline-block;background:#1E88E5;color:#ffffff;padding:4px 18px;padding:0.278vw 1.25vw;border-radius:15px;border-radius:1.042vw;font-size:14px;font-size:0.972vw;font-weight:600;text-decoration:none;box-shadow:0 1px 3px rgba(0,0,0,.25);"
}
constant: link_pill {
  value: "display:inline-block;background:#E3F2FD;color:#0B3A75;border-radius:15px;border-radius:1.042vw;padding:5px 14px;padding:0.347vw 0.972vw;font-size:15px;font-size:1.042vw;font-weight:600;text-decoration:none;"
}

# ---- Go Back -----------------------------------------------------------
constant: go_back {
  value: "text-align:left;padding:2px 0;padding:0.139vw 0;background:#ffffff;font-family:Calibri,Arial,Aptos Narrow,sans-serif;"
}
constant: go_back_a {
  value: "display:inline-block;margin-left:30px;margin-left:2.083vw;background:#00897B;color:#ffffff;font-size:16px;font-size:1.111vw;font-weight:600;padding:4px 18px;padding:0.278vw 1.25vw;border-radius:15px;border-radius:1.042vw;text-decoration:none;"
}

# ---- Cards -------------------------------------------------------------
constant: card_score {
  value: "background:#EEF3C4;border:1.5px solid #8D8D6E;border-radius:10px;border-radius:0.694vw;padding:6px 10px;padding:0.417vw 0.694vw;text-align:left;vertical-align:top;white-space:normal;"
}
constant: card_dashed {
  value: "background:#FAFAFA;border:1.5px dashed #9E9E9E;border-radius:10px;border-radius:0.694vw;padding:6px 10px;padding:0.417vw 0.694vw;text-align:left;vertical-align:top;white-space:normal;"
}
constant: card_green {
  value: "background:#C8E6C9;border:1.5px dashed #9CCC65;border-radius:6px;border-radius:0.417vw;padding:6px 6px;padding:0.417vw 0.417vw;text-align:center;vertical-align:top;overflow-wrap:break-word;word-break:normal;white-space:normal;"
}
constant: card_salmon {
  value: "background:#FFCCBC;border:1.5px dashed #E57373;border-radius:6px;border-radius:0.417vw;padding:6px 6px;padding:0.417vw 0.417vw;text-align:center;vertical-align:top;overflow-wrap:break-word;word-break:normal;white-space:normal;"
}
constant: card_cream {
  value: "background:#FFF8E1;border:1.5px dashed #FFD54F;border-radius:6px;border-radius:0.417vw;padding:6px 6px;padding:0.417vw 0.417vw;text-align:center;vertical-align:top;overflow-wrap:break-word;word-break:normal;white-space:normal;"
}
constant: card_grey {
  value: "background:#EEEEEE;border:1.5px dashed #757575;border-radius:6px;border-radius:0.417vw;padding:6px 6px;padding:0.417vw 0.417vw;text-align:center;vertical-align:top;overflow-wrap:break-word;word-break:normal;white-space:normal;"
}
constant: inner_white {
  value: "background:#ffffff;border-radius:12px;border-radius:0.833vw;padding:6px 5px;padding:0.417vw 0.347vw;margin-top:5px;margin-top:0.347vw;overflow-wrap:break-word;white-space:normal;"
}
constant: row_table {
  value: "width:100%;border-collapse:separate;border-spacing:3px 0;border-spacing:0.208vw 0;table-layout:fixed;background:#ffffff;font-family:Calibri,Arial,Aptos Narrow,sans-serif;"
}
constant: arrow_td {
  value: "width:34px;width:2.361vw;padding:0;text-align:center;vertical-align:middle;line-height:0;"
}

# ---- Equal-height card rows (Performance KPI row + progression chain) --
# Each card is split over TWO table rows of the same column: a title cell
# (row 1) and a value-box cell (row 2). Table rows share one height, so
# every title cell gets the height of the tallest title and every value box
# starts and ends on the same line - the boxes are bottom-aligned with room
# for the titles above. Append card_top / card_bottom AFTER a card_* colour
# constant: the later declarations override its border, radius and padding.
# No flexbox and no rowspan, so nothing depends on the HTML sanitiser.
constant: card_top {
  value: "border-bottom:0;border-radius:6px 6px 0 0;border-radius:0.417vw 0.417vw 0 0;padding:6px 6px 2px;padding:0.417vw 0.417vw 0.139vw;vertical-align:top;"
}
constant: card_bottom {
  value: "border-top:0;border-radius:0 0 6px 6px;border-radius:0 0 0.417vw 0.417vw;padding:4px 6px 6px;padding:0.278vw 0.417vw 0.417vw;vertical-align:bottom;"
}
# The white value box: a fixed-height table so content centres vertically
# and every box in a row is exactly the same size. Height is set per row.
constant: value_box {
  value: "width:100%;background:#ffffff;border-radius:12px;border-radius:0.833vw;border-collapse:separate;border-spacing:0;table-layout:fixed;"
}
constant: value_box_td {
  value: "vertical-align:middle;text-align:center;padding:4px 3px;padding:0.278vw 0.208vw;color:#0B3A75;overflow-wrap:normal;word-break:normal;white-space:normal;"
}

# ---- KPI card header band ---------------------------------------------
# The icon sits INSIDE the light-blue band, exactly as the pillar cards on
# the Executive Summary do, instead of floating outside it to the left.
# The band is one table row: circle icon cell + centred title cell.
constant: kpi_band {
  value: "width:100%;border-collapse:collapse;background:#E3F2FD;border-radius:26px 0 0 26px;border-radius:1.806vw 0 0 1.806vw;"
}
constant: kpi_band_icon_td {
  value: "width:46px;width:3.194vw;padding:2px 0 2px 2px;padding:0.139vw 0 0.139vw 0.139vw;vertical-align:middle;line-height:0;"
}
constant: kpi_band_icon {
  value: "display:block;width:40px;width:2.778vw;height:40px;height:2.778vw;border-radius:50%;background:#ffffff;padding:3px;padding:0.208vw;"
}
constant: kpi_band_title {
  value: "text-align:center;vertical-align:middle;color:#0B3A75;font-size:16px;font-size:1.111vw;font-weight:700;padding:6px 8px;padding:0.417vw 0.556vw;line-height:1.2;font-family:Aptos Display,Calibri,Arial,sans-serif;white-space:normal;"
}

# ---- KPI card body ----------------------------------------------------
constant: kpi_table {
  value: "width:100%;border-collapse:collapse;background:#ffffff;font-family:Calibri,Arial,Aptos Narrow,sans-serif;"
}
constant: kpi_body_td {
  value: "vertical-align:middle;padding-left:6px;padding-left:0.417vw;"
}
constant: kpi_strip {
  value: "background:#E3F2FD;text-align:center;vertical-align:middle;font-size:16px;font-size:1.111vw;font-weight:700;color:#0B3A75;padding:7px 6px;padding:0.486vw 0.417vw;border-radius:3px;border-radius:0.208vw;white-space:normal;"
}
constant: kpi_big {
  value: "text-align:center;font-size:30px;font-size:2.083vw;font-weight:400;color:#0B3A75;padding:2px 0;padding:0.139vw 0;"
}
constant: kpi_pair {
  value: "font-size:24px;font-size:1.667vw;font-weight:400;color:#0B3A75;"
}
# "B&F" / "Domain" captions under the paired values - were 11px regular and
# effectively unreadable at normal zoom.
constant: kpi_sub {
  value: "font-size:14px;font-size:0.972vw;font-weight:700;color:#0B3A75;letter-spacing:.2px;"
}
constant: kpi_chip {
  value: "margin:8px auto 0;margin:0.556vw auto 0;width:62%;background:#F5F5F5;border-radius:10px;border-radius:0.694vw;text-align:center;font-size:32px;font-size:2.222vw;color:#0B3A75;padding:4px 0;padding:0.278vw 0;"
}

# ---- Text styles -------------------------------------------------------
constant: kpi_value {
  value: "font-size:26px;font-size:1.806vw;font-weight:400;color:#0B3A75;line-height:1.15;"
}
# Caption under each pillar-card figure ("Composite Score", "Completion Rate",
# ...). Was 12px/500 in a mid grey; now bold, larger and in the navy so it
# carries at a glance.
constant: kpi_label {
  value: "font-size:13px;font-size:0.903vw;font-weight:700;color:#0B3A75;margin-top:3px;margin-top:0.208vw;line-height:1.25;white-space:nowrap;"
}
constant: card_title {
  value: "font-size:15px;font-size:1.042vw;font-weight:700;color:#0B3A75;line-height:1.3;font-family:Aptos Display,Calibri,Arial,sans-serif;white-space:normal;"
}
constant: panel {
  value: "width:100%;background:#ffffff;font-family:Calibri,Arial,Aptos Narrow,sans-serif;white-space:normal;"
}

# Italic sub-question under each definition heading ("Is citizen-centric
# learning available at the right depth?"). Italic Calibri at 14px was the
# least readable text on the page, so this is larger, semi-bold and navy
# rather than near-black.
constant: lede_italic {
  value: "font-size:16px;font-size:1.111vw;font-style:italic;font-weight:600;color:#0B3A75;line-height:1.4;margin-bottom:7px;margin-bottom:0.486vw;text-align:left;white-space:normal;"
}

# Explanatory paragraph copy on the Score Calculation page.
constant: body_copy {
  value: "font-size:15px;font-size:1.042vw;line-height:1.55;text-align:justify;white-space:normal;"
}

# White sheet behind an html: tile. Looker tiles are transparent over the
# dashboard canvas, so every full-width html: tile paints its own white.
# NOTE: this covers the tiles only - the canvas BETWEEN tiles is set by the
# Looker theme applied to the dashboard, which cannot live in this project.
# See the Typography/background note in the project README or apply a theme
# with background_color #FFFFFF in Admin > Themes.
# ---- Adoption KPI cards (logo overlapping the title band) ------------
# Each KPI is a bordered card. The circle logo sits at the top-left and its
# right half covers the start of the light-blue title band, the same overlap
# idea as the Executive Summary composite logo. The band "behind" the logo
# is drawn by two stacked gradients on the icon cell: the bottom layer is
# white | blue split at the circle's centre (50%), the top layer paints
# white above 14px and below 56px so only the band strip (14-56px, same as
# kpi_card_body_td padding + kpi_card_band height) stays blue. No
# background-size is used, as Looker's sanitiser drops it. If the gradient
# is stripped, the band simply starts next to the logo.
constant: kpi_card {
  value: "width:97%;margin-left:auto;margin-right:auto;border-collapse:separate;border-spacing:0;background:#ffffff;border:1px solid #E0E0E0;border-radius:10px;border-radius:0.694vw;box-shadow:0 1px 4px rgba(0,0,0,.18);"
}
constant: kpi_card_icon_td {
  value: "width:72px;width:5vw;padding:6px 0 8px 6px;padding:0.417vw 0 0.556vw 0.417vw;vertical-align:top;line-height:0;background-color:#ffffff;background-image:linear-gradient(to bottom,#ffffff 14px,rgba(255,255,255,0) 14px,rgba(255,255,255,0) 56px,#ffffff 56px),linear-gradient(to right,#ffffff 50%,#E3F2FD 50%);background-image:linear-gradient(to bottom,#ffffff 0.972vw,rgba(255,255,255,0) 0.972vw,rgba(255,255,255,0) 3.889vw,#ffffff 3.889vw),linear-gradient(to right,#ffffff 50%,#E3F2FD 50%);"
}
constant: kpi_card_ring {
  value: "display:block;width:64px;width:4.444vw;height:64px;height:4.444vw;border-radius:50%;background:#ffffff;padding:4px;padding:0.278vw;"
}
constant: kpi_card_disc {
  value: "display:block;width:56px;width:3.889vw;height:56px;height:3.889vw;border-radius:50%;padding:4px;padding:0.278vw;"
}
constant: kpi_card_body_td {
  value: "vertical-align:top;padding:14px 10px 10px 0;padding:0.972vw 0.694vw 0.694vw 0;"
}
constant: kpi_card_band {
  value: "height:34px;height:2.361vw;background:#E3F2FD;text-align:center;vertical-align:middle;font-size:17px;font-size:1.181vw;font-weight:700;color:#0B3A75;padding:4px 8px;padding:0.278vw 0.556vw;border-radius:0 3px 3px 0;border-radius:0 0.208vw 0.208vw 0;white-space:normal;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}
constant: page_white {
  value: "width:100%;background:#ffffff;white-space:normal;"
}

# ---- Skeleton placeholders (aspirational tables) -----------------------
constant: sk_bar {
  value: "height:6px;height:0.417vw;background:#EEEEEE;border-radius:3px;border-radius:0.208vw;"
}
constant: sk_chip {
  value: "height:13px;height:0.903vw;width:28px;width:1.944vw;background:#F5F5F5;border-radius:3px;border-radius:0.208vw;"
}
constant: ff_bar {
  value: "height:6px;height:0.417vw;background:#E3F2FD;border-radius:3px;border-radius:0.208vw;"
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
  value: "<span style='display:inline-block;border:1.5px solid #37474F;background:#D2E7F9;color:#1F2933;border-radius:4px;border-radius:0.278vw;padding:3px 9px;padding:0.208vw 0.625vw;font-size:12px;font-size:0.833vw;font-weight:700;letter-spacing:.3px;white-space:nowrap;'><img src='@{asset_base}/warning_badge.png' style='width:13px;width:0.903vw;height:13px;height:0.903vw;display:inline-block;vertical-align:-2px;vertical-align:-0.139vw;margin-right:5px;margin-right:0.347vw;' alt=''>ASPIRATIONAL</span>"
}

# ---- Card header strip (sits directly above a native chart/table) ------
# Every chart/table card = one strip tile (height 1) + the viz tile below
# with its Looker title hidden. The strip carries the title and, where the
# demo has one, the "Get more details" pill or MDO/State toggle - so the
# pill always belongs visibly to the card underneath it.
constant: strip_table {
  value: "width:100%;border-collapse:collapse;background:#E3F2FD;border-radius:4px;border-radius:0.278vw;border-bottom:2px solid #90CAF9;font-family:Calibri,Arial,Aptos Narrow,sans-serif;"
}
constant: strip_title {
  value: "color:#0B3A75;font-size:16px;font-size:1.111vw;font-weight:700;padding:6px 10px;padding:0.417vw 0.694vw;text-align:left;vertical-align:middle;white-space:normal;line-height:1.25;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}
constant: strip_right {
  value: "text-align:right;vertical-align:middle;padding:4px 10px;padding:0.278vw 0.694vw;white-space:nowrap;width:1%;"
}
constant: toggle_on {
  value: "display:inline-block;min-width:60px;min-width:4.167vw;text-align:center;background:#0B3A75;color:#ffffff;padding:4px 16px;padding:0.278vw 1.111vw;border-radius:15px;border-radius:1.042vw;font-size:14px;font-size:0.972vw;font-weight:600;text-decoration:none;margin-left:6px;margin-left:0.417vw;"
}
constant: toggle_off {
  value: "display:inline-block;min-width:60px;min-width:4.167vw;text-align:center;background:#ffffff;color:#0B3A75;border:1px solid #90CAF9;padding:3px 16px;padding:0.208vw 1.111vw;border-radius:15px;border-radius:1.042vw;font-size:14px;font-size:0.972vw;font-weight:600;text-decoration:none;margin-left:6px;margin-left:0.417vw;"
}
# ---- Group pills (Learning: "Pillar wise completion of Groups") --------
constant: gpill_on {
  value: "display:inline-block;background:#0B3A75;color:#ffffff;border:1px solid #0B3A75;padding:2px 10px;padding:0.139vw 0.694vw;border-radius:13px;border-radius:0.903vw;font-size:13px;font-size:0.903vw;font-weight:600;text-decoration:none;margin:2px 2px;margin:0.139vw 0.139vw;white-space:nowrap;"
}
constant: gpill_off {
  value: "display:inline-block;background:#ffffff;color:#0B3A75;border:1px solid #90CAF9;padding:2px 10px;padding:0.139vw 0.694vw;border-radius:13px;border-radius:0.903vw;font-size:13px;font-size:0.903vw;font-weight:600;text-decoration:none;margin:2px 2px;margin:0.139vw 0.139vw;white-space:nowrap;"
}
constant: page_title {
  value: "width:100%;text-align:center;color:#0B3A75;font-size:22px;font-size:1.528vw;font-weight:700;letter-spacing:.2px;padding:6px 0;padding:0.417vw 0;background:#ffffff;font-family:Aptos Display,Calibri,Arial,sans-serif;"
}
