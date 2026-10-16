# =====================================================================
# cc_cards – display-only HTML measures layered onto the data views via
# refinements (view: +name). Base measures are untouched, so Explores
# keep returning plain numbers.
#
# Pattern: the card measure is the FIRST field of a single_value tile;
# the other measures it shows are added to the same tile's fields: list
# and read in Liquid with {{ view.field._rendered_value }}.
# (Liquid can only read fields that are in the tile's query.)
# All card measures are hidden from the Explore field picker.
#
# LAYOUT NOTE: tables, not flexbox - see the note in cc_ui.view.lkml.
# LIQUID NOTE: never build HTML with {% assign %} and print it with
# {{ var }} - Looker HTML-escapes it and the markup shows as text.
# Write the markup inline instead.
#
# REQUIRED: a refinement file must itself include the file that defines
# the base view. The include in the model file is NOT enough.
# =====================================================================

include: "/views/*.view.lkml"


# ---------------------------------------------------------------------
# rpt_pillar_score : headline band, pillar blocks, weights table
# ---------------------------------------------------------------------
view: +rpt_pillar_score {

  # Exec Summary: intro text + calc link + light-blue composite band.
  # Tile fields: [rpt_pillar_score.headline_card]
  measure: headline_card {
    hidden: yes
    type: average
    sql: ${TABLE}.composite_score ;;
    value_format: "0"
    html: <div style='width:100%;white-space:normal;background:#ffffff;@{font}'>
      <div style='white-space:normal;text-align:center;font-size:17px;font-size:1.181vw;line-height:1.35;color:#0B3B76;padding:0 50px;padding:0 3.472vw;text-wrap:balance;'>
        The Citizen Centricity KRA tracks how well government training programs prepare civil servants to deliver citizen-focused services.<br>
        This dashboard covers the citizen-centric courses across <b><i>6 Behavioural and Functional</i></b> and <b><i>10 Domain competency themes</i></b>
        mapped to 4 governance pillars: <b><i>Responsiveness, Transparency, Participation,</i></b> <span style='white-space:nowrap;'>and <b><i>Service Knowledge.</i></b></span>
      </div>
      <table style='width:100%;border-collapse:collapse;margin-top:2px;margin-top:0.139vw;background:#ffffff;background:linear-gradient(to bottom,#ffffff 50%,#BBDEFB 50%);'><tr>
        <td style='width:33%;'></td>
        <td style='width:34%;text-align:center;line-height:0;'><span style='display:inline-block;width:70px;width:4.861vw;height:70px;height:4.861vw;border-radius:50%;background:#ffffff;padding:5px;padding:0.347vw;'><span style='display:block;width:64px;width:4.444vw;height:64px;height:4.444vw;border-radius:50%;background:#E8F1FB;padding:3px;padding:0.208vw;'><img src='@{asset_base}/composite.png' style='width:100%;height:100%;display:block;' alt=''></span></span></td>
        <td style='width:33%;text-align:right;vertical-align:top;padding:4px 6px 0 0;padding:0.278vw 0.417vw 0 0;'><a href='/dashboards/citizen_centricity::cc_score_calculation?theme=@{cc_theme}' target='_self' style='@{link_pill}'>Click here to see Calculation for the Composite Score</a></td>
      </tr></table>
      <table style='width:100%;border-collapse:collapse;background:#BBDEFB;'><tr>
        <td style='width:18%;'></td>
        <td style='text-align:center;vertical-align:middle;white-space:normal;padding:2px 8px 10px;padding:0.139vw 0.556vw 0.694vw;font-size:21px;font-size:1.458vw;font-weight:700;color:#0B3A75;@{font_head}'>
          Composite Citizen Centricity Score for Capacity Building and Performance:
          <span style='font-size:28px;font-size:1.944vw;font-weight:400;margin-left:10px;margin-left:0.694vw;'>{{ rendered_value }}/100</span></td>
        <td style='width:18%;text-align:right;vertical-align:middle;padding:0 12px 10px 0;padding:0 0.833vw 0.694vw 0;'>
          <a href='/dashboards/citizen_centricity::cc_subtheme_analysis?theme=@{cc_theme}' target='_self' style='text-decoration:none;'>
          <table style='border-collapse:collapse;margin-left:auto;'><tr>
            <td style='text-align:right;vertical-align:middle;padding-right:10px;padding-right:0.694vw;font-size:15px;font-size:1.042vw;font-style:italic;font-weight:400;line-height:1.35;color:#0B3A75;white-space:nowrap;'>Go to Detailed<br>Sub-Theme Analysis</td>
            <td style='vertical-align:middle;line-height:0;'><span style='display:inline-block;width:44px;width:3.056vw;height:44px;height:3.056vw;'><img src='@{asset_base}/arrow_right.png' style='width:100%;height:100%;display:block;' alt=''></span></td>
          </tr></table></a></td>
      </tr></table></div> ;;
  }

  # Exec Summary: one tile per pillar (filter the tile to that pillar).
  # Tile fields (in this order):
  #   rpt_pillar_score.pillar_block_card, rpt_pillar_score.composite_score,
  #   rpt_pillar_score.completion_rate, rpt_pillar_score.enrolments,
  #   rpt_pillar_score.completions, rpt_pillar_score.courses,
  #   rpt_pillar_score.assessment_pass_rate
  measure: pillar_block_card {
    hidden: yes
    type: string
    sql: MAX(${TABLE}.pillar) ;;
    html:
      <div style='padding:4px 0;padding:0.278vw 0;@{page_white}@{font}'>
        <table style='width:100%;border-collapse:collapse;background:#E3F2FD;border-radius:30px 0 0 30px;border-radius:2.083vw 0 0 2.083vw;'><tr>
          <td style='width:56px;width:3.889vw;'><span style='display:block;width:50px;width:3.472vw;height:50px;height:3.472vw;border-radius:50%;background:#ffffff;padding:2px;padding:0.139vw;'>{% if value == 'Service Knowledge' %}<img src='@{asset_base}/service_knowledge.png' style='width:100%;height:100%;display:block;' alt=''>{% elsif value == 'Responsiveness' %}<img src='@{asset_base}/responsiveness.png' style='width:100%;height:100%;display:block;' alt=''>{% elsif value == 'Transparency' %}<img src='@{asset_base}/transparency.png' style='width:100%;height:100%;display:block;' alt=''>{% else %}<img src='@{asset_base}/participation.png' style='width:100%;height:100%;display:block;' alt=''>{% endif %}</span></td>
          <td style='text-align:center;white-space:normal;font-size:22px;font-size:1.528vw;font-weight:700;color:#0B3A75;@{font_head}'>{{ value }}</td>
          <td style='width:30px;width:2.083vw;padding-right:8px;padding-right:0.556vw;'></td>
        </tr></table>
        <table style='width:100%;border-collapse:separate;border-spacing:8px 6px;border-spacing:0.556vw 0.417vw;margin-top:2px;margin-top:0.139vw;'>
          <tr>
            <td style='width:50%;@{card_score}'>
              <div style='@{kpi_value}'>{{ rpt_pillar_score.composite_score._rendered_value }}</div>
              <div style='@{kpi_label}'>Composite Score</div></td>
            <td style='width:50%;@{card_dashed}'>
              <div style='@{kpi_value}'>{{ rpt_pillar_score.completion_rate._rendered_value }}</div>
              <div style='@{kpi_label}'>Completion Rate</div></td>
          </tr>
          <tr>
            <td style='@{card_dashed}'>
              <div style='@{kpi_value}'>{{ rpt_pillar_score.enrolments._rendered_value }}</div>
              <div style='@{kpi_label}'>Total Enrollment</div></td>
            <td style='@{card_dashed}'>
              <div style='@{kpi_value}'>{{ rpt_pillar_score.completions._rendered_value }}</div>
              <div style='@{kpi_label}'>Total Completions</div></td>
          </tr>
          <tr>
            <td style='@{card_dashed}'>
              <div style='@{kpi_value}'>{{ rpt_pillar_score.courses._rendered_value }}</div>
              <div style='@{kpi_label}'>Courses</div></td>
            <td style='@{card_dashed}'>
              <div style='@{kpi_value}'>{{ rpt_pillar_score.assessment_pass_rate._rendered_value }}</div>
              <div style='@{kpi_label}'>Assessment Pass Rate</div></td>
          </tr>
        </table>
      </div> ;;
  }

  # Score Calculation page: weights table + "why" text.
  # Tile fields: [rpt_pillar_score.weights_card, rpt_pillar_score.w_proficiency,
  #               rpt_pillar_score.w_assigned_completion]
  measure: weights_card {
    hidden: yes
    type: max
    sql: ${TABLE}.w_pass_rate ;;
    value_format_name: percent_0
    html:
      {% assign total = value | plus: rpt_pillar_score.w_proficiency._value | plus: rpt_pillar_score.w_assigned_completion._value | times: 100 | round %}
      <table style='width:100%;border-collapse:collapse;background:#ffffff;'><tr><td style='white-space:normal;padding:0 12px;padding:0 0.833vw;text-align:left;@{font}'>
        <table style='width:100%;border-collapse:collapse;font-size:16px;font-size:1.111vw;color:#212121;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;border-radius:0.417vw;'>
          <tr style='background:#E3F2FD;color:#0B3A75;font-weight:700;'><td style='padding:9px 12px;padding:0.625vw 0.833vw;text-align:center;vertical-align:middle;'>Item</td><td style='text-align:center;vertical-align:middle;padding:9px 12px;padding:0.625vw 0.833vw;'>Weight &#9650;</td></tr>
          <tr><td style='padding:10px 12px;padding:0.694vw 0.833vw;'>Assessment Pass Rate Weight</td><td style='text-align:center;vertical-align:middle;'>{{ rendered_value }}</td></tr>
          <tr style='background:#F7F7F7;'><td style='padding:10px 12px;padding:0.694vw 0.833vw;'>Proficiency-Level Coverage</td><td style='text-align:center;vertical-align:middle;'>{{ rpt_pillar_score.w_proficiency._rendered_value }}</td></tr>
          <tr><td style='padding:10px 12px;padding:0.694vw 0.833vw;'>Assigned Completion Weight</td><td style='text-align:center;vertical-align:middle;'>{{ rpt_pillar_score.w_assigned_completion._rendered_value }}</td></tr>
          <tr style='background:#F7F7F7;'><td style='padding:10px 12px;padding:0.694vw 0.833vw;'>Weights Total (must = 100%)</td><td style='text-align:center;vertical-align:middle;'>{{ total }}%</td></tr>
        </table>
        <div style='font-size:21px;font-size:1.458vw;font-weight:700;color:#0B3A75;margin:16px 0 10px;margin:1.111vw 0 0.694vw;white-space:normal;@{font_head}'>Why the weights are set at 30 / 40 / 30</div>
        <p style='@{body_copy}'>&#8226; <b><i>Assigned Completion</i></b> carries the highest weight (40%) because it is the variable most within the control of the capacity building system. It reflects whether the ecosystem - MDOs, training institutions, and iGOT together - is successfully driving civil servants to actually learn.</p>
        <p style='@{body_copy}'>&#8226; <b><i>Proficiency-Level Coverage</i></b> and <b><i>Pass Rate</i></b> are weighted equally (30% each) because both are necessary conditions. Content without completion is underutilised supply; completion without demonstrated learning is shallow engagement. One without the other is incomplete.</p>
      </td></tr></table> ;;
  }
}


# ---------------------------------------------------------------------
# fct_course : reach KPI cards, performance rows
# ---------------------------------------------------------------------
view: +fct_course {

  measure: reach_enrolment_card {
    hidden: yes
    type: sum
    sql: ${TABLE}.enrolments ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    html: <div style='@{page_white}@{font}'>
      <table style='@{kpi_band}'><tr>
        <td style='@{kpi_band_icon_td}'><span style='@{kpi_band_icon}'><img src='@{asset_base}/enrolment.png' style='width:100%;height:100%;display:block;' alt=''></span></td>
        <td style='@{kpi_band_title}'>Total Enrollment</td>
      </tr></table>
      <div style='@{kpi_big}'>{{ rendered_value }}</div>
      </div> ;;
  }

  measure: reach_completions_card {
    hidden: yes
    type: sum
    sql: ${TABLE}.completions ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    html: <div style='@{page_white}@{font}'>
      <table style='@{kpi_band}'><tr>
        <td style='@{kpi_band_icon_td}'><span style='@{kpi_band_icon}'><img src='@{asset_base}/completions.png' style='width:100%;height:100%;display:block;' alt=''></span></td>
        <td style='@{kpi_band_title}'>Total Completions</td>
      </tr></table>
      <div style='@{kpi_big}'>{{ rendered_value }}</div>
      </div> ;;
  }

  measure: reach_courses_card {
    hidden: yes
    type: count_distinct
    sql: ${course_id} ;;
    html: <div style='@{page_white}@{font}'>
      <table style='@{kpi_band}'><tr>
        <td style='@{kpi_band_icon_td}'><span style='@{kpi_band_icon}'><img src='@{asset_base}/courses.png' style='width:100%;height:100%;display:block;' alt=''></span></td>
        <td style='@{kpi_band_title}'>No. of Courses</td>
      </tr></table>
      <div style='@{kpi_big}'>{{ rendered_value }}</div>
      </div> ;;
  }

  # Performance row 1. Tile fields: [fct_course.perf_kpi_row, fct_course.eoc_coverage]
  # Row 1 = titles, row 2 = equal-height white value boxes (see card_top /
  # card_bottom in manifest.lkml).
  measure: perf_kpi_row {
    hidden: yes
    type: number
    sql: ${pass_rate} ;;
    value_format_name: percent_0
    html: <table style='@{row_table}border-spacing:10px 0;border-spacing:0.694vw 0;'>
      <tr>
      <td style='@{card_green}@{card_top}'><div style='@{card_title}'>Overall Pass Rate</div></td>
      <td style='@{card_green}@{card_top}'><div style='@{card_title}'>Courses with End-of-Course Assessments</div></td>
      <td style='@{card_salmon}@{card_top}'><div style='@{card_title}'>Competency Assessments</div></td>
      <td style='@{card_salmon}@{card_top}'><div style='@{card_title}'>Flagged Courses</div>
        <div style='font-size:14px;font-size:0.972vw;font-style:italic;font-weight:600;color:#0B3A75;line-height:1.3;'>Pass rate below 50%</div></td>
      <td style='@{card_salmon}@{card_top}'><div style='@{card_title}'>Content Health Quality</div></td>
      </tr>
      <tr>
      <td style='@{card_green}@{card_bottom}'><table style='@{value_box}height:52px;height:3.611vw;'><tr><td style='@{value_box_td}font-size:30px;font-size:2.083vw;'>{{ rendered_value }}</td></tr></table></td>
      <td style='@{card_green}@{card_bottom}'><table style='@{value_box}height:52px;height:3.611vw;'><tr><td style='@{value_box_td}font-size:30px;font-size:2.083vw;'>{{ fct_course.eoc_coverage._rendered_value }}</td></tr></table></td>
      <td style='@{card_salmon}@{card_bottom}'><table style='@{value_box}height:52px;height:3.611vw;'><tr><td style='@{value_box_td}'>@{badge_asp}</td></tr></table></td>
      <td style='@{card_salmon}@{card_bottom}'><table style='@{value_box}height:52px;height:3.611vw;'><tr><td style='@{value_box_td}'>@{badge_asp}</td></tr></table></td>
      <td style='@{card_salmon}@{card_bottom}'><table style='@{value_box}height:52px;height:3.611vw;'><tr><td style='@{value_box_td}'>@{badge_asp}</td></tr></table></td>
      </tr></table> ;;
  }

  # Performance row 3 (progression chain). Tile fields:
  # [fct_course.progression_row, fct_course.completions, fct_course.completion_rate,
  #  fct_course.eoc_coverage, fct_course.pass_rate]
  # Row 1 = titles, row 2 = equal-height white value boxes with the arrows
  # between them. Arrow columns are a fixed 34px (arrow_td) so the 30px arrows are never
  # clipped; the six card columns share the remaining width equally.
  measure: progression_row {
    hidden: yes
    type: count_distinct
    sql: ${course_id} ;;
    html: <table style='@{row_table}'>
      <tr>
      <td style='@{card_green}@{card_top}'><div style='@{card_title}'>Course Supply</div></td>
      <td style='@{arrow_td}'></td>
      <td style='@{card_green}@{card_top}'><div style='@{card_title}'>Course Completion</div></td>
      <td style='@{arrow_td}'></td>
      <td style='@{card_green}@{card_top}'><div style='@{card_title}'>End-of-Course Assessment</div></td>
      <td style='@{arrow_td}'></td>
      <td style='@{card_cream}@{card_top}'><div style='@{card_title}'>Competency Assessment</div></td>
      <td style='@{arrow_td}'></td>
      <td style='@{card_grey}@{card_top}'><div style='@{card_title}'>Workplace Validation</div></td>
      <td style='@{arrow_td}'></td>
      <td style='@{card_grey}@{card_top}'><div style='@{card_title}'>Citizen Feedback / Workflow Application Systems</div></td>
      </tr>
      <tr>
      <td style='@{card_green}@{card_bottom}'><table style='@{value_box}height:80px;height:5.556vw;'><tr>
        <td style='@{value_box_td}font-size:18px;font-size:1.25vw;line-height:1.4;'>{{ value }}<br><span style='font-size:15px;font-size:1.042vw;'>Courses</span></td></tr></table></td>
      <td style='@{arrow_td}'><img src='@{asset_base}/arrow_green.png' style='width:30px;width:2.083vw;height:26px;height:1.806vw;display:inline-block;' alt=''></td>
      <td style='@{card_green}@{card_bottom}'><table style='@{value_box}height:80px;height:5.556vw;'><tr>
        <td style='@{value_box_td}font-size:18px;font-size:1.25vw;line-height:1.4;'>{{ fct_course.completions._rendered_value }}<br><span style='font-size:15px;font-size:1.042vw;'>Completions</span></td>
        <td style='@{value_box_td}font-size:18px;font-size:1.25vw;line-height:1.4;'>{{ fct_course.completion_rate._rendered_value }}<br><span style='font-size:15px;font-size:1.042vw;'>Rate</span></td></tr></table></td>
      <td style='@{arrow_td}'><img src='@{asset_base}/arrow_green.png' style='width:30px;width:2.083vw;height:26px;height:1.806vw;display:inline-block;' alt=''></td>
      <td style='@{card_green}@{card_bottom}'><table style='@{value_box}height:80px;height:5.556vw;'><tr>
        <td style='@{value_box_td}font-size:18px;font-size:1.25vw;line-height:1.4;'>{{ fct_course.eoc_coverage._rendered_value }}<br><span style='font-size:15px;font-size:1.042vw;'>Coverage</span></td>
        <td style='@{value_box_td}font-size:18px;font-size:1.25vw;line-height:1.4;'>{{ fct_course.pass_rate._rendered_value }}<br><span style='font-size:15px;font-size:1.042vw;'>Pass Rate</span></td></tr></table></td>
      <td style='@{arrow_td}'><img src='@{asset_base}/arrow_green.png' style='width:30px;width:2.083vw;height:26px;height:1.806vw;display:inline-block;' alt=''></td>
      <td style='@{card_cream}@{card_bottom}'><table style='@{value_box}height:80px;height:5.556vw;'><tr>
        <td style='@{value_box_td}font-size:15px;font-size:1.042vw;line-height:1.35;'>Under development<br>@{badge_asp}</td></tr></table></td>
      <td style='@{arrow_td}'><img src='@{asset_base}/arrow_amber.png' style='width:30px;width:2.083vw;height:26px;height:1.806vw;display:inline-block;' alt=''></td>
      <td style='@{card_grey}@{card_bottom}'><table style='@{value_box}height:80px;height:5.556vw;'><tr>
        <td style='@{value_box_td}font-size:14px;font-size:0.972vw;line-height:1.3;'>360-degree Feedback System to be developed<br>@{badge_asp}</td></tr></table></td>
      <td style='@{arrow_td}'><img src='@{asset_base}/arrow_grey.png' style='width:30px;width:2.083vw;height:26px;height:1.806vw;display:inline-block;' alt=''></td>
      <td style='@{card_grey}@{card_bottom}'><table style='@{value_box}height:80px;height:5.556vw;'><tr>
        <td style='@{value_box_td}font-size:14px;font-size:0.972vw;line-height:1.3;'>Beyond CBC mandate<br>@{badge_asp}</td></tr></table></td>
      </tr></table> ;;
  }
}


# ---------------------------------------------------------------------
# rpt_taxonomy_coverage : themes / sub-themes cards (two values each)
# ---------------------------------------------------------------------
view: +rpt_taxonomy_coverage {

  # Tile fields: [rpt_taxonomy_coverage.themes_card, rpt_taxonomy_coverage.themes_domain_label]
  measure: themes_card {
    hidden: yes
    type: string
    sql: ${themes_bf_label} ;;
    html: <div style='@{page_white}@{font}'>
      <table style='@{kpi_band}'><tr>
        <td style='@{kpi_band_icon_td}'><span style='@{kpi_band_icon}'><img src='@{asset_base}/themes.png' style='width:100%;height:100%;display:block;' alt=''></span></td>
        <td style='@{kpi_band_title}'>Themes Covered</td>
      </tr></table>
      <table style='width:100%;border-collapse:collapse;'><tr>
        <td style='text-align:center;vertical-align:middle;'><div style='@{kpi_pair}'>{{ value }}</div><div style='@{kpi_sub}'>B&amp;F</div></td>
        <td style='text-align:center;vertical-align:middle;'><div style='@{kpi_pair}'>{{ rpt_taxonomy_coverage.themes_domain_label._value }}</div><div style='@{kpi_sub}'>Domain</div></td>
      </tr></table>
      </div> ;;
  }

  # Tile fields: [rpt_taxonomy_coverage.subthemes_card, rpt_taxonomy_coverage.subthemes_all_label]
  # NOTE: the second value is subthemes_ALL (84/107), not Domain. The original
  # dashboard labels this figure "Domain" but it counts every sub-theme, and
  # the client has confirmed that is the intended figure. Keep the label and
  # the all-subthemes measure together; do not "correct" one without the other.
  measure: subthemes_card {
    hidden: yes
    type: string
    sql: ${subthemes_bf_label} ;;
    html: <div style='@{page_white}@{font}'>
      <table style='@{kpi_band}'><tr>
        <td style='@{kpi_band_icon_td}'><span style='@{kpi_band_icon}'><img src='@{asset_base}/subthemes.png' style='width:100%;height:100%;display:block;' alt=''></span></td>
        <td style='@{kpi_band_title}'>Sub-Themes Covered</td>
      </tr></table>
      <table style='width:100%;border-collapse:collapse;'><tr>
        <td style='text-align:center;vertical-align:middle;'><div style='@{kpi_pair}'>{{ value }}</div><div style='@{kpi_sub}'>B&amp;F</div></td>
        <td style='text-align:center;vertical-align:middle;'><div style='@{kpi_pair}'>{{ rpt_taxonomy_coverage.subthemes_all_label._value }}</div><div style='@{kpi_sub}'>Domain</div></td>
      </tr></table>
      </div> ;;
  }
}


# ---------------------------------------------------------------------
# fct_cbp_assignment : Adoption KPI stack
# ---------------------------------------------------------------------
view: +fct_cbp_assignment {

  # Tile fields: [fct_cbp_assignment.adoption_kpis, fct_cbp_assignment.completion_rate]
  measure: adoption_kpis {
    hidden: yes
    # Indicator #18: DISTINCT assigned officials (was a plain row count = allocations).
    type: count_distinct
    sql: ${user_id} ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    html: <div style='padding:4px 0;padding:0.278vw 0;@{page_white}@{font}'>
      <table style='@{kpi_card}margin-bottom:14px;margin-bottom:0.972vw;'><tr>
        <td style='@{kpi_card_icon_td}'><span style='@{kpi_card_ring}'><span style='@{kpi_card_disc}background:#EEEEEE;'><img src='@{asset_base}/officials.png' style='width:100%;height:100%;display:block;' alt=''></span></span></td>
        <td style='@{kpi_card_body_td}'>
          <table style='width:100%;border-collapse:collapse;'><tr><td style='@{kpi_card_band}'>Total No. of Assigned Officials</td></tr></table>
          <div style='@{kpi_chip}'>{{ rendered_value }}</div></td>
      </tr></table>
      <table style='@{kpi_card}'><tr>
        <td style='@{kpi_card_icon_td}'><span style='@{kpi_card_ring}'><span style='@{kpi_card_disc}background:#BBDEFB;'><img src='@{asset_base}/officials_solid.png' style='width:100%;height:100%;display:block;' alt=''></span></span></td>
        <td style='@{kpi_card_body_td}'>
          <table style='width:100%;border-collapse:collapse;'><tr><td style='@{kpi_card_band}'>Assigned Completion Rate</td></tr></table>
          <div style='@{kpi_chip}'>{{ fct_cbp_assignment.completion_rate._rendered_value }}</div></td>
      </tr></table></div> ;;
  }
}


# ---------------------------------------------------------------------
# fct_user_course : Group filter pills for "Pillar wise completion of Groups"
# (Learning MDO and Learning State pages).
# ---------------------------------------------------------------------
view: +fct_user_course {

  # Carries the "Pillar Group" dashboard filter into Liquid only. It has no
  # sql, so it never filters the query - the strip still lists every group.
  filter: pillar_group_pick {
    hidden: yes
    type: string
  }

  # One pill per group with data under the current Date Range / Group
  # filters, plus "All groups". A pill reloads the page with the
  # "Pillar Group" filter set; only the pillar chart listens to it.
  # Tile listens: Date Range -> completed_date, Group -> primary_group,
  #               Pillar Group -> pillar_group_pick.
  measure: strip_pillar_group_mdo {
    hidden: yes
    type: list
    list_field: primary_group
    html:
      {% assign pick = _filters["fct_user_course.pillar_group_pick"] | default: "" %}
      {% assign groups = value | join: "," | replace: ", ", "," | split: "," | sort %}
      <table style='@{strip_table}'><tr><td style='@{strip_title}'>Pillar wise completion of Groups</td></tr>
      <tr><td style='height:58px;height:4.028vw;vertical-align:middle;padding:0 7px 5px;padding:0 0.486vw 0.347vw;text-align:left;white-space:normal;line-height:1.2;'><a href='/dashboards/citizen_centricity::cc_learning?Date+Range={{ _filters["fct_user_course.completed_date"] | url_encode }}&Group={{ _filters["fct_user_course.primary_group"] | url_encode }}&theme=@{cc_theme}&Pillar+Group=' target='_self' style='{% if pick == "" %}@{gpill_on}{% else %}@{gpill_off}{% endif %}'>All groups</a>{% for g in groups %}{% assign gs = g | strip %}{% if gs != "" %}<a href='/dashboards/citizen_centricity::cc_learning?Date+Range={{ _filters["fct_user_course.completed_date"] | url_encode }}&Group={{ _filters["fct_user_course.primary_group"] | url_encode }}&theme=@{cc_theme}&Pillar+Group={{ gs | url_encode }}' target='_self' style='{% if pick == gs %}@{gpill_on}{% else %}@{gpill_off}{% endif %}'>{{ gs }}</a>{% endif %}{% endfor %}</td></tr></table> ;;
  }
  measure: strip_pillar_group_state {
    hidden: yes
    type: list
    list_field: primary_group
    html:
      {% assign pick = _filters["fct_user_course.pillar_group_pick"] | default: "" %}
      {% assign groups = value | join: "," | replace: ", ", "," | split: "," | sort %}
      <table style='@{strip_table}'><tr><td style='@{strip_title}'>Pillar wise completion of Groups</td></tr>
      <tr><td style='height:58px;height:4.028vw;vertical-align:middle;padding:0 7px 5px;padding:0 0.486vw 0.347vw;text-align:left;white-space:normal;line-height:1.2;'><a href='/dashboards/citizen_centricity::cc_learning_state?Date+Range={{ _filters["fct_user_course.completed_date"] | url_encode }}&Group={{ _filters["fct_user_course.primary_group"] | url_encode }}&theme=@{cc_theme}&Pillar+Group=' target='_self' style='{% if pick == "" %}@{gpill_on}{% else %}@{gpill_off}{% endif %}'>All groups</a>{% for g in groups %}{% assign gs = g | strip %}{% if gs != "" %}<a href='/dashboards/citizen_centricity::cc_learning_state?Date+Range={{ _filters["fct_user_course.completed_date"] | url_encode }}&Group={{ _filters["fct_user_course.primary_group"] | url_encode }}&theme=@{cc_theme}&Pillar+Group={{ gs | url_encode }}' target='_self' style='{% if pick == gs %}@{gpill_on}{% else %}@{gpill_off}{% endif %}'>{{ gs }}</a>{% endif %}{% endfor %}</td></tr></table> ;;
  }
}


# ---------------------------------------------------------------------
# seed_data_gaps : axis copy of status so bars can be coloured by status
# (fields [status_axis, status, indicator_count], pivot on status, stacked)
# ---------------------------------------------------------------------
view: +seed_data_gaps {
  dimension: status_axis {
    hidden: yes
    label: "Status "
    type: string
    sql: ${TABLE}.status ;;
  }
}
