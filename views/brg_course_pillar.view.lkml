view: brg_course_pillar {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.brg_course_pillar` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.course_id, '|', ${TABLE}.pillar) ;;
  }
  dimension: course_id {
    hidden: yes
    sql: ${TABLE}.course_id ;;
  }
  dimension: pillar {
    type: string
    sql: ${TABLE}.pillar ;;
    order_by_field: pillar_sort
  }
  dimension: pillar_sort {
    hidden: yes
    type: number
    sql: CASE ${TABLE}.pillar WHEN 'Service Knowledge' THEN 1 WHEN 'Responsiveness' THEN 2
         WHEN 'Transparency' THEN 3 WHEN 'Participation' THEN 4 ELSE 9 END ;;
  }
}
