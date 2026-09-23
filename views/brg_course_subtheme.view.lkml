view: brg_course_subtheme {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.brg_course_subtheme` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.course_id, '|', ${TABLE}.theme, '|', ${TABLE}.sub_theme) ;;
  }
  dimension: course_id { hidden: yes sql: ${TABLE}.course_id ;; }
  dimension: theme { type: string sql: ${TABLE}.theme ;; }
  dimension: sub_theme { label: "Sub-Theme" type: string sql: ${TABLE}.sub_theme ;; }
  dimension: theme_type { label: "Theme Type (B&F / Domain)" type: string sql: ${TABLE}.theme_type ;; }
  dimension: competency_area { type: string sql: ${TABLE}.competency_area ;; }

  measure: sub_theme_count {
    label: "Sub-Themes"
    type: count_distinct
    sql: CONCAT(${theme}, '|', ${sub_theme}) ;;
  }
}
