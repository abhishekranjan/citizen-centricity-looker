# =====================================================================
# cc_ui – one-row helper view that exists only to draw static HTML
# elements on the dashboards (header band, question bars, pills,
# aspirational cards, go-back links, footer).
#
# LAYOUT NOTE: everything here uses <table>, not flexbox.
# Looker's single-value tile puts the html: output inside a centred,
# shrink-to-fit wrapper, so `display:flex` children wrap onto separate
# lines instead of sitting side by side (that is what made the header
# stack the logo above the tabs). Tables with explicit column widths
# are the only reliable way to lay out horizontally in a Looker tile.
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
  # HEADER BAND  (logo | title | 5 tabs, active tab greyed)
  # ===================================================================
  measure: header_executive_summary {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{hdr_table}'><tr>
      <td style='@{hdr_logo_td}'><img src='@{asset_base}/cbc_logo.png' style='@{hdr_logo}'></td>
      <td style='@{hdr_title_td}'>Key Result Area: Citizen-Centricity</td>
      <td style='@{hdr_tabs_td}'><a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab_on}'>Executive Summary</a><a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a><a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a><a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a><a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a></td>
      </tr></table> ;;
  }

  measure: header_coverage {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{hdr_table}'><tr>
      <td style='@{hdr_logo_td}'><img src='@{asset_base}/cbc_logo.png' style='@{hdr_logo}'></td>
      <td style='@{hdr_title_td}'>Key Result Area: Citizen-Centricity</td>
      <td style='@{hdr_tabs_td}'><a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a><a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab_on}'>Coverage</a><a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a><a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a><a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a></td>
      </tr></table> ;;
  }

  measure: header_adoption {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{hdr_table}'><tr>
      <td style='@{hdr_logo_td}'><img src='@{asset_base}/cbc_logo.png' style='@{hdr_logo}'></td>
      <td style='@{hdr_title_td}'>Key Result Area: Citizen-Centricity</td>
      <td style='@{hdr_tabs_td}'><a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a><a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a><a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab_on}'>Adoption</a><a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a><a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a></td>
      </tr></table> ;;
  }

  measure: header_learning {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{hdr_table}'><tr>
      <td style='@{hdr_logo_td}'><img src='@{asset_base}/cbc_logo.png' style='@{hdr_logo}'></td>
      <td style='@{hdr_title_td}'>Key Result Area: Citizen-Centricity</td>
      <td style='@{hdr_tabs_td}'><a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a><a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a><a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a><a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab_on}'>Learning</a><a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a></td>
      </tr></table> ;;
  }

  measure: header_performance {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{hdr_table}'><tr>
      <td style='@{hdr_logo_td}'><img src='@{asset_base}/cbc_logo.png' style='@{hdr_logo}'></td>
      <td style='@{hdr_title_td}'>Key Result Area: Citizen-Centricity</td>
      <td style='@{hdr_tabs_td}'><a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a><a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a><a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a><a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a><a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab_on}'>Performance</a></td>
      </tr></table> ;;
  }

  # Drill-through pages: no tab highlighted
  measure: header_plain {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{hdr_table}'><tr>
      <td style='@{hdr_logo_td}'><img src='@{asset_base}/cbc_logo.png' style='@{hdr_logo}'></td>
      <td style='@{hdr_title_td}'>Key Result Area: Citizen-Centricity</td>
      <td style='@{hdr_tabs_td}'><a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{tab}'>Executive Summary</a><a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{tab}'>Coverage</a><a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{tab}'>Adoption</a><a href='/dashboards/citizen_centricity::cc_learning' target='_self' style='@{tab}'>Learning</a><a href='/dashboards/citizen_centricity::cc_performance' target='_self' style='@{tab}'>Performance</a></td>
      </tr></table> ;;
  }

  # ===================================================================
  # GO BACK LINKS
  # ===================================================================
  measure: go_back_executive_summary {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{go_back}'><a href='/dashboards/citizen_centricity::cc_executive_summary' target='_self' style='@{go_back_a}'>Go Back</a></div> ;;
  }
  measure: go_back_coverage {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{go_back}'><a href='/dashboards/citizen_centricity::cc_coverage' target='_self' style='@{go_back_a}'>Go Back</a></div> ;;
  }
  measure: go_back_adoption {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{go_back}'><a href='/dashboards/citizen_centricity::cc_adoption' target='_self' style='@{go_back_a}'>Go Back</a></div> ;;
  }

  # ===================================================================
  # NAVY QUESTION BARS
  # ===================================================================
  measure: q_reach {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{qbar_table}'><tr>
      <td style='width:20%;'></td>
      <td style='@{qbar_td}'>What is the overall reach of citizen-centric capacity building?</td>
      <td style='width:20%;text-align:right;padding-right:10px;'><a href='/dashboards/citizen_centricity::cc_course_list' target='_self' style='@{pill}'>Get more details</a></td>
      </tr></table> ;;
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
  # ASPIRATIONAL PANELS
  # ===================================================================
  measure: asp_content_quality_signals {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{panel}'>
      <table style='width:100%;border-collapse:collapse;font-size:11px;color:#9E9E9E;'>
        <tr style='text-align:left;background:#F5F5F5;'><th style='padding:5px;'>Course</th><th>Pillar</th><th>Provider</th><th>Pass Rate</th><th>Health Score</th></tr>
        <tr><td style='padding:7px 5px;'><div style='@{sk_bar}width:80%;'></div></td><td><div style='@{sk_bar}width:60%;'></div></td><td><div style='@{sk_bar}width:70%;'></div></td><td><div style='@{sk_bar}width:40%;'></div></td><td><div style='@{sk_chip}'></div></td></tr>
        <tr><td style='padding:7px 5px;'><div style='@{sk_bar}width:70%;'></div></td><td><div style='@{sk_bar}width:60%;'></div></td><td><div style='@{sk_bar}width:70%;'></div></td><td><div style='@{sk_bar}width:40%;'></div></td><td><div style='@{sk_chip}'></div></td></tr>
        <tr><td style='padding:7px 5px;'><div style='@{sk_bar}width:85%;'></div></td><td><div style='@{sk_bar}width:60%;'></div></td><td><div style='@{sk_bar}width:70%;'></div></td><td><div style='@{sk_bar}width:40%;'></div></td><td><div style='@{sk_chip}'></div></td></tr>
        <tr><td style='padding:7px 5px;'><div style='@{sk_bar}width:65%;'></div></td><td><div style='@{sk_bar}width:60%;'></div></td><td><div style='@{sk_bar}width:70%;'></div></td><td><div style='@{sk_bar}width:40%;'></div></td><td><div style='@{sk_chip}'></div></td></tr>
      </table>
      <div style='font-size:10px;color:#9E9E9E;margin-top:6px;text-align:left;'>
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
    html: <div style='@{panel}'>
      <div style='margin:12px 0 8px 20px;text-align:left;'>
        <span style='display:inline-block;background:#1565C0;color:#fff;border-radius:16px;padding:5px 18px;font-size:13px;font-weight:700;'>Functional Family</span>
        <span style='display:inline-block;border:1.5px solid #90CAF9;color:#1565C0;border-radius:16px;padding:4px 18px;font-size:13px;font-weight:700;margin-left:8px;'>Gender</span>
      </div>
      <table style='width:94%;margin-left:20px;font-size:13px;color:#424242;border-collapse:collapse;'>
        <tr><td style='width:34%;padding:5px 0;text-align:left;'>Decision Makers</td><td><div style='@{ff_bar}'></div></td></tr>
        <tr><td style='padding:5px 0;text-align:left;'>Frontline Staff</td><td><div style='@{ff_bar}'></div></td></tr>
        <tr><td style='padding:5px 0;text-align:left;'>Supervisory Roles</td><td><div style='@{ff_bar}'></div></td></tr>
        <tr><td style='padding:5px 0;text-align:left;'>Programme Leadership</td><td><div style='@{ff_bar}'></div></td></tr>
        <tr><td style='padding:5px 0;text-align:left;'>Policy Leadership</td><td><div style='@{ff_bar}'></div></td></tr>
      </table>
      <div style='text-align:center;font-size:12px;font-style:italic;color:#9E9E9E;margin-top:8px;'>Available once functional family fields are tagged in iGOT learner profiles.</div>
      </div> ;;
  }

  measure: asp_demand_signal {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{panel}'>
      <div style='margin:10px auto;width:88%;border:1px solid #E0E0E0;border-radius:6px;padding:10px;text-align:center;'>
        <img src='@{asset_base}/icon_ai_tool.svg' style='width:28px;height:28px;'>
        <div style='font-size:13px;font-weight:700;color:#0B3A75;margin-top:3px;'>iGOT AI CBP Tool</div>
        <div style='font-size:11px;color:#757575;'>Recommends sub-themes to officials<br>building their capacity plan</div>
        <div style='color:#BDBDBD;margin:6px 0;'>&#8595;</div>
        <img src='@{asset_base}/icon_flag_gap.svg' style='width:28px;height:28px;'>
        <div style='font-size:13px;font-weight:700;color:#0B3A75;margin-top:3px;'>Flag Supply Gaps</div>
        <div style='font-size:11px;color:#757575;'>Sub-themes with high demand but fewer<br>than 5 courses flagged for action</div>
        <div style='font-size:10px;font-style:italic;color:#9E9E9E;margin-top:10px;text-align:left;'>&#128274; Available once iGOT AI CBP tool data is piped in.</div>
      </div></div> ;;
  }

  # ===================================================================
  # COMPOSITE SCORE CALCULATION PAGE – static text
  # ===================================================================
  measure: calc_intro {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;box-sizing:border-box;background:#E3F2FD;color:#1565C0;font-size:16px;line-height:1.4;text-align:center;padding:8px 20px;@{font}'>
      The composite score measures citizen-centricity learning across four pillars: Service Knowledge, Responsiveness, Transparency, and Participation.
      Each pillar is scored on three components - course supply, assigned completion, and assessment pass rate and combined using the weights below.
      </div> ;;
  }

  measure: calc_definitions {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='width:100%;text-align:justify;font-size:14px;line-height:1.6;color:#212121;padding:0 14px;box-sizing:border-box;@{font}'>
      <div style='font-size:17px;font-weight:700;color:#0B3A75;text-align:left;'>&#8226; Proficiency-Level Coverage:</div>
      <div style='font-style:italic;margin-bottom:10px;text-align:left;'>Is citizen-centric learning available at the right depth?</div>
      <p>This measures whether iGOT has courses mapped to each pillar across all three proficiency levels: Beginner, Intermediate, and Advanced. A pillar with content only at beginner level scores lower than one with full coverage across all levels. The score is calculated as the percentage of sub-theme &#215; proficiency level combinations that have at least one course available.</p>
      <div style='font-size:17px;font-weight:700;color:#0B3A75;margin-top:14px;text-align:left;'>&#8226; Assigned Completion Rate</div>
      <div style='font-style:italic;margin-bottom:10px;text-align:left;'>Are civil servants engaging with the learning assigned to them?</div>
      <p>This is the most direct signal of behavioural engagement. An MDO may have courses available and assigned, but if completion is low, capacity building is not happening in practice. This measures the percentage of assigned learning that officials actually complete.</p>
      <div style='font-size:17px;font-weight:700;color:#0B3A75;margin-top:14px;text-align:left;'>&#8226; Assessment Pass Rate</div>
      <div style='font-style:italic;margin-bottom:10px;text-align:left;'>Are civil servants demonstrating they have understood what they learned?</div>
      <p>Completion alone does not confirm learning. The pass rate adds a quality filter, indicating whether engagement translated into measurable competency acquisition. This measures the percentage of assessment attempts that result in a pass.</p>
      </div> ;;
  }

  # ===================================================================
  # CARD HEADER STRIPS
  # Each sits directly above a native chart/table whose Looker title is
  # hidden. Pills live INSIDE the strip so it is unambiguous which card
  # they belong to.
  # ===================================================================

  # -- Coverage --
  measure: strip_course_difficulty {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Course Difficulty Levels</td>
      <td style='@{strip_right}'><a href='/dashboards/citizen_centricity::cc_difficulty_by_subtheme' target='_self' style='@{pill}'>Get more details</a></td>
      </tr></table> ;;
  }
  measure: strip_assessment_maturity {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Maturity of Assessment Framework <i style='font-weight:500;'>(Courses with Assessments)</i></td>
      </tr></table> ;;
  }
  measure: strip_data_gaps {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Data Gaps in the System</td>
      <td style='@{strip_right}'><a href='/dashboards/citizen_centricity::cc_data_gaps' target='_self' style='@{pill}'>Get more details</a></td>
      </tr></table> ;;
  }
  measure: strip_provider_contribution {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Contribution of Course Providers</td>
      </tr></table> ;;
  }
  measure: strip_subtheme_coverage {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Sub-Theme Coverage | By Pillars</td>
      </tr></table> ;;
  }

  # -- Adoption --
  measure: strip_cbp_coverage {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>CBP Coverage</td>
      <td style='@{strip_right}'><a href='/dashboards/citizen_centricity::cc_adoption_ministry' target='_self' style='@{pill}'>Get more details</a></td>
      </tr></table> ;;
  }
  measure: strip_assigned_completion {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Assigned Completion | By Pillar, Theme, Sub-Theme</td>
      </tr></table> ;;
  }

  # -- Learning --
  measure: strip_group_distribution {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Group-wise Distribution and Completions</td>
      </tr></table> ;;
  }
  measure: strip_pillar_group {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Pillar wise completion of Groups</td>
      </tr></table> ;;
  }

  # MDO / State toggle. The two Learning pages are separate dashboards;
  # these links switch between them and carry the current Date Range and
  # Group filter values across (tile must listen to both filters).
  filter: date_range {
    hidden: yes
    type: date
  }
  filter: group {
    hidden: yes
    type: string
  }

  measure: strip_learning_mdo {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Learning across MDOs and States</td>
      <td style='@{strip_right}'>
        <a href='/dashboards/citizen_centricity::cc_learning?Date+Range={{ _filters["cc_ui.date_range"] | url_encode }}&Group={{ _filters["cc_ui.group"] | url_encode }}' target='_self' style='@{toggle_on}'>MDO</a><a href='/dashboards/citizen_centricity::cc_learning_state?Date+Range={{ _filters["cc_ui.date_range"] | url_encode }}&Group={{ _filters["cc_ui.group"] | url_encode }}' target='_self' style='@{toggle_off}'>State</a></td>
      </tr></table> ;;
  }
  measure: strip_learning_state {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Learning across MDOs and States</td>
      <td style='@{strip_right}'>
        <a href='/dashboards/citizen_centricity::cc_learning?Date+Range={{ _filters["cc_ui.date_range"] | url_encode }}&Group={{ _filters["cc_ui.group"] | url_encode }}' target='_self' style='@{toggle_off}'>MDO</a><a href='/dashboards/citizen_centricity::cc_learning_state?Date+Range={{ _filters["cc_ui.date_range"] | url_encode }}&Group={{ _filters["cc_ui.group"] | url_encode }}' target='_self' style='@{toggle_on}'>State</a></td>
      </tr></table> ;;
  }

  # -- Performance --
  measure: strip_pass_rate {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>End-of-Course Assessment Pass Rate</td>
      </tr></table> ;;
  }

  # -- Aspirational panel headers --
  measure: strip_asp_content_quality_signals {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Content Quality Signals</td>
      <td style='@{strip_right}'>@{badge_asp}</td>
      </tr></table> ;;
  }
  measure: strip_asp_functional_family {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Distribution by Functional Family and Gender</td>
      <td style='@{strip_right}'>@{badge_asp}</td>
      </tr></table> ;;
  }
  measure: strip_asp_demand_signal {
    type: max
    sql: ${TABLE}.one ;;
    html: <table style='@{strip_table}'><tr>
      <td style='@{strip_title}'>Demand Signal</td>
      <td style='@{strip_right}'>@{badge_asp}</td>
      </tr></table> ;;
  }

  # -- Drill-through page titles (centred, as in the original) --
  measure: title_course_list {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{page_title}'>Course List</div> ;;
  }
  measure: title_data_gaps {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{page_title}'>Data Gaps</div> ;;
  }
  measure: title_difficulty_subtheme {
    type: max
    sql: ${TABLE}.one ;;
    html: <div style='@{page_title}'>Course Difficulty by Sub-Theme</div> ;;
  }

  # ===================================================================
  # FOOTER
  # ===================================================================
  measure: footer_last_updated {
    type: string
    sql: MAX(${TABLE}.last_updated) ;;
    html: <div style='width:100%;text-align:left;font-size:13px;color:#616161;padding-left:4px;@{font}'>Data Last Updated: {{ value }}</div> ;;
  }
}
