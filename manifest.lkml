# =====================================================================
# manifest.lkml – design tokens for the Citizen Centricity dashboards.
# Referenced from html: blocks with the at-brace syntax, e.g. @ + {font} written together.
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
constant: hdr_open {
  value: "<div style='width:100%;box-sizing:border-box;background:#F0961E;display:flex;align-items:center;justify-content:space-between;padding:8px 18px;font-family:Lato,Roboto,Arial,sans-serif;'>"
}
constant: hdr_title {
  value: "<span style='color:#ffffff;font-size:22px;font-weight:700;white-space:nowrap;'>Key Result Area: Citizen-Centricity</span>"
}
constant: tab {
  value: "display:inline-block;min-width:118px;text-align:center;background:#0B3A75;color:#ffffff;padding:6px 10px;margin-left:7px;border-radius:3px;font-size:13px;text-decoration:none;"
}
constant: tab_on {
  value: "display:inline-block;min-width:118px;text-align:center;background:#E0E0E0;color:#212121;padding:6px 10px;margin-left:7px;border-radius:3px;font-size:13px;text-decoration:none;"
}

# ---- Navy question bar -------------------------------------------------
constant: qbar {
  value: "width:100%;box-sizing:border-box;background:#0B3A75;color:#ffffff;text-align:center;font-size:20px;font-weight:700;padding:8px 12px;border-radius:4px;font-family:Lato,Roboto,Arial,sans-serif;"
}

# ---- Pills / links -----------------------------------------------------
constant: pill {
  value: "display:inline-block;background:#64B5F6;color:#ffffff;padding:5px 22px;border-radius:14px;font-size:13px;text-decoration:none;box-shadow:0 1px 3px rgba(0,0,0,.25);"
}

# ---- Cards -------------------------------------------------------------
constant: card_score {
  value: "background:#EEF3C4;border:1.5px solid #8D8D6E;border-radius:10px;padding:10px 12px;text-align:left;box-sizing:border-box;"
}
constant: card_dashed {
  value: "background:#FAFAFA;border:1.5px dashed #9E9E9E;border-radius:10px;padding:10px 12px;text-align:left;box-sizing:border-box;"
}
constant: card_green {
  value: "background:#C8E6C9;border:1.5px dashed #9CCC65;border-radius:6px;padding:8px 10px;text-align:center;box-sizing:border-box;"
}
constant: card_salmon {
  value: "background:#FFCCBC;border:1.5px dashed #E57373;border-radius:6px;padding:8px 10px;text-align:center;box-sizing:border-box;"
}
constant: card_cream {
  value: "background:#FFF8E1;border:1.5px dashed #FFD54F;border-radius:6px;padding:8px 10px;text-align:center;box-sizing:border-box;"
}
constant: card_grey {
  value: "background:#EEEEEE;border:1.5px dashed #757575;border-radius:6px;padding:8px 10px;text-align:center;box-sizing:border-box;"
}
constant: inner_white {
  value: "background:#ffffff;border-radius:14px;padding:8px 10px;margin-top:8px;"
}

# ---- Text styles -------------------------------------------------------
constant: kpi_value {
  value: "font-size:30px;color:#0B3A75;line-height:1.2;"
}
constant: kpi_label {
  value: "font-size:13px;font-weight:700;color:#212121;margin-top:4px;"
}
constant: card_title {
  value: "font-size:17px;font-weight:700;color:#0B3A75;line-height:1.25;"
}
constant: strip {
  value: "background:#E3F2FD;color:#0B3A75;font-size:17px;font-weight:700;padding:8px 12px;border-radius:4px 4px 0 0;"
}

# ---- Aspirational badge (inline HTML snippet) --------------------------
constant: badge_asp {
  value: "<span style='display:inline-block;border:1.5px solid #5C6BC0;background:#ECEFF1;color:#1565C0;border-radius:3px;padding:1px 6px;font-size:11px;font-weight:700;letter-spacing:.3px;'>&#9888; ASPIRATIONAL</span>"
}
