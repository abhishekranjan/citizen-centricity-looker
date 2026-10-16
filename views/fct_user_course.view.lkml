view: fct_user_course {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.fct_user_course` ;;

  dimension: user_course_key { primary_key: yes hidden: yes sql: ${TABLE}.user_course_key ;; }
  dimension: user_id { hidden: yes sql: ${TABLE}.user_id ;; }
  dimension: course_id { hidden: yes sql: ${TABLE}.course_id ;; }
  dimension: primary_group {
    label: "Group"
    type: string
    sql: ${TABLE}.primary_group ;;
  }
  dimension: all_groups { type: string sql: ${TABLE}.all_groups ;; }
  dimension: gender { type: string sql: ${TABLE}.gender ;; }
  dimension: mdo_name { label: "MDO" type: string sql: ${TABLE}.mdo_name ;; }
  dimension: ministry { type: string sql: ${TABLE}.ministry ;; }
  dimension: department { type: string sql: ${TABLE}.department ;; }
  dimension: centre_state { label: "Centre / State" type: string sql: ${TABLE}.centre_state ;; }
  dimension: is_completed { type: yesno sql: ${TABLE}.is_completed = 1 ;; }

  dimension_group: enrolled {
    type: time
    timeframes: [raw, date, week, month, year]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.enrolled_date ;;
  }
  dimension_group: completed {
    type: time
    timeframes: [raw, date, week, month, year]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.completed_date ;;
  }

  measure: officials {
    label: "Officials"
    type: count_distinct
    sql: ${user_id} ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  }
  measure: enrolments {
    type: count
    value_format_name: decimal_0
  }
  measure: completions {
    label: "Completions"
    type: sum
    sql: ${TABLE}.is_completed ;;
    value_format_name: decimal_0
  }
  measure: completion_rate {
    type: number
    sql: SAFE_DIVIDE(${completions}, ${enrolments}) ;;
    value_format_name: percent_0
  }
}
