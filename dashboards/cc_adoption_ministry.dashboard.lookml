---
- dashboard: cc_adoption_ministry
  title: Citizen Centricity – CBP Adoption by Ministry / State
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: false
  description: Citizen Centricity KRA Dashboard – Domain
  filters:
  - name: Union / State
    title: Union / State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: citizen_centricity
    explore: fct_cbp_assignment
    listens_to_filters: []
    field: fct_cbp_assignment.cbp_scope
  - name: Pillar
    title: Pillar
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: citizen_centricity
    explore: fct_cbp_assignment
    listens_to_filters: []
    field: brg_course_pillar.pillar
  elements:
  - name: nav
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Key Result Area: Citizen-Centricity

      [Executive Summary](/dashboards/citizen_centricity::cc_executive_summary)  |  [Coverage](/dashboards/citizen_centricity::cc_coverage)  |  [Adoption](/dashboards/citizen_centricity::cc_adoption)  |  [Learning](/dashboards/citizen_centricity::cc_learning)  |  [Performance](/dashboards/citizen_centricity::cc_performance)


      [← Go Back](/dashboards/citizen_centricity::cc_adoption)'
    row: 0
    col: 0
    width: 24
    height: 3
  - name: ministry_table
    title: ''
    model: citizen_centricity
    explore: fct_cbp_assignment
    type: looker_grid
    fields:
    - fct_cbp_assignment.ministry
    - fct_cbp_assignment.courses
    - fct_cbp_assignment.allocations
    - fct_cbp_assignment.completions
    - fct_cbp_assignment.completion_rate
    sorts:
    - fct_cbp_assignment.courses desc
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: true
    hide_row_totals: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_totals: false
    show_row_totals: false
    series_cell_visualizations:
      fct_cbp_assignment.completion_rate:
        is_active: true
    listen:
      Union / State: fct_cbp_assignment.cbp_scope
      Pillar: brg_course_pillar.pillar
    row: 3
    col: 0
    width: 24
    height: 18
