view: seed_data_gaps {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.seed_data_gaps` ;;

  dimension: sort_order { primary_key: yes type: number sql: ${TABLE}.sort_order ;; }
  dimension: status { type: string sql: ${TABLE}.status ;; }
  dimension: indicator { type: string sql: ${TABLE}.indicator ;; }
  dimension: description { type: string sql: ${TABLE}.description ;; }
  dimension: data_source { type: string sql: ${TABLE}.data_source ;; }
  dimension: next_step { label: "Next Step / Data Requirement" type: string sql: ${TABLE}.next_step ;; }

  measure: indicator_count { label: "Indicators" type: count }
}
