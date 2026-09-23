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
  - name: header
    title: header
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.header_plain
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 0
    width: 24
    height: 2
  - name: go_back
    title: go_back
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.go_back_adoption
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 2
    col: 0
    width: 6
    height: 1
  - name: ministry_table
    title: CBP Adoption by Ministry / State
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
    show_row_numbers: false
    hide_totals: true
    show_totals: false
    enable_conditional_formatting: false
    series_cell_visualizations:
      fct_cbp_assignment.completion_rate:
        is_active: true
        palette:
          palette_id: cc-lime
          collection_id: custom
          custom_colors:
          - '#B5C763'
          - '#B5C763'
    listen:
      Union / State: fct_cbp_assignment.cbp_scope
      Pillar: brg_course_pillar.pillar
    show_view_names: false
    transpose: false
    truncate_text: true
    hide_row_totals: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '15'
    rows_font_size: '15'
    header_font_color: '#0B3A75'
    header_background_color: '#E3F2FD'
    show_row_totals: false
    title_hidden: true
    row: 3
    col: 0
    width: 24
    height: 18
  - name: footer
    title: footer
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.footer_last_updated
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 21
    col: 0
    width: 24
    height: 1
