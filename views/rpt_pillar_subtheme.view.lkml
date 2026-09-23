view: rpt_pillar_subtheme {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.rpt_pillar_subtheme` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.pillar, '|', ${TABLE}.theme, '|', ${TABLE}.sub_theme) ;;
  }
  dimension: pillar {
    type: string
    sql: ${TABLE}.pillar ;;
    order_by_field: pillar_sort
  }
  dimension: pillar_sort { hidden: yes type: number sql: ${TABLE}.pillar_sort ;; }
  dimension: theme { type: string sql: ${TABLE}.theme ;; }
  dimension: sub_theme { label: "Sub-Theme" type: string sql: ${TABLE}.sub_theme ;; }
  dimension: theme_type { label: "Theme Type" type: string sql: ${TABLE}.theme_type ;; }
  dimension: is_covered { type: yesno sql: ${TABLE}.is_covered ;; }
  dimension: courses_dim {
    label: "Courses (row value)"
    type: number
    sql: ${TABLE}.courses ;;
  }

  # ---- course supply / difficulty ----
  measure: total_courses {
    label: "Total Courses*"
    type: sum
    sql: ${TABLE}.courses ;;
  }
  measure: beginner_courses { label: "Beginner" type: sum sql: ${TABLE}.beginner_courses ;; }
  measure: intermediate_courses { label: "Intermediate" type: sum sql: ${TABLE}.intermediate_courses ;; }
  measure: advanced_courses { label: "Advance" type: sum sql: ${TABLE}.advanced_courses ;; }

  # ---- sub-theme coverage ----
  measure: subthemes_total {
    label: "Total Sub-themes"
    type: count_distinct
    sql: CONCAT(${theme}, '|', ${sub_theme}) ;;
  }
  measure: subthemes_covered {
    label: "Sub-themes"
    type: count_distinct
    sql: CONCAT(${theme}, '|', ${sub_theme}) ;;
    filters: [is_covered: "yes"]
  }
  measure: subtheme_coverage_pct {
    label: "Sub-themes Covered"
    type: number
    sql: SAFE_DIVIDE(${subthemes_covered}, ${subthemes_total}) ;;
    value_format_name: percent_0
  }
  measure: covered_subtheme_list {
    label: "Sub-theme list"
    type: string
    sql: STRING_AGG(DISTINCT IF(${TABLE}.is_covered, ${TABLE}.sub_theme, NULL), ', '
                    ORDER BY IF(${TABLE}.is_covered, ${TABLE}.sub_theme, NULL)) ;;
  }
  measure: levels_covered { type: sum sql: ${TABLE}.levels_covered ;; }
  measure: levels_possible { type: sum sql: ${TABLE}.levels_possible ;; }
  measure: proficiency_level_coverage {
    type: number
    sql: SAFE_DIVIDE(${levels_covered}, ${levels_possible}) ;;
    value_format_name: percent_0
  }

  # ---- learning metrics (page 3 drill) ----
  measure: enrolments { label: "Enrolments" type: sum sql: ${TABLE}.enrolments ;; value_format_name: decimal_0 }
  measure: completions { label: "Completions" type: sum sql: ${TABLE}.completions ;; value_format_name: decimal_0 }
  measure: completion_rate {
    label: "Completion Rate (%)"
    type: number
    sql: SAFE_DIVIDE(${completions}, ${enrolments}) ;;
    value_format_name: percent_0
  }
  measure: assessed_users { hidden: yes type: sum sql: ${TABLE}.assessed_users ;; }
  measure: passed_users { hidden: yes type: sum sql: ${TABLE}.passed_users ;; }
  measure: assessment_passed_pct {
    label: "Assessment Passed (%)"
    type: number
    sql: SAFE_DIVIDE(${passed_users}, NULLIF(${assessed_users}, 0)) ;;
    value_format_name: percent_0
  }

  # ---- CBP adoption (page 8) – distinct counts stored at row grain ----
  measure: state_cbps { label: "State CBPs" type: sum sql: ${TABLE}.state_cbps ;; }
  measure: union_cbps { label: "Union CBPs" type: sum sql: ${TABLE}.union_cbps ;; }
  measure: state_allocations { type: sum sql: ${TABLE}.state_allocations ;; value_format_name: decimal_0 }
  measure: state_completions { type: sum sql: ${TABLE}.state_completions ;; value_format_name: decimal_0 }
  measure: union_allocations { type: sum sql: ${TABLE}.union_allocations ;; value_format_name: decimal_0 }
  measure: union_completions { type: sum sql: ${TABLE}.union_completions ;; value_format_name: decimal_0 }
  measure: state_completion_pct {
    label: "State CBP Completion %"
    type: number
    sql: SAFE_DIVIDE(${state_completions}, ${state_allocations}) ;;
    value_format_name: percent_0
  }
  measure: union_completion_pct {
    label: "Union CBP Completion %"
    type: number
    sql: SAFE_DIVIDE(${union_completions}, ${union_allocations}) ;;
    value_format_name: percent_0
  }
}
