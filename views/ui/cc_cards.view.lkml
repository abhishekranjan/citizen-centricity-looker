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
    html: <div style='width:100%;@{font}'>
      <div style='font-size:14px;line-height:1.4;color:#212121;text-align:center;padding:0 10px;'>
        The Citizen Centricity KRA tracks how well government training programs prepare civil servants to deliver citizen-focused services.<br>
        This dashboard covers the citizen-centric courses across <b><i>6 Behavioural and Functional</i></b> and <b><i>10 Domain competency themes</i></b>
        mapped to 4 governance pillars: <b><i>Responsiveness, Transparency, Participation,</i></b> and <b><i>Service Knowledge.</i></b>
      </div>
      <table style='width:100%;border-collapse:collapse;margin-top:4px;'><tr>
        <td style='width:33%;'></td>
        <td style='width:34%;text-align:center;'><img src='@{asset_base}/icon_composite.svg' style='width:56px;height:56px;border-radius:50%;background:#ffffff;padding:3px;'></td>
        <td style='width:33%;text-align:right;padding-right:6px;'><a href='/dashboards/citizen_centricity::cc_score_calculation' target='_self' style='@{link_pill}'>Click here to see Calculation for the Composite Score</a></td>
      </tr></table>
      <table style='width:100%;border-collapse:collapse;background:#BBDEFB;margin-top:-22px;'><tr>
        <td style='width:16%;'></td>
        <td style='text-align:center;padding:14px 8px 12px;font-size:21px;font-weight:700;color:#0B3A75;'>
          Composite Citizen Centricity Score for Capacity Building and Performance:
          <span style='font-size:28px;font-weight:400;margin-left:10px;'>{{ rendered_value }}/100</span></td>
        <td style='width:16%;text-align:right;padding-right:10px;white-space:nowrap;'>
          <a href='/dashboards/citizen_centricity::cc_subtheme_analysis' target='_self' style='text-decoration:none;'>
            <span style='font-size:12px;font-style:italic;color:#212121;vertical-align:middle;margin-right:6px;'>Go to Detailed<br>Sub-Theme Analysis</span>
            <img src='@{asset_base}/icon_arrow_right.svg' style='width:40px;height:40px;vertical-align:middle;'></a></td>
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
      {% if value == 'Service Knowledge' %}{% assign icon = 'icon_service_knowledge.svg' %}
      {% elsif value == 'Responsiveness' %}{% assign icon = 'icon_responsiveness.svg' %}
      {% elsif value == 'Transparency' %}{% assign icon = 'icon_transparency.svg' %}
      {% else %}{% assign icon = 'icon_participation.svg' %}{% endif %}
      <div style='width:100%;box-sizing:border-box;padding:0 4px;@{font}'>
        <table style='width:100%;border-collapse:collapse;background:#E3F2FD;border-radius:30px 0 0 30px;'><tr>
          <td style='width:56px;'><img src='@{asset_base}/{{ icon }}' style='width:54px;height:54px;border-radius:50%;background:#ffffff;padding:2px;display:block;'></td>
          <td style='text-align:center;font-size:22px;font-weight:700;color:#0B3A75;padding-right:20px;'>{{ value }}</td>
        </tr></table>
        <table style='width:100%;border-collapse:separate;border-spacing:8px 8px;margin-top:2px;'>
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
      <div style='width:100%;box-sizing:border-box;padding:0 10px;text-align:left;@{font}'>
        <table style='width:100%;border-collapse:collapse;font-size:15px;color:#212121;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;'>
          <tr style='background:#E3F2FD;color:#1565C0;font-weight:700;'><td style='padding:7px 10px;'>Item</td><td style='text-align:center;'>Weight &#9650;</td></tr>
          <tr><td style='padding:8px 10px;'>Assessment Pass Rate Weight</td><td style='text-align:center;'>{{ rendered_value }}</td></tr>
          <tr style='background:#F7F7F7;'><td style='padding:8px 10px;'>Proficiency-Level Coverage</td><td style='text-align:center;'>{{ rpt_pillar_score.w_proficiency._rendered_value }}</td></tr>
          <tr><td style='padding:8px 10px;'>Assigned Completion Weight</td><td style='text-align:center;'>{{ rpt_pillar_score.w_assigned_completion._rendered_value }}</td></tr>
          <tr style='background:#F7F7F7;'><td style='padding:8px 10px;'>Weights Total (must = 100%)</td><td style='text-align:center;'>{{ total }}%</td></tr>
        </table>
        <div style='font-size:19px;font-weight:700;color:#0B3A75;margin:22px 0 12px;'>Why the weights are set at 30 / 40 / 30</div>
        <p style='font-size:14px;line-height:1.6;text-align:justify;'>&#8226; <b><i>Assigned Completion</i></b> carries the highest weight (40%) because it is the variable most within the control of the capacity building system. It reflects whether the ecosystem - MDOs, training institutions, and iGOT together - is successfully driving civil servants to actually learn.</p>
        <p style='font-size:14px;line-height:1.6;text-align:justify;'>&#8226; <b><i>Proficiency-Level Coverage</i></b> and <b><i>Pass Rate</i></b> are weighted equally (30% each) because both are necessary conditions. Content without completion is underutilised supply; completion without demonstrated learning is shallow engagement. One without the other is incomplete.</p>
      </div> ;;
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
    html: <table style='@{kpi_table}'><tr>
      <td style='@{kpi_icon_td}'><img src='@{asset_base}/icon_enrolment.svg' style='@{kpi_icon}'></td>
      <td style='@{kpi_body_td}'>
        <div style='@{kpi_strip}'>Total Enrollment</div>
        <div style='@{kpi_big}'>{{ rendered_value }}</div></td>
      </tr></table> ;;
  }

  measure: reach_completions_card {
    hidden: yes
    type: sum
    sql: ${TABLE}.completions ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    html: <table style='@{kpi_table}'><tr>
      <td style='@{kpi_icon_td}'><img src='@{asset_base}/icon_completions.svg' style='@{kpi_icon}'></td>
      <td style='@{kpi_body_td}'>
        <div style='@{kpi_strip}'>Total Completions</div>
        <div style='@{kpi_big}'>{{ rendered_value }}</div></td>
      </tr></table> ;;
  }

  measure: reach_courses_card {
    hidden: yes
    type: count_distinct
    sql: ${course_id} ;;
    html: <table style='@{kpi_table}'><tr>
      <td style='@{kpi_icon_td}'><img src='@{asset_base}/icon_courses.svg' style='@{kpi_icon}'></td>
      <td style='@{kpi_body_td}'>
        <div style='@{kpi_strip}'>No. of Courses</div>
        <div style='@{kpi_big}'>{{ rendered_value }}</div></td>
      </tr></table> ;;
  }

  # Performance row 1. Tile fields: [fct_course.perf_kpi_row, fct_course.eoc_coverage]
  measure: perf_kpi_row {
    hidden: yes
    type: number
    sql: ${pass_rate} ;;
    value_format_name: percent_0
    html: <table style='@{row_table}'><tr>
      <td style='width:20%;@{card_green}'>
        <div style='@{card_title}'>Overall Pass Rate</div>
        <div style='@{inner_white}font-size:28px;color:#0B3A75;'>{{ rendered_value }}</div></td>
      <td style='width:20%;@{card_green}'>
        <div style='@{card_title}'>Courses with End-of-Course Assessments</div>
        <div style='@{inner_white}font-size:28px;color:#0B3A75;'>{{ fct_course.eoc_coverage._rendered_value }}</div></td>
      <td style='width:20%;@{card_salmon}'>
        <div style='@{card_title}'>Competency Assessments</div>
        <div style='@{inner_white}padding:9px;'>@{badge_asp}</div></td>
      <td style='width:20%;@{card_salmon}'>
        <div style='@{card_title}'>Flagged Courses</div>
        <div style='font-size:13px;font-style:italic;color:#0B3A75;'>Pass rate below 50%</div>
        <div style='@{inner_white}padding:7px;margin-top:2px;'>@{badge_asp}</div></td>
      <td style='width:20%;@{card_salmon}'>
        <div style='@{card_title}'>Content Health Quality</div>
        <div style='@{inner_white}padding:9px;'>@{badge_asp}</div></td>
      </tr></table> ;;
  }

  # Performance row 3 (progression chain). Tile fields:
  # [fct_course.progression_row, fct_course.completions, fct_course.completion_rate,
  #  fct_course.eoc_coverage, fct_course.pass_rate]
  measure: progression_row {
    hidden: yes
    type: count_distinct
    sql: ${course_id} ;;
    html: <table style='@{row_table}'><tr>
      <td style='width:16%;@{card_green}'>
        <div style='@{card_title}'>Course Supply</div>
        <div style='@{inner_white}font-size:17px;color:#0B3A75;line-height:1.6;'>{{ value }}<br>Courses</div></td>
      <td style='@{arrow_td}color:#81C784;'>&#10132;</td>
      <td style='width:16%;@{card_green}'>
        <div style='@{card_title}'>Course Completion</div>
        <table style='@{inner_white}width:100%;border-collapse:collapse;'><tr>
          <td style='font-size:17px;color:#0B3A75;line-height:1.6;text-align:center;'>{{ fct_course.completions._rendered_value }}<br>Completions</td>
          <td style='font-size:17px;color:#0B3A75;line-height:1.6;text-align:center;'>{{ fct_course.completion_rate._rendered_value }}<br>Rate</td>
        </tr></table></td>
      <td style='@{arrow_td}color:#81C784;'>&#10132;</td>
      <td style='width:16%;@{card_green}'>
        <div style='@{card_title}'>End-of-Course Assessment</div>
        <table style='@{inner_white}width:100%;border-collapse:collapse;'><tr>
          <td style='font-size:17px;color:#0B3A75;line-height:1.6;text-align:center;'>{{ fct_course.eoc_coverage._rendered_value }}<br>Coverage</td>
          <td style='font-size:17px;color:#0B3A75;line-height:1.6;text-align:center;'>{{ fct_course.pass_rate._rendered_value }}<br>Pass Rate</td>
        </tr></table></td>
      <td style='@{arrow_td}color:#81C784;'>&#10132;</td>
      <td style='width:16%;@{card_cream}'>
        <div style='@{card_title}'>Competency Assessment</div>
        <div style='@{inner_white}font-size:16px;color:#0B3A75;line-height:1.6;'>Under development<br>@{badge_asp}</div></td>
      <td style='@{arrow_td}color:#FFD54F;'>&#10132;</td>
      <td style='width:16%;@{card_grey}'>
        <div style='@{card_title}'>Workplace Validation</div>
        <div style='@{inner_white}font-size:15px;color:#0B3A75;line-height:1.35;'>360-degree Feedback System to be developed<br>@{badge_asp}</div></td>
      <td style='@{arrow_td}color:#424242;'>&#10132;</td>
      <td style='width:16%;@{card_grey}'>
        <div style='@{card_title}'>Citizen Feedback / Workflow Application Systems</div>
        <div style='@{inner_white}font-size:15px;color:#0B3A75;line-height:1.5;'>Beyond CBC mandate<br>@{badge_asp}</div></td>
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
    html: <table style='@{kpi_table}'><tr>
      <td style='@{kpi_icon_td}'><img src='@{asset_base}/icon_themes.svg' style='@{kpi_icon}'></td>
      <td style='@{kpi_body_td}'>
        <div style='@{kpi_strip}'>Themes Covered</div>
        <table style='width:100%;border-collapse:collapse;'><tr>
          <td style='text-align:center;'><div style='@{kpi_pair}'>{{ value }}</div><div style='@{kpi_sub}'>B&amp;F</div></td>
          <td style='text-align:center;'><div style='@{kpi_pair}'>{{ rpt_taxonomy_coverage.themes_domain_label._value }}</div><div style='@{kpi_sub}'>Domain</div></td>
        </tr></table></td>
      </tr></table> ;;
  }

  # Tile fields: [rpt_taxonomy_coverage.subthemes_card, rpt_taxonomy_coverage.subthemes_domain_label]
  measure: subthemes_card {
    hidden: yes
    type: string
    sql: ${subthemes_bf_label} ;;
    html: <table style='@{kpi_table}'><tr>
      <td style='@{kpi_icon_td}'><img src='@{asset_base}/icon_subthemes.svg' style='@{kpi_icon}'></td>
      <td style='@{kpi_body_td}'>
        <div style='@{kpi_strip}'>Sub-Themes Covered</div>
        <table style='width:100%;border-collapse:collapse;'><tr>
          <td style='text-align:center;'><div style='@{kpi_pair}'>{{ value }}</div><div style='@{kpi_sub}'>B&amp;F</div></td>
          <td style='text-align:center;'><div style='@{kpi_pair}'>{{ rpt_taxonomy_coverage.subthemes_domain_label._value }}</div><div style='@{kpi_sub}'>Domain</div></td>
        </tr></table></td>
      </tr></table> ;;
  }
}


# ---------------------------------------------------------------------
# fct_cbp_assignment : Adoption KPI stack
# ---------------------------------------------------------------------
view: +fct_cbp_assignment {

  # Tile fields: [fct_cbp_assignment.adoption_kpis, fct_cbp_assignment.completion_rate]
  measure: adoption_kpis {
    hidden: yes
    type: count
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    html: <div style='width:100%;box-sizing:border-box;padding:0 4px;@{font}'>
      <table style='@{kpi_table}margin-bottom:14px;'><tr>
        <td style='width:76px;'><img src='@{asset_base}/icon_officials.svg' style='width:74px;height:74px;border-radius:50%;background:#EEEEEE;display:block;'></td>
        <td style='@{kpi_body_td}'>
          <div style='@{kpi_strip}font-size:17px;'>Total No. of Assigned Officials</div>
          <div style='@{kpi_chip}'>{{ rendered_value }}</div></td>
      </tr></table>
      <table style='@{kpi_table}'><tr>
        <td style='width:76px;'><img src='@{asset_base}/icon_officials_solid.svg' style='width:74px;height:74px;display:block;'></td>
        <td style='@{kpi_body_td}'>
          <div style='@{kpi_strip}font-size:17px;'>Assigned Completion Rate</div>
          <div style='@{kpi_chip}'>{{ fct_cbp_assignment.completion_rate._rendered_value }}</div></td>
      </tr></table></div> ;;
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
