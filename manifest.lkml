# =====================================================================
# manifest.lkml – design tokens for the Citizen Centricity dashboards.
# Referenced from html: blocks with the at-brace syntax.
# Constants deliberately do NOT reference other constants.
# Use single quotes only inside values (the value itself is "...").
# =====================================================================

# ---- Public HTTPS folder holding the logo + icons (see README step 2) --
# No trailing slash. Files expected: cbc_logo.png, icon_*.svg
constant: asset_base {
  value: "https://storage.googleapis.com/REPLACE_WITH_BUCKET/cc"
}

# ---- Typography --------------------------------------------------------
constant: font {
  value: "font-family:Lato,Roboto,'Helvetica Neue',Arial,sans-serif;"
}

# ---- Orange header band + tab buttons ---------------------------------
constant: hdr_table {
  value: "width:100%;border-collapse:collapse;background:#F0961E;font-family:Lato,Roboto,Arial,sans-serif;table-layout:auto;"
}
constant: hdr_logo_td {
  value: "width:170px;padding:5px 0 5px 10px;vertical-align:middle;"
}
constant: hdr_logo {
  value: "height:46px;background:#ffffff;padding:2px 4px;display:block;"
}
constant: hdr_title_td {
  value: "padding-left:14px;vertical-align:middle;color:#ffffff;font-size:21px;font-weight:700;white-space:nowrap;text-align:left;"
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
  value: "width:100%;box-sizing:border-box;background:#0B3A75;color:#ffffff;text-align:center;font-size:18px;font-weight:700;padding:7px 10px;border-radius:4px;font-family:Lato,Roboto,Arial,sans-serif;"
}
constant: qbar_table {
  value: "width:100%;border-collapse:collapse;background:#0B3A75;border-radius:4px;font-family:Lato,Roboto,Arial,sans-serif;"
}
constant: qbar_td {
  value: "text-align:center;color:#ffffff;font-size:18px;font-weight:700;padding:7px 10px;"
}

# ---- Pills / links -----------------------------------------------------
constant: pill {
  value: "display:inline-block;background:#64B5F6;color:#ffffff;padding:4px 18px;border-radius:14px;font-size:12px;text-decoration:none;box-shadow:0 1px 3px rgba(0,0,0,.25);"
}
constant: pill_wrap {
  value: "width:100%;text-align:right;padding-right:10px;box-sizing:border-box;font-family:Lato,Roboto,Arial,sans-serif;"
}
constant: link_pill {
  value: "display:inline-block;background:#E3F2FD;color:#1565C0;border-radius:14px;padding:4px 10px;font-size:13px;text-decoration:none;"
}

# ---- Go Back -----------------------------------------------------------
constant: go_back {
  value: "width:100%;text-align:left;padding-left:30px;box-sizing:border-box;font-family:Lato,Roboto,Arial,sans-serif;"
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
  value: "width:100%;border-collapse:separate;border-spacing:5px 0;table-layout:fixed;font-family:Lato,Roboto,Arial,sans-serif;"
}
constant: arrow_td {
  value: "width:2%;text-align:center;vertical-align:middle;font-size:22px;"
}

# ---- KPI cards with icon ----------------------------------------------
constant: kpi_table {
  value: "width:100%;border-collapse:collapse;font-family:Lato,Roboto,Arial,sans-serif;"
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
  value: "background:#E3F2FD;text-align:center;font-size:15px;font-weight:600;color:#212121;padding:5px;border-radius:3px;"
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
  value: "font-size:26px;color:#0B3A75;line-height:1.15;"
}
constant: kpi_label {
  value: "font-size:12px;font-weight:700;color:#212121;margin-top:2px;"
}
constant: card_title {
  value: "font-size:15px;font-weight:700;color:#0B3A75;line-height:1.2;"
}
constant: strip_td {
  value: "color:#0B3A75;font-size:16px;font-weight:700;padding:5px 10px;text-align:left;"
}
constant: panel {
  value: "width:100%;box-sizing:border-box;font-family:Lato,Roboto,Arial,sans-serif;"
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
constant: badge_asp {
  value: "<span style='display:inline-block;border:1.5px solid #5C6BC0;background:#ECEFF1;color:#1565C0;border-radius:3px;padding:1px 5px;font-size:10px;font-weight:700;letter-spacing:.3px;'>&#9888; ASPIRATIONAL</span>"
}
