view: fct_cbp_assignment {
  sql_table_name: `prj-kb-prd-looker-gcp-1014.citizen_centricity.fct_cbp_assignment` ;;

  dimension: assignment_key { primary_key: yes hidden: yes sql: ${TABLE}.assignment_key ;; }
  dimension: user_id { hidden: yes sql: ${TABLE}.user_id ;; }
  dimension: course_id { label: "Course ID" sql: ${TABLE}.course_id ;; }
  dimension: cb_plan_id { label: "CBP ID" sql: ${TABLE}.cb_plan_id ;; }
  dimension: plan_name { label: "CBP Name" sql: ${TABLE}.plan_name ;; }
  dimension: centre_state { hidden: yes sql: ${TABLE}.centre_state ;; }
  dimension: cbp_scope {
    label: "Union / State"
    type: string
    sql: ${TABLE}.cbp_scope ;;
  }
  dimension: ministry {
    label: "Ministry"
    type: string
    sql: ${TABLE}.ministry ;;
  }
  dimension: department { type: string sql: ${TABLE}.department ;; }
  dimension: mdo_name { label: "MDO" type: string sql: ${TABLE}.mdo_name ;; }
  dimension: is_apar { type: yesno sql: ${TABLE}.is_apar ;; }
  dimension: is_completed { type: yesno sql: ${TABLE}.is_completed = 1 ;; }

  # For State CBPs, myigot.ministry holds the State name (PUNJAB, GOA ...).
  # Normalised to the "st_nm" values in maps/india_states.topojson, which uses
  # full words ("Jammu and Kashmir", "Andaman and Nicobar Islands", "Delhi").
  # INITCAP would give "Jammu And Kashmir", so the connectives are lower-cased back.
  dimension: state_name {
    label: "State"
    type: string
    map_layer_name: india_states
    sql: CASE UPPER(TRIM(${TABLE}.ministry))
           WHEN 'NCT OF DELHI'          THEN 'Delhi'
           WHEN 'DELHI NCT'             THEN 'Delhi'
           WHEN 'NEW DELHI'             THEN 'Delhi'
           WHEN 'ORISSA'                THEN 'Odisha'
           WHEN 'PONDICHERRY'           THEN 'Puducherry'
           WHEN 'UTTARANCHAL'           THEN 'Uttarakhand'
           WHEN 'ANDAMAN & NICOBAR ISLANDS' THEN 'Andaman and Nicobar Islands'
           WHEN 'JAMMU & KASHMIR'       THEN 'Jammu and Kashmir'
           WHEN 'DAMAN AND DIU'         THEN 'Dadra and Nagar Haveli and Daman and Diu'
           WHEN 'DADRA AND NAGAR HAVELI' THEN 'Dadra and Nagar Haveli and Daman and Diu'
           ELSE REGEXP_REPLACE(
                  REGEXP_REPLACE(INITCAP(LOWER(TRIM(${TABLE}.ministry))), r'\bAnd\b', 'and'),
                  r'\bOf\b', 'of')
         END ;;
  }

  dimension_group: allocated {
    type: time
    timeframes: [raw, date, week, month, year]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.allocated_date ;;
  }
  dimension_group: completed {
    type: time
    timeframes: [raw, date, month, year]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.completed_date ;;
  }

  measure: allocations {
    label: "Allocations"
    type: count
    value_format_name: decimal_0
  }
  measure: allocations_short {
    label: "Total No. of Assigned Officials"
    description: "Allocation count (user x course x CBP). Distinct people = assigned_officials."
    type: count
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  }
  measure: assigned_officials {
    label: "Distinct Assigned Officials"
    type: count_distinct
    sql: ${user_id} ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  }
  measure: completions {
    label: "Completions"
    type: sum
    sql: ${TABLE}.is_completed ;;
    value_format_name: decimal_0
  }
  measure: completion_rate {
    label: "Completion rate"
    type: number
    sql: SAFE_DIVIDE(${completions}, ${allocations}) ;;
    value_format_name: percent_0
  }
  measure: courses {
    label: "Courses"
    type: count_distinct
    sql: ${course_id} ;;
  }
  measure: cbps { label: "CBPs" type: count_distinct sql: ${cb_plan_id} ;; }
  measure: ministries { type: count_distinct sql: ${ministry} ;; }
}
