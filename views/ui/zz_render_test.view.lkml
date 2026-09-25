# =====================================================================
# zz_render_test.view.lkml  -  TEMPORARY DIAGNOSTIC, delete once answered.
#
# Renders five things side by side in one cell. Whichever ones appear tell
# us exactly what this Looker instance allows inside an html: block.
#
# HOW TO RUN (no dashboard edit needed):
#   Develop mode -> add this file -> Validate -> Deploy
#   Explore  >  CC - Courses  >  measure "Zz Render Test"  >  Run
#   Screenshot the single result cell.
#
# READING THE RESULT
#   1 + 5 only .............. EXPECTED HERE. External https <img> is the only
#                             transport that survives. Boxes 2 (inline <svg>)
#                             and 4 (data: URI) are removed by the sanitiser.
#   1 + 3 + 5 ............... asset_base is set correctly and the host is
#                             reachable anonymously - the icons will render.
#   1 + 5 but not 3 ......... asset_base is wrong, the files are not uploaded,
#                             or the host needs a sign-in (403). Open the box-3
#                             URL in a private window to tell which.
#   1 only .................. the host is unreachable from the viewer network.
#
# Box 3 fails until the PNGs are uploaded and asset_base is set; that is
# expected on a fresh checkout, not a bug.
# =====================================================================

# A refinement file must itself include the file defining the base view -
# the include in the model file is not enough. Same line as cc_cards.view.lkml.
include: "/views/*.view.lkml"

view: +fct_course {
  measure: zz_render_test {
    label: "Zz Render Test"
    type: count
    html:
      <div style='font:12px Roboto,Arial,sans-serif;white-space:nowrap;'>
        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <span style='display:inline-block;width:48px;height:48px;background:#2E7D32;border-radius:6px;'></span>
          <div>1 plain div</div></span>

        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <span style='display:inline-block;width:48px;height:48px;'>
            <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' width='100%' height='100%' style='display:block;'>
              <circle cx='32' cy='32' r='30' fill='#6A1B9A'/></svg></span>
          <div>2 bare svg (expect blank)</div></span>

        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <span style='display:inline-block;width:48px;height:48px;'><img src='@{asset_base}/courses.png' style='width:100%;height:100%;display:block;' alt=''></span>
          <div>3 hosted icon</div></span>

        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <img src='@{zz_test_png}' style='width:48px;height:48px;display:block;margin:0 auto;'>
          <div>4 data URI (expect blank)</div></span>

        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <img src='https://www.google.com/favicon.ico' style='width:48px;height:48px;display:block;margin:0 auto;'>
          <div>5 img external</div></span>
      </div> ;;
  }
}
