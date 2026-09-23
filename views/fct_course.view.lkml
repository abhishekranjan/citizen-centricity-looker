view: fct_course {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.fct_course` ;;

  # ---------------- Dimensions ----------------
  dimension: course_id {
    primary_key: yes
    label: "Course ID"
    type: string
    sql: ${TABLE}.course_id ;;
  }
  dimension: course_name { type: string sql: ${TABLE}.course_name ;; }
  dimension: content_provider_name {
    label: "Course Provider"
    type: string
    sql: ${TABLE}.content_provider_name ;;
  }
  dimension: difficulty_level {
    type: string
    sql: ${TABLE}.difficulty_level ;;
    order_by_field: difficulty_sort
  }
  dimension: difficulty_sort {
    hidden: yes
    type: number
    sql: CASE ${TABLE}.difficulty_level WHEN 'Beginner' THEN 1 WHEN 'Intermediate' THEN 2
         WHEN 'Advanced' THEN 3 ELSE 4 END ;;
  }
  dimension: content_rating {
    label: "Content Rating"
    type: number
    sql: ${TABLE}.content_rating ;;
    value_format_name: decimal_2
  }
  dimension: language { type: string sql: ${TABLE}.language ;; }
  dimension: content_status { type: string sql: ${TABLE}.content_status ;; }
  dimension: content_type { type: string sql: ${TABLE}.content_type ;; }
  dimension_group: last_published {
    type: time
    timeframes: [raw, date, month, year]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.last_published_date ;;
  }
  # Raw comma-separated labels from pillar_map – display only (Course List)
  dimension: pillar_list { label: "Pillar" type: string sql: ${TABLE}.pillar_list ;; }
  dimension: theme_list { label: "Theme" type: string sql: ${TABLE}.theme_list ;; }
  dimension: sub_theme_list { label: "Sub-Theme" type: string sql: ${TABLE}.sub_theme_list ;; }
  dimension: competency_list { label: "Competency Area" type: string sql: ${TABLE}.competency_list ;; }

  dimension: has_end_of_course_assessment {
    type: yesno
    sql: ${TABLE}.has_end_of_course_assessment = 1 ;;
  }
  dimension: eoc_yn {
    label: "End of Course Assessment (Y/N)"
    type: string
    sql: IF(${TABLE}.has_end_of_course_assessment = 1, 'Y', 'N') ;;
  }

  # ---------------- Course counts ----------------
  measure: course_count {
    label: "No. of Courses"
    type: count_distinct
    sql: ${course_id} ;;
    drill_fields: [course_detail*]
  }
  measure: courses_with_eoc {
    label: "Courses with End-of-Course Assessment"
    type: count_distinct
    sql: ${course_id} ;;
    filters: [has_end_of_course_assessment: "yes"]
  }
  measure: eoc_coverage {
    label: "End-of-Course Assessment Coverage"
    type: number
    sql: SAFE_DIVIDE(${courses_with_eoc}, ${course_count}) ;;
    value_format_name: percent_0
  }
  measure: beginner_courses {
    label: "Beginner"
    type: count_distinct
    sql: ${course_id} ;;
    filters: [difficulty_level: "Beginner"]
  }
  measure: intermediate_courses {
    label: "Intermediate"
    type: count_distinct
    sql: ${course_id} ;;
    filters: [difficulty_level: "Intermediate"]
  }
  measure: advanced_courses {
    label: "Advanced"
    type: count_distinct
    sql: ${course_id} ;;
    filters: [difficulty_level: "Advanced"]
  }

  # ---------------- Enrolment / completion ----------------
  measure: enrolments {
    label: "Total Enrollment"
    type: sum
    sql: ${TABLE}.enrolments ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  }
  measure: enrolments_exact {
    label: "Enrolments"
    type: sum
    sql: ${TABLE}.enrolments ;;
    value_format_name: decimal_0
  }
  measure: completions {
    label: "Total Completions"
    type: sum
    sql: ${TABLE}.completions ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  }
  measure: completions_exact {
    label: "Completions"
    type: sum
    sql: ${TABLE}.completions ;;
    value_format_name: decimal_0
  }
  measure: completion_rate {
    label: "Completion Rate"
    type: number
    sql: SAFE_DIVIDE(${completions}, ${enrolments}) ;;
    value_format_name: percent_0
  }
  measure: learning_hours {
    type: sum
    sql: ${TABLE}.learning_hours ;;
    value_format_name: decimal_0
  }

  # ---------------- Assessment ----------------
  measure: assessed_users { type: sum sql: ${TABLE}.assessed_users ;; value_format_name: decimal_0 }
  measure: passed_users   { type: sum sql: ${TABLE}.passed_users ;;   value_format_name: decimal_0 }
  measure: passed_first_attempt_users {
    type: sum
    sql: ${TABLE}.passed_first_attempt_users ;;
    value_format_name: decimal_0
  }
  measure: pass_rate {
    label: "Overall Pass Rate"
    type: number
    sql: SAFE_DIVIDE(${passed_users}, ${assessed_users}) ;;
    value_format_name: percent_0
  }
  measure: first_attempt_pass_rate {
    type: number
    sql: SAFE_DIVIDE(${passed_first_attempt_users}, ${assessed_users}) ;;
    value_format_name: percent_0
  }
  measure: avg_content_rating {
    label: "Average Content Rating"
    type: average
    sql: ${content_rating} ;;
    value_format_name: decimal_2
  }

  # ---------------- CBP (assigned) ----------------
  measure: cbp_allocations { type: sum sql: ${TABLE}.cbp_allocations ;; value_format_name: decimal_0 }
  measure: cbp_completions { type: sum sql: ${TABLE}.cbp_completions ;; value_format_name: decimal_0 }
  measure: assigned_completion_rate {
    type: number
    sql: SAFE_DIVIDE(${cbp_completions}, ${cbp_allocations}) ;;
    value_format_name: percent_0
  }

  set: course_detail {
    fields: [course_name, course_id, content_provider_name, pillar_list, theme_list,
             sub_theme_list, eoc_yn, content_rating]
  }
}
