# Coverage tab – "Maturity of Assessment Framework". Competency Assessment and
# Levelled progression are aspirational (0%) until data exists.
view: assessment_maturity {
  derived_table: {
    # datagroup_trigger: cc_daily
    sql:
      SELECT 1 AS sort_order, 'End of course assesment' AS stage,
             SAFE_DIVIDE(COUNTIF(has_end_of_course_assessment = 1), COUNT(*)) AS pct
      FROM `prj-kb-prd-looker-gcp-1014.citizen_centricity.fct_course`
      UNION ALL SELECT 2, 'Competency Assessment', 0
      UNION ALL SELECT 3, 'Leveled progression', 0 ;;
  }
  dimension: sort_order { primary_key: yes hidden: yes type: number sql: ${TABLE}.sort_order ;; }
  dimension: stage {
    type: string
    sql: ${TABLE}.stage ;;
    order_by_field: sort_order
  }
  measure: pct {
    label: "Courses"
    type: max
    sql: ${TABLE}.pct ;;
    value_format_name: percent_0
  }
}
