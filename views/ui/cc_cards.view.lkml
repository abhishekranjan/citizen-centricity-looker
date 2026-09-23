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
      <div style='font-size:15px;line-height:1.5;color:#212121;text-align:center;padding:0 12px;'>
        The Citizen Centricity KRA tracks how well government training programs prepare civil servants to deliver citizen-focused services.<br>
        This dashboard covers the citizen-centric courses across <b><i>6 Behavioural and Functional</i></b> and <b><i>10 Domain competency themes</i></b>
        mapped to 4 governance pillars: <b><i>Responsiveness, Transparency, Participation,</i></b> and <b><i>Service Knowledge.</i></b>
      </div>
      <div style='text-align:right;margin:6px 4px 0 0;'>
        <a href='/dashboards/citizen_centricity::cc_score_calculation' target='_self'
           style='display:inline-block;background:#E3F2FD;color:#1565C0;border-radius:14px;padding:5px 12px;font-size:14px;text-decoration:none;'>Click here to see Calculation for the Composite Score</a>
      </div>
      <div style='position:relative;background:#BBDEFB;margin-top:34px;padding:44px 20px 12px;'>
        <img src='@{asset_base}/icon_composite.svg' style='position:absolute;top:-34px;left:50%;margin-left:-38px;width:76px;height:76px;border-radius:50%;background:#ffffff;padding:4px;'>
        <div style='display:flex;align-items:center;'>
          <div style='flex:1;'></div>
          <div style='flex:6;text-align:center;font-size:24px;font-weight:700;color:#0B3A75;'>
            Composite Citizen Centricity Score for Capacity Building and Performance:
            <span style='font-size:32px;font-weight:400;margin-left:12px;'>{{ rendered_value }}/100</span>
          </div>
          <div style='flex:1.4;text-align:right;'>
            <a href='/dashboards/citizen_centricity::cc_subtheme_analysis' target='_self' style='text-decoration:none;display:inline-flex;align-items:center;'>
              <span style='font-size:13px;font-style:italic;color:#212121;text-align:right;margin-right:8px;'>Go to Detailed<br>Sub-Theme Analysis</span>
              <img src='@{asset_base}/icon_arrow_right.svg' style='width:48px;height:48px;'>
            </a>
          </div>
        </div>
      </div></div> ;;
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
      <div style='width:100%;box-sizing:border-box;padding:0 6px;@{font}'>
        <div style='display:flex;align-items:center;background:#E3F2FD;border-radius:34px 0 0 34px;margin-bottom:18px;'>
          <img src='@{asset_base}/{{ icon }}' style='width:64px;height:64px;border-radius:50%;background:#ffffff;padding:3px;'>
          <span style='flex:1;text-align:center;font-size:26px;font-weight:700;color:#0B3A75;'>{{ value }}</span>
        </div>
        <table style='width:100%;border-collapse:separate;border-spacing:10px 10px;'>
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
      <div style='width:100%;box-sizing:border-box;padding:0 12px;text-align:left;@{font}'>
        <table style='width:100%;border-collapse:collapse;font-size:16px;color:#212121;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;'>
          <tr style='background:#E3F2FD;color:#1565C0;font-weight:700;'><td style='padding:8px 12px;'>Item</td><td style='text-align:center;'>Weight &#9650;</td></tr>
          <tr><td style='padding:9px 12px;'>Assessment Pass Rate Weight</td><td style='text-align:center;'>{{ rendered_value }}</td></tr>
          <tr style='background:#F7F7F7;'><td style='padding:9px 12px;'>Proficiency-Level Coverage</td><td style='text-align:center;'>{{ rpt_pillar_score.w_proficiency._rendered_value }}</td></tr>
          <tr><td style='padding:9px 12px;'>Assigned Completion Weight</td><td style='text-align:center;'>{{ rpt_pillar_score.w_assigned_completion._rendered_value }}</td></tr>
          <tr style='background:#F7F7F7;'><td style='padding:9px 12px;'>Weights Total (must = 100%)</td><td style='text-align:center;'>{{ total }}%</td></tr>
        </table>
        <div style='font-size:20px;font-weight:700;color:#0B3A75;margin:28px 0 14px;'>Why the weights are set at 30 / 40 / 30</div>
        <p style='font-size:15px;line-height:1.75;text-align:justify;'>&#8226; <b><i>Assigned Completion</i></b> carries the highest weight (40%) because it is the variable most within the control of the capacity building system. It reflects whether the ecosystem - MDOs, training institutions, and iGOT together - is successfully driving civil servants to actually learn.</p>
        <p style='font-size:15px;line-height:1.75;text-align:justify;'>&#8226; <b><i>Proficiency-Level Coverage</i></b> and <b><i>Pass Rate</i></b> are weighted equally (30% each) because both are necessary conditions. Content without completion is underutilised supply; completion without demonstrated learning is shallow engagement. One without the other is incomplete.</p>
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
    html: <div style='width:100%;display:flex;align-items:center;@{font}'>
      <img src='@{asset_base}/icon_enrolment.svg' style='width:64px;height:64px;position:relative;z-index:2;margin-right:-12px;'>
      <div style='flex:1;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;'>
        <div style='background:#E3F2FD;text-align:center;font-size:18px;font-weight:600;color:#212121;padding:6px;'>Total Enrollment</div>
        <div style='text-align:center;font-size:30px;color:#0B3A75;padding:4px 0 6px;'>{{ rendered_value }}</div>
      </div></div> ;;
  }

  measure: reach_completions_card {
    hidden: yes
    type: sum
    sql: ${TABLE}.completions ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    html: <div style='width:100%;display:flex;align-items:center;@{font}'>
      <img src='@{asset_base}/icon_completions.svg' style='width:64px;height:64px;position:relative;z-index:2;margin-right:-12px;'>
      <div style='flex:1;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;'>
        <div style='background:#E3F2FD;text-align:center;font-size:18px;font-weight:600;color:#212121;padding:6px;'>Total Completions</div>
        <div style='text-align:center;font-size:30px;color:#0B3A75;padding:4px 0 6px;'>{{ rendered_value }}</div>
      </div></div> ;;
  }

  measure: reach_courses_card {
    hidden: yes
    type: count_distinct
    sql: ${course_id} ;;
    html: <div style='width:100%;display:flex;align-items:center;@{font}'>
      <img src='@{asset_base}/icon_courses.svg' style='width:64px;height:64px;position:relative;z-index:2;margin-right:-12px;'>
      <div style='flex:1;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;'>
        <div style='background:#E3F2FD;text-align:center;font-size:18px;font-weight:600;color:#212121;padding:6px;'>No. of Courses</div>
        <div style='text-align:center;font-size:30px;color:#0B3A75;padding:4px 0 6px;'>{{ rendered_value }}</div>
      </div></div> ;;
  }

  # Performance row 1. Tile fields: [fct_course.perf_kpi_row, fct_course.eoc_coverage]
  measure: perf_kpi_row {
    hidden: yes
    type: number
    sql: ${pass_rate} ;;
    value_format_name: percent_0
    html: <div style='width:100%;display:flex;gap:4%;padding:0 3%;box-sizing:border-box;@{font}'>
      <div style='flex:1;@{card_green}'>
        <div style='@{card_title}'>Overall Pass Rate</div>
        <div style='@{inner_white}font-size:32px;color:#0B3A75;'>{{ rendered_value }}</div></div>
      <div style='flex:1;@{card_green}'>
        <div style='@{card_title}'>Courses with End-of-Course Assessments</div>
        <div style='@{inner_white}font-size:32px;color:#0B3A75;'>{{ fct_course.eoc_coverage._rendered_value }}</div></div>
      <div style='flex:1;@{card_salmon}'>
        <div style='@{card_title}'>Competency Assessments</div>
        <div style='@{inner_white}padding:12px;'>@{badge_asp}</div></div>
      <div style='flex:1;@{card_salmon}'>
        <div style='@{card_title}'>Flagged Courses</div>
        <div style='font-size:14px;font-style:italic;color:#0B3A75;'>Pass rate below 50%</div>
        <div style='@{inner_white}padding:10px;margin-top:4px;'>@{badge_asp}</div></div>
      <div style='flex:1;@{card_salmon}'>
        <div style='@{card_title}'>Content Health Quality</div>
        <div style='@{inner_white}padding:12px;'>@{badge_asp}</div></div>
      </div> ;;
  }

  # Performance row 3 (progression chain). Tile fields:
  # [fct_course.progression_row, fct_course.completions, fct_course.completion_rate,
  #  fct_course.eoc_coverage, fct_course.pass_rate]
  measure: progression_row {
    hidden: yes
    type: count_distinct
    sql: ${course_id} ;;
    html:
      {% assign arrow_g = "<div style='align-self:center;font-size:26px;color:#81C784;padding:0 2px;'>&#10132;</div>" %}
      {% assign arrow_y = "<div style='align-self:center;font-size:26px;color:#FFE082;padding:0 2px;'>&#10132;</div>" %}
      {% assign arrow_k = "<div style='align-self:center;font-size:26px;color:#424242;padding:0 2px;'>&#10132;</div>" %}
      <div style='width:100%;display:flex;align-items:stretch;padding:0 2%;box-sizing:border-box;@{font}'>
        <div style='flex:1;@{card_green}'>
          <div style='@{card_title}'>Course Supply</div>
          <div style='@{inner_white}font-size:19px;color:#0B3A75;line-height:1.8;'>{{ value }}<br>Courses</div></div>
        {{ arrow_g }}
        <div style='flex:1;@{card_green}'>
          <div style='@{card_title}'>Course Completion</div>
          <div style='@{inner_white}display:flex;justify-content:space-around;font-size:19px;color:#0B3A75;line-height:1.8;'>
            <span>{{ fct_course.completions._rendered_value }}<br>Completions</span><span>{{ fct_course.completion_rate._rendered_value }}<br>Rate</span></div></div>
        {{ arrow_g }}
        <div style='flex:1;@{card_green}'>
          <div style='@{card_title}'>End-of-Course Assessment</div>
          <div style='@{inner_white}display:flex;justify-content:space-around;font-size:19px;color:#0B3A75;line-height:1.8;'>
            <span>{{ fct_course.eoc_coverage._rendered_value }}<br>Coverage</span><span>{{ fct_course.pass_rate._rendered_value }}<br>Pass Rate</span></div></div>
        {{ arrow_g }}
        <div style='flex:1;@{card_cream}'>
          <div style='@{card_title}'>Competency Assessment</div>
          <div style='@{inner_white}font-size:18px;color:#0B3A75;line-height:1.8;'>Under development<br>@{badge_asp}</div></div>
        {{ arrow_y }}
        <div style='flex:1;@{card_grey}'>
          <div style='@{card_title}'>Workplace Validation</div>
          <div style='@{inner_white}font-size:17px;color:#0B3A75;line-height:1.4;'>360-degree Feedback System to be developed<br>@{badge_asp}</div></div>
        {{ arrow_k }}
        <div style='flex:1;@{card_grey}'>
          <div style='@{card_title}'>Citizen Feedback / Workflow Application Systems</div>
          <div style='@{inner_white}font-size:17px;color:#0B3A75;line-height:1.6;'>Beyond CBC mandate<br>@{badge_asp}</div></div>
      </div> ;;
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
    html: <div style='width:100%;display:flex;align-items:center;@{font}'>
      <img src='@{asset_base}/icon_themes.svg' style='width:64px;height:64px;position:relative;z-index:2;margin-right:-12px;'>
      <div style='flex:1;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;'>
        <div style='background:#E3F2FD;text-align:center;font-size:18px;font-weight:600;color:#212121;padding:6px;'>Themes Covered</div>
        <div style='display:flex;justify-content:space-around;text-align:center;color:#0B3A75;padding:2px 0 4px;'>
          <div><div style='font-size:26px;'>{{ value }}</div><div style='font-size:12px;'>B&amp;F</div></div>
          <div><div style='font-size:26px;'>{{ rpt_taxonomy_coverage.themes_domain_label._value }}</div><div style='font-size:12px;'>Domain</div></div>
        </div></div></div> ;;
  }

  # Tile fields: [rpt_taxonomy_coverage.subthemes_card, rpt_taxonomy_coverage.subthemes_domain_label]
  measure: subthemes_card {
    hidden: yes
    type: string
    sql: ${subthemes_bf_label} ;;
    html: <div style='width:100%;display:flex;align-items:center;@{font}'>
      <img src='@{asset_base}/icon_subthemes.svg' style='width:64px;height:64px;position:relative;z-index:2;margin-right:-12px;'>
      <div style='flex:1;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;'>
        <div style='background:#E3F2FD;text-align:center;font-size:18px;font-weight:600;color:#212121;padding:6px;'>Sub-Themes Covered</div>
        <div style='display:flex;justify-content:space-around;text-align:center;color:#0B3A75;padding:2px 0 4px;'>
          <div><div style='font-size:26px;'>{{ value }}</div><div style='font-size:12px;'>B&amp;F</div></div>
          <div><div style='font-size:26px;'>{{ rpt_taxonomy_coverage.subthemes_domain_label._value }}</div><div style='font-size:12px;'>Domain</div></div>
        </div></div></div> ;;
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
    html: <div style='width:100%;box-sizing:border-box;padding:0 8px;@{font}'>
      <div style='display:flex;align-items:flex-start;margin-bottom:22px;'>
        <img src='@{asset_base}/icon_officials.svg' style='width:100px;height:100px;border-radius:50%;background:#EEEEEE;position:relative;z-index:2;margin-right:-24px;'>
        <div style='flex:1;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;padding-bottom:14px;'>
          <div style='background:#E3F2FD;text-align:center;font-size:19px;font-weight:600;color:#212121;padding:8px 6px 8px 24px;'>Total No. of Assigned Officials</div>
          <div style='margin:14px auto 0;width:60%;background:#F5F5F5;border-radius:10px;text-align:center;font-size:40px;color:#0B3A75;padding:6px 0;'>{{ rendered_value }}</div>
        </div></div>
      <div style='display:flex;align-items:flex-start;'>
        <img src='@{asset_base}/icon_officials_solid.svg' style='width:100px;height:100px;position:relative;z-index:2;margin-right:-24px;'>
        <div style='flex:1;box-shadow:0 1px 4px rgba(0,0,0,.2);border-radius:6px;padding-bottom:14px;'>
          <div style='background:#E3F2FD;text-align:center;font-size:19px;font-weight:600;color:#212121;padding:8px 6px 8px 24px;'>Assigned Completion Rate</div>
          <div style='margin:14px auto 0;width:60%;background:#F5F5F5;border-radius:10px;text-align:center;font-size:40px;color:#0B3A75;padding:6px 0;'>{{ fct_cbp_assignment.completion_rate._rendered_value }}</div>
        </div></div>
      </div> ;;
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
