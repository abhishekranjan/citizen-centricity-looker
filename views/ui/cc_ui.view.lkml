# =====================================================================
# cc_ui – one-row helper view that exists only to draw static HTML
# elements on the dashboards (header band, question bars, pills,
# aspirational cards, go-back links, footer).
#
# Each measure returns MAX(1) (or the last-updated string) and the
# html: block draws the element. Dashboard tiles show these through
# type: single_value with title / comparison hidden.
#
# Explore is declared hidden in the model – it never shows in the
# Explore menu.
# =====================================================================

view: cc_ui {
  derived_table: {
    sql:
      SELECT
        1 AS one,
        (SELECT FORMAT_TIMESTAMP('%m/%d/%Y %I:%M:%S %p',
                                 TIMESTAMP_MILLIS(MAX(last_modified_time)),
                                 'Asia/Kolkata')
           FROM `prj-kb-prd-looker-gcp-1014.citizen_centricity.__TABLES__`) AS last_updated ;;
  }

  dimension: one {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.one ;;
  }

  # ===================================================================
  # HEADER BAND  (logo + title + 5 tabs, active tab greyed)
  # ===================================================================
  measure: header_executive_summary {
    type: max
    sql: ${TABLE}.one ;;
    html: @{hdr_open}
      <div style='display:flex;align-items:center;'>
        <img src='@{asset_base}/cbc_logo.png' style='height:50px;background:#ffffff;padding:2px 4px;margin-right:22px;'>
        @{hdr_title}
      </div>
      <div style='white-space:nowrap;'>
        <a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab_on}'>Executive Summary</a>
        <a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a>
        <a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a>
        <a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a>
        <a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a>
      </div></div> ;;
  }

  measure: header_coverage {
    type: max
    sql: ${TABLE}.one ;;
    html: @{hdr_open}
      <div style='display:flex;align-items:center;'>
        <img src='@{asset_base}/cbc_logo.png' style='height:50px;background:#ffffff;padding:2px 4px;margin-right:22px;'>
        @{hdr_title}
      </div>
      <div style='white-space:nowrap;'>
        <a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a>
        <a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab_on}'>Coverage</a>
        <a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a>
        <a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a>
        <a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a>
      </div></div> ;;
  }

  measure: header_adoption {
    type: max
    sql: ${TABLE}.one ;;
    html: @{hdr_open}
      <div style='display:flex;align-items:center;'>
        <img src='@{asset_base}/cbc_logo.png' style='height:50px;background:#ffffff;padding:2px 4px;margin-right:22px;'>
        @{hdr_title}
      </div>
      <div style='white-space:nowrap;'>
        <a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a>
        <a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a>
        <a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab_on}'>Adoption</a>
        <a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a>
        <a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a>
      </div></div> ;;
  }

  measure: header_learning {
    type: max
    sql: ${TABLE}.one ;;
    html: @{hdr_open}
      <div style='display:flex;align-items:center;'>
        <img src='@{asset_base}/cbc_logo.png' style='height:50px;background:#ffffff;padding:2px 4px;margin-right:22px;'>
        @{hdr_title}
      </div>
      <div style='white-space:nowrap;'>
        <a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a>
        <a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a>
        <a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a>
        <a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab_on}'>Learning</a>
        <a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a>
      </div></div> ;;
  }

  measure: header_performance {
    type: max
    sql: ${TABLE}.one ;;
    html: @{hdr_open}
      <div style='display:flex;align-items:center;'>
        <img src='@{asset_base}/cbc_logo.png' style='height:50px;background:#ffffff;padding:2px 4px;margin-right:22px;'>
        @{hdr_title}
      </div>
      <div style='white-space:nowrap;'>
        <a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a>
        <a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a>
        <a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a>
        <a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a>
        <a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab_on}'>Performance</a>
      </div></div> ;;
  }

  # Drill-through pages: no tab highlighted
  measure: header_plain {
    type: max
    sql: ${TABLE}.one ;;
    html: @{hdr_open}
      <div style='display:flex;align-items:center;'>
        <img src='@{asset_base}/cbc_logo.png' style='height:50px;background:#ffffff;padding:2px 4px;margin-right:22px;'>
        @{hdr_title}
      </div>
      <div style='white-space:nowrap;'>
        <a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a>
        <a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a>
        <a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a>
        <a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a>
        <a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a>
      </div></div> ;;
  }

  # ===================================================================
  # GO BACK LINKS
  # ===================================================================
  measure: go_back_executive_summary {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:left;padding-left:40px;@{font}'>
      <a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='font-size:26px;color:#212121;text-decoration:none;'>Go Back</a></div> ;;
  }
  measure: go_back_coverage {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:left;padding-left:40px;@{font}'>
      <a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='font-size:26px;color:#212121;text-decoration:none;'>Go Back</a></div> ;;
  }
  measure: go_back_adoption {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:left;padding-left:40px;@{font}'>
      <a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='font-size:26px;color:#212121;text-decoration:none;'>Go Back</a></div> ;;
  }

  # ===================================================================
  # NAVY QUESTION BARS
  # ===================================================================
  measure: q_reach {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}display:flex;align-items:center;'>
      <span style='flex:1;'></span>
      <span style='flex:4;'>What is the overall reach of citizen-centric capacity building?</span>
      <span style='flex:1;text-align:right;'><a href='/dashboards/citizen_centricity::cc_course_list' target='_self' style='@{pill}'>Get more details</a></span>
      </div> ;;
  }
  measure: q_coverage {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}'>What does the learning infrastructure look like?</div> ;;
  }
  measure: q_adoption_mdos {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}'>Are MDOs formally taking up citizen-centric learning?</div> ;;
  }
  measure: q_adoption_pillars {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}'>Which pillars are seeing the most activity?</div> ;;
  }
  measure: q_learning {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}'>Are the right officials building capacity?</div> ;;
  }
  measure: q_perf_assessment {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}'>Do assessment processes ensure meaningful evaluation and are the learners engaging?</div> ;;
  }
  measure: q_perf_demonstrating {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}'>How well are civil servants demonstrating of citizen centric learning?</div> ;;
  }
  measure: q_perf_competency {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{qbar}'>How far has the system progressed toward measuring actual competency?</div> ;;
  }

  # ===================================================================
  # "GET MORE DETAILS" PILLS (right-aligned)
  # ===================================================================
  measure: pill_difficulty {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:right;padding-right:12px;@{font}'>
      <a href='/dashboards/citizen_centricity::cc_difficulty_by_subtheme' target='_self' style='@{pill}'>Get more details</a></div> ;;
  }
  measure: pill_data_gaps {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:right;padding-right:12px;@{font}'>
      <a href='/dashboards/citizen_centricity::cc_data_gaps' target='_self' style='@{pill}'>Get more details</a></div> ;;
  }
  measure: pill_ministry {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:right;padding-right:12px;@{font}'>
      <a href='/dashboards/citizen_centricity::cc_adoption_ministry' target='_self' style='@{pill}'>Get more details</a></div> ;;
  }

  # ===================================================================
  # ASPIRATIONAL PANELS
  # ===================================================================
  measure: asp_content_quality_signals {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;@{font}'>
      <div style='@{strip}display:flex;justify-content:space-between;align-items:center;'>
        <span>Content Quality Signals</span>@{badge_asp}</div>
      <table style='width:100%;border-collapse:collapse;font-size:11px;color:#9E9E9E;'>
        <tr style='text-align:left;background:#F5F5F5;'><th style='padding:6px;'>Course</th><th>Pillar</th><th>Provider</th><th>Pass Rate</th><th>Health Score</th></tr>
        <tr><td style='padding:10px 6px;'><div style='height:6px;width:80%;background:#EEEEEE;border-radius:3px;'></div></td><td><div style='height:6px;width:60%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:70%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:40%;background:#EEEEEE;'></div></td><td><div style='height:14px;width:30px;background:#F5F5F5;border-radius:3px;'></div></td></tr>
        <tr><td style='padding:10px 6px;'><div style='height:6px;width:70%;background:#EEEEEE;border-radius:3px;'></div></td><td><div style='height:6px;width:60%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:70%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:40%;background:#EEEEEE;'></div></td><td><div style='height:14px;width:30px;background:#F5F5F5;border-radius:3px;'></div></td></tr>
        <tr><td style='padding:10px 6px;'><div style='height:6px;width:85%;background:#EEEEEE;border-radius:3px;'></div></td><td><div style='height:6px;width:60%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:70%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:40%;background:#EEEEEE;'></div></td><td><div style='height:14px;width:30px;background:#F5F5F5;border-radius:3px;'></div></td></tr>
        <tr><td style='padding:10px 6px;'><div style='height:6px;width:65%;background:#EEEEEE;border-radius:3px;'></div></td><td><div style='height:6px;width:60%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:70%;background:#EEEEEE;'></div></td><td><div style='height:6px;width:40%;background:#EEEEEE;'></div></td><td><div style='height:14px;width:30px;background:#F5F5F5;border-radius:3px;'></div></td></tr>
      </table>
      <div style='font-size:10px;color:#9E9E9E;margin-top:8px;text-align:left;'>
        <b>Health Score =</b>
        <span style='color:#43A047;'>&#9679;</span> Pass rate
        <span style='color:#1E88E5;'>&#9679;</span> Has assessment
        <span style='color:#FB8C00;'>&#9679;</span> Completion rate
        <span style='color:#E53935;'>&#9679;</span> Flagged if &lt;50%</div>
      </div> ;;
  }

  measure: asp_functional_family {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;@{font}text-align:left;'>
      <div style='@{strip}display:flex;justify-content:space-between;align-items:center;'>
        <span>Distribution by Functional Family and Gender</span>@{badge_asp}</div>
      <div style='margin:14px 0 10px 24px;'>
        <span style='display:inline-block;background:#1565C0;color:#fff;border-radius:16px;padding:5px 20px;font-size:14px;font-weight:700;'>Functional Family</span>
        <span style='display:inline-block;border:1.5px solid #90CAF9;color:#1565C0;border-radius:16px;padding:4px 20px;font-size:14px;font-weight:700;margin-left:8px;'>Gender</span>
      </div>
      <table style='width:95%;margin-left:24px;font-size:13px;color:#424242;border-collapse:collapse;'>
        <tr><td style='width:35%;padding:6px 0;'>Decision Makers</td><td><div style='height:6px;background:#E3F2FD;border-radius:3px;'></div></td></tr>
        <tr><td style='padding:6px 0;'>Frontline Staff</td><td><div style='height:6px;background:#E3F2FD;border-radius:3px;'></div></td></tr>
        <tr><td style='padding:6px 0;'>Supervisory Roles</td><td><div style='height:6px;background:#E3F2FD;border-radius:3px;'></div></td></tr>
        <tr><td style='padding:6px 0;'>Programme Leadership</td><td><div style='height:6px;background:#E3F2FD;border-radius:3px;'></div></td></tr>
        <tr><td style='padding:6px 0;'>Policy Leadership</td><td><div style='height:6px;background:#E3F2FD;border-radius:3px;'></div></td></tr>
      </table>
      <div style='text-align:center;font-size:12px;font-style:italic;color:#9E9E9E;margin-top:10px;'>Available once functional family fields are tagged in iGOT learner profiles.</div>
      </div> ;;
  }

  measure: asp_demand_signal {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;@{font}'>
      <div style='@{strip}display:flex;justify-content:space-between;align-items:center;'>
        <span>Demand Signal</span>@{badge_asp}</div>
      <div style='margin:12px auto;width:85%;border:1px solid #E0E0E0;border-radius:6px;padding:12px;text-align:center;'>
        <img src='@{asset_base}/icon_ai_tool.svg' style='width:30px;height:30px;'>
        <div style='font-size:13px;font-weight:700;color:#0B3A75;margin-top:4px;'>iGOT AI CBP Tool</div>
        <div style='font-size:11px;color:#757575;'>Recommends sub-themes to officials<br>building their capacity plan</div>
        <div style='color:#BDBDBD;margin:8px 0;'>&#8595;</div>
        <img src='@{asset_base}/icon_flag_gap.svg' style='width:30px;height:30px;'>
        <div style='font-size:13px;font-weight:700;color:#0B3A75;margin-top:4px;'>Flag Supply Gaps</div>
        <div style='font-size:11px;color:#757575;'>Sub-themes with high demand but fewer<br>than 5 courses flagged for action</div>
        <div style='font-size:10px;font-style:italic;color:#9E9E9E;margin-top:12px;text-align:left;'>&#128274; Available once iGOT AI CBP tool data is piped in.</div>
      </div></div> ;;
  }

  # ===================================================================
  # COMPOSITE SCORE CALCULATION PAGE – static text
  # ===================================================================
  measure: calc_intro {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;box-sizing:border-box;background:#E3F2FD;color:#1565C0;font-size:17px;line-height:1.45;text-align:center;padding:8px 24px;@{font}'>
      The composite score measures citizen-centricity learning across four pillars: Service Knowledge, Responsiveness, Transparency, and Participation.
      Each pillar is scored on three components - course supply, assigned completion, and assessment pass rate and combined using the weights below.
      </div> ;;
  }

  measure: calc_definitions {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:justify;font-size:15px;line-height:1.75;color:#212121;padding:0 16px;box-sizing:border-box;@{font}'>
      <div style='font-size:18px;font-weight:700;color:#0B3A75;'>&#8226; Proficiency-Level Coverage:</div>
      <div style='font-style:italic;margin-bottom:12px;'>Is citizen-centric learning available at the right depth?</div>
      <p>This measures whether iGOT has courses mapped to each pillar across all three proficiency levels: Beginner, Intermediate, and Advanced. A pillar with content only at beginner level scores lower than one with full coverage across all levels. The score is calculated as the percentage of sub-theme &#215; proficiency level combinations that have at least one course available.</p>
      <div style='font-size:18px;font-weight:700;color:#0B3A75;margin-top:18px;'>&#8226; Assigned Completion Rate</div>
      <div style='font-style:italic;margin-bottom:12px;'>Are civil servants engaging with the learning assigned to them?</div>
      <p>This is the most direct signal of behavioural engagement. An MDO may have courses available and assigned, but if completion is low, capacity building is not happening in practice. This measures the percentage of assigned learning that officials actually complete.</p>
      <div style='font-size:18px;font-weight:700;color:#0B3A75;margin-top:18px;'>&#8226; Assessment Pass Rate</div>
      <div style='font-style:italic;margin-bottom:12px;'>Are civil servants demonstrating they have understood what they learned?</div>
      <p>Completion alone does not confirm learning. The pass rate adds a quality filter, indicating whether engagement translated into measurable competency acquisition. This measures the percentage of assessment attempts that result in a pass.</p>
      </div> ;;
  }

  # ===================================================================
  # FOOTER
  # ===================================================================
  measure: footer_last_updated {
    type: string
    sql: MAX(${TABLE}.last_updated) ;;
    html: <div style='width:100%;text-align:left;font-size:14px;color:#616161;padding-left:6px;@{font}'>Data Last Updated: {{ value }}</div> ;;
  }
}
