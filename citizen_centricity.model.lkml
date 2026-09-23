# =====================================================================
# citizen_centricity.model.lkml
# Connection name as configured in Looker Admin > Connections
# =====================================================================
connection: "prj-kb-prd-looker-gcp-1014"

include: "/views/*.view.lkml"
include: "/views/ui/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

label: "Citizen Centricity KRA"

# Cache is invalidated whenever any citizen_centricity table is rebuilt.
datagroup: cc_daily {
  sql_trigger: SELECT MAX(last_modified_time)
               FROM `prj-kb-prd-looker-gcp-1014.citizen_centricity.__TABLES__` ;;
  max_cache_age: "24 hours"
}
persist_with: cc_daily

# India state boundaries for the Learning-tab choropleth.
# Upload the TopoJSON to /maps/ in this project. property_key must be the
# state-name property inside the file (datameet India files use "st_nm").
map_layer: india_states {
  file: "/maps/india_states.topojson"
  property_key: "st_nm"
  format: topojson
}

# ---------------------------------------------------------------------
# Course grain (Exec Summary reach, Coverage, Performance, Course List)
# Bridges fan out; symmetric aggregates keep course-level SUMs correct.
# ---------------------------------------------------------------------
explore: fct_course {
  label: "CC – Courses"
  join: brg_course_pillar {
    type: left_outer
    relationship: one_to_many
    sql_on: ${fct_course.course_id} = ${brg_course_pillar.course_id} ;;
  }
  join: brg_course_subtheme {
    type: left_outer
    relationship: one_to_many
    sql_on: ${fct_course.course_id} = ${brg_course_subtheme.course_id} ;;
  }
}

explore: rpt_pillar_subtheme {
  label: "CC – Pillar x Theme x Sub-Theme"
}

explore: rpt_pillar_score {
  label: "CC – Pillar Composite Score"
}

explore: rpt_taxonomy_coverage {
  label: "CC – Taxonomy Coverage"
}

# ---------------------------------------------------------------------
# User x course (Learning tab: groups, officials, date filter)
# ---------------------------------------------------------------------
explore: fct_user_course {
  label: "CC – Learner Enrolments"
  join: brg_course_pillar {
    type: left_outer
    relationship: many_to_many
    sql_on: ${fct_user_course.course_id} = ${brg_course_pillar.course_id} ;;
  }
}

# ---------------------------------------------------------------------
# User x course x CBP (Adoption tab, MDO / State learning)
# ---------------------------------------------------------------------
explore: fct_cbp_assignment {
  label: "CC – CBP Assignments"
  join: brg_course_pillar {
    type: left_outer
    relationship: many_to_many
    sql_on: ${fct_cbp_assignment.course_id} = ${brg_course_pillar.course_id} ;;
  }
}

explore: seed_data_gaps {
  label: "CC – Data Gaps"
}

explore: assessment_maturity {
  label: "CC – Assessment Maturity"
}
# ---------------------------------------------------------------------
# UI helper (static HTML tiles: header, question bars, pills, footer).
# Hidden from the Explore menu; used only by dashboard tiles.
# ---------------------------------------------------------------------
explore: cc_ui {
  hidden: yes
  label: "CC – UI helper"
}
