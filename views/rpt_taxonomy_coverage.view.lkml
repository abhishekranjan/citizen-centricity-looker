view: rpt_taxonomy_coverage {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.rpt_taxonomy_coverage` ;;

  dimension: pk { primary_key: yes hidden: yes sql: CONCAT(${TABLE}.theme, '|', ${TABLE}.sub_theme) ;; }
  dimension: theme { type: string sql: ${TABLE}.theme ;; }
  dimension: sub_theme { label: "Sub-Theme" type: string sql: ${TABLE}.sub_theme ;; }
  # theme_type in the source tables reads 'B&F' on every row, so the Domain
  # tiles matched nothing and the B&F tiles swept up all 16 themes. The real
  # split lives in competency_area: Domain = 10 themes; Functional (1) +
  # Behavioural (5) = the 6 B&F themes. Derived here until the pipeline is
  # fixed upstream; delete the CASE and read the column once it is.
  dimension: theme_type {
    type: string
    sql: CASE WHEN ${TABLE}.competency_area = 'Domain' THEN 'Domain' ELSE 'B&F' END ;;
  }
  dimension: theme_type_raw { hidden: yes type: string sql: ${TABLE}.theme_type ;; }
  dimension: competency_area { type: string sql: ${TABLE}.competency_area ;; }
  dimension: is_covered { type: yesno sql: ${TABLE}.is_covered ;; }

  measure: themes_total_bf   { type: count_distinct sql: ${theme} ;; filters: [theme_type: "B&F"] }
  measure: themes_covered_bf { type: count_distinct sql: ${theme} ;; filters: [theme_type: "B&F", is_covered: "yes"] }
  measure: themes_total_domain   { type: count_distinct sql: ${theme} ;; filters: [theme_type: "Domain"] }
  measure: themes_covered_domain { type: count_distinct sql: ${theme} ;; filters: [theme_type: "Domain", is_covered: "yes"] }
  measure: subthemes_total_bf   { type: count_distinct sql: ${pk} ;; filters: [theme_type: "B&F"] }
  measure: subthemes_covered_bf { type: count_distinct sql: ${pk} ;; filters: [theme_type: "B&F", is_covered: "yes"] }
  measure: subthemes_total_domain   { type: count_distinct sql: ${pk} ;; filters: [theme_type: "Domain"] }
  measure: subthemes_covered_domain { type: count_distinct sql: ${pk} ;; filters: [theme_type: "Domain", is_covered: "yes"] }
  measure: subthemes_total_all   { type: count_distinct sql: ${pk} ;; }
  measure: subthemes_covered_all { type: count_distinct sql: ${pk} ;; filters: [is_covered: "yes"] }

  # "x/y" labels for the Exec Summary tiles
  measure: themes_bf_label {
    label: "Themes Covered – B&F"
    type: string
    sql: CONCAT(CAST(${themes_covered_bf} AS STRING), '/', CAST(${themes_total_bf} AS STRING)) ;;
  }
  measure: themes_domain_label {
    label: "Themes Covered – Domain"
    type: string
    sql: CONCAT(CAST(${themes_covered_domain} AS STRING), '/', CAST(${themes_total_domain} AS STRING)) ;;
  }
  measure: subthemes_bf_label {
    label: "Sub-Themes Covered – B&F"
    type: string
    sql: CONCAT(CAST(${subthemes_covered_bf} AS STRING), '/', CAST(${subthemes_total_bf} AS STRING)) ;;
  }
  # Not on any tile: the Exec Summary "Domain" figure uses subthemes_all_label
  # (84/107, all sub-themes) as the original dashboard does. This measure is
  # the true Domain-only count, kept for Explore use.
  measure: subthemes_domain_label {
    label: "Sub-Themes Covered – Domain only"
    type: string
    sql: CONCAT(CAST(${subthemes_covered_domain} AS STRING), '/', CAST(${subthemes_total_domain} AS STRING)) ;;
  }
  measure: subthemes_all_label {
    label: "Sub-Themes Covered – All"
    description: "Every sub-theme, both B&F and Domain (84/107). The Exec Summary tile shows this under the heading 'Domain' - confirmed intended, matching the original dashboard."
    type: string
    sql: CONCAT(CAST(${subthemes_covered_all} AS STRING), '/', CAST(${subthemes_total_all} AS STRING)) ;;
  }
}
