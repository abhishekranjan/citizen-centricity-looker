---
- dashboard: cc_learning
  title: Citizen Centricity – Learning
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: false
  description: Citizen Centricity KRA Dashboard – Domain
  filters:
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
  - name: Group
    title: Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: citizen_centricity
    explore: fct_user_course
    listens_to_filters: []
    field: fct_user_course.primary_group
  elements:
  - name: nav
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Key Result Area: Citizen-Centricity

      [Executive Summary](/dashboards/citizen_centricity::cc_executive_summary)  |  [Coverage](/dashboards/citizen_centricity::cc_coverage)  |  [Adoption](/dashboards/citizen_centricity::cc_adoption)  |  **Learning**  |  [Performance](/dashboards/citizen_centricity::cc_performance)'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: hdr_learn
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### Are the right officials building capacity?'
    row: 2
    col: 0
    width: 24
    height: 1
  - name: group_table
    title: Group-wise Distribution and Completions
    model: citizen_centricity
    explore: fct_user_course
    type: looker_grid
    fields:
    - fct_user_course.primary_group
    - fct_user_course.officials
    - fct_user_course.completions
    sorts:
    - fct_user_course.primary_group
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: pct_officials
      label: Number of officials
      expression: ${fct_user_course.officials}/sum(${fct_user_course.officials})
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: pct_completions
      label: '% of Completions'
      expression: ${fct_user_course.completions}/sum(${fct_user_course.completions})
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_totals: true
    show_row_totals: false
    series_labels:
      fct_user_course.primary_group: Group
      fct_user_course.officials: Officials
    listen:
      Date Range: fct_user_course.completed_date
    row: 3
    col: 0
    width: 12
    height: 7
    column_order:
    - fct_user_course.primary_group
    - fct_user_course.officials
    - pct_officials
    - fct_user_course.completions
    - pct_completions
  - name: functional_family
    type: text
    title_text: Distribution by Functional Family and Gender
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      Decision Makers · Frontline Staff · Supervisory Roles · Programme Leadership · Policy Leadership


      *Available once functional family fields are tagged in iGOT learner profiles.*'
    row: 3
    col: 12
    width: 12
    height: 7
  - name: pillar_group
    title: Pillar wise completion of Groups
    model: citizen_centricity
    explore: fct_user_course
    type: looker_bar
    fields:
    - brg_course_pillar.pillar
    - fct_user_course.completions
    filters:
      brg_course_pillar.pillar: -NULL
    sorts:
    - fct_user_course.completions desc
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    show_value_labels: true
    label_density: 25
    legend_position: center
    show_legend: false
    stacking: ''
    ordering: none
    show_null_labels: false
    limit_displayed_rows: false
    plot_size_by_field: false
    point_style: none
    series_colors:
      fct_user_course.completions: '#0B3A75'
    listen:
      Date Range: fct_user_course.completed_date
      Group: fct_user_course.primary_group
    row: 10
    col: 0
    width: 12
    height: 9
  - name: mdo_table
    title: Learning across MDOs and States – MDO
    model: citizen_centricity
    explore: fct_cbp_assignment
    type: looker_grid
    fields:
    - fct_cbp_assignment.ministry
    - fct_cbp_assignment.allocations
    - fct_cbp_assignment.completions
    filters:
      fct_cbp_assignment.cbp_scope: Union
    sorts:
    - fct_cbp_assignment.completions desc
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_totals: true
    show_row_totals: false
    listen:
      Date Range: fct_cbp_assignment.allocated_date
    row: 10
    col: 12
    width: 12
    height: 9
  - name: state_map
    title: Learning across MDOs and States – State
    model: citizen_centricity
    explore: fct_cbp_assignment
    type: looker_geo_choropleth
    fields:
    - fct_cbp_assignment.state_name
    - fct_cbp_assignment.completions
    filters:
      fct_cbp_assignment.cbp_scope: State
    sorts:
    - fct_cbp_assignment.completions desc
    limit: 500
    map: auto
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    colors:
    - '#2196F3'
    - '#4CAF50'
    - '#1B5E20'
    map_latitude: 22.5
    map_longitude: 80.0
    map_zoom: 4
    listen:
      Date Range: fct_cbp_assignment.allocated_date
    row: 19
    col: 12
    width: 12
    height: 10
  - name: state_table
    title: States – Allocations & Completions
    model: citizen_centricity
    explore: fct_cbp_assignment
    type: looker_grid
    fields:
    - fct_cbp_assignment.ministry
    - fct_cbp_assignment.allocations
    - fct_cbp_assignment.completions
    filters:
      fct_cbp_assignment.cbp_scope: State
    sorts:
    - fct_cbp_assignment.completions desc
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_totals: true
    show_row_totals: false
    series_labels:
      fct_cbp_assignment.ministry: State
    listen:
      Date Range: fct_cbp_assignment.allocated_date
    row: 19
    col: 0
    width: 12
    height: 10
