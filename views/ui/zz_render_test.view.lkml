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
#   1 GREEN BOX only .......... html: works, all artwork is being stripped
#   1 + 5 ..................... external <img> allowed, data: and <svg> blocked
#   1 + 3 + 4 + 5 ............. EXPECTED. <img> fine (incl. data URI); inline
#                               <svg> (box 2) is stripped by Looker's HTML
#                               sanitiser, which is why the icons now ship as
#                               PNG data URIs rather than as <svg> markup.
#   all five ................. the sanitiser allow-list has changed
#
# If box 4 is also missing, this instance blocks data: URIs outright and the
# artwork has to be served from a URL every viewer can reach instead.
# =====================================================================

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
          <div>2 bare svg</div></span>

        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <span style='display:inline-block;width:48px;height:48px;'><img src='@{svg_courses}' style='width:100%;height:100%;display:block;' alt=''></span>
          <div>3 icon constant</div></span>

        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <img src='@{zz_test_png}' style='width:48px;height:48px;display:block;margin:0 auto;'>
          <div>4 img data URI</div></span>

        <span style='display:inline-block;width:110px;text-align:center;vertical-align:top;'>
          <img src='https://www.google.com/favicon.ico' style='width:48px;height:48px;display:block;margin:0 auto;'>
          <div>5 img external</div></span>
      </div> ;;
  }
}
