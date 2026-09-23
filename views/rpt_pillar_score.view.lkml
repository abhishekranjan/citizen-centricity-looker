view: rpt_pillar_score {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.rpt_pillar_score` ;;

  dimension: pillar {
    primary_key: yes
    type: string
    sql: ${TABLE}.pillar ;;
    order_by_field: pillar_sort
  }
  dimension: pillar_sort { hidden: yes type: number sql: ${TABLE}.pillar_sort ;; }

  # ---- Composite score (per pillar; headline = average of the 4 pillars) ----
  measure: composite_score {
    label: "Composite Score"
    description: "30% proficiency-level coverage + 40% assigned completion + 30% pass rate. With no pillar filter = average of the four pillar scores (headline x/100)."
    type: average
    sql: ${TABLE}.composite_score ;;
    value_format: "0"
  }
  measure: composite_score_out_of_100 {
    label: "Composite Score /100"
    type: average
    sql: ${TABLE}.composite_score ;;
    value_format: "0\"/100\""
  }
  measure: proficiency_level_coverage {
    label: "Proficiency-Level Coverage"
    type: average
    sql: ${TABLE}.proficiency_level_coverage ;;
    value_format_name: percent_1
  }

  # ---- additive components ----
  measure: courses { label: "Courses" type: sum sql: ${TABLE}.courses ;; value_format_name: decimal_0 }
  measure: courses_with_eoc { type: sum sql: ${TABLE}.courses_with_eoc ;; }
  measure: enrolments {
    label: "Total Enrollment"
    type: sum
    sql: ${TABLE}.enrolments ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  }
  measure: completions {
    label: "Total Completions"
    type: sum
    sql: ${TABLE}.completions ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  }
  measure: completion_rate {
    label: "Completion Rate"
    type: number
    sql: SAFE_DIVIDE(${completions}, ${enrolments}) ;;
    value_format_name: percent_0
  }
  measure: assessed_users { type: sum sql: ${TABLE}.assessed_users ;; }
  measure: passed_users { type: sum sql: ${TABLE}.passed_users ;; }
  measure: assessment_pass_rate {
    label: "Assessment Pass Rate"
    type: number
    sql: SAFE_DIVIDE(${passed_users}, ${assessed_users}) ;;
    value_format_name: percent_0
  }
  measure: allocations { type: sum sql: ${TABLE}.allocations ;; value_format_name: decimal_0 }
  measure: assigned_completions { type: sum sql: ${TABLE}.assigned_completions ;; value_format_name: decimal_0 }
  measure: assigned_completion_rate {
    label: "Assigned Completion Rate"
    type: number
    sql: SAFE_DIVIDE(${assigned_completions}, ${allocations}) ;;
    value_format_name: percent_1
  }
  measure: subthemes_total { type: sum sql: ${TABLE}.subthemes_total ;; }
  measure: subthemes_covered { type: sum sql: ${TABLE}.subthemes_covered ;; }

  # ---- CBP coverage chart (Adoption tab): distinct orgs per pillar ----
  measure: union_ministries {
    label: "Union CBPs"
    description: "Distinct Union ministries with >=1 CBP containing a course of this pillar"
    type: sum
    sql: ${TABLE}.union_ministries ;;
  }
  measure: state_ministries {
    label: "State CBPs"
    description: "Distinct States/UTs with >=1 CBP containing a course of this pillar"
    type: sum
    sql: ${TABLE}.state_ministries ;;
  }

  # ---- weights (page 2 table) ----
  measure: w_proficiency { type: max sql: ${TABLE}.w_proficiency ;; value_format_name: percent_0 }
  measure: w_assigned_completion { type: max sql: ${TABLE}.w_assigned_completion ;; value_format_name: percent_0 }
  measure: w_pass_rate { type: max sql: ${TABLE}.w_pass_rate ;; value_format_name: percent_0 }
}
