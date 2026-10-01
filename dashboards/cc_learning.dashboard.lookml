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
  - name: header
    title: header
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.header_learning
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
  - name: q_learning
    title: q_learning
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_learning
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
    width: 24
    height: 1
  - name: strip_groups
    title: strip_groups
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_group_distribution
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 3
    col: 0
    width: 12
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
    show_row_numbers: false
    hide_totals: false
    show_totals: true
    enable_conditional_formatting: false
    column_order:
    - fct_user_course.primary_group
    - fct_user_course.officials
    - pct_officials
    - fct_user_course.completions
    - pct_completions
    listen:
      Date Range: fct_user_course.completed_date
      Group: fct_user_course.primary_group
    show_view_names: false
    transpose: false
    truncate_text: true
    hide_row_totals: true
    size_to_fit: true
    series_labels:
      fct_user_course.primary_group: Group
      fct_user_course.officials: Officials
      fct_user_course.completions: Completions
    table_theme: white
    limit_displayed_rows: false
    series_text_format:
      fct_user_course.officials:
        align: center
      fct_user_course.completions:
        align: center
      pct_officials:
        align: center
      pct_completions:
        align: center
    header_text_alignment: center
    header_font_size: '16'
    rows_font_size: '15'
    header_font_color: '#0B3A75'
    header_background_color: '#E3F2FD'
    show_row_totals: false
    title_hidden: true
    row: 4
    col: 0
    width: 12
    height: 5
  - name: strip_functional_family
    title: strip_functional_family
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_asp_functional_family
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 3
    col: 12
    width: 12
    height: 1
  - name: functional_family
    title: functional_family
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.asp_functional_family
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 4
    col: 12
    width: 12
    height: 5
  - name: strip_pillar_group
    title: strip_pillar_group
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_pillar_group
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 9
    col: 0
    width: 12
    height: 1
  - name: pillar_group
    title: Pillar wise completion of Groups
    model: citizen_centricity
    explore: fct_user_course
    type: looker_bar
    column_spacing_ratio: 0.55
    fields:
    - brg_course_pillar.pillar
    - fct_user_course.completions
    filters:
      brg_course_pillar.pillar: -NULL
    sorts:
    - fct_user_course.completions desc
    limit: 500
    show_legend: false
    series_colors:
      fct_user_course.completions: '#0B3A75'
    listen:
      Date Range: fct_user_course.completed_date
      Group: fct_user_course.primary_group
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    x_axis_label_font_size: 12
    font_size: '12'
    title_hidden: true
    row: 10
    col: 0
    width: 12
    height: 6
  - name: strip_learning
    title: strip_learning
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_learning_mdo
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 9
    col: 12
    width: 12
    height: 1
    listen:
      Date Range: cc_ui.date_range
      Group: cc_ui.group
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
    show_row_numbers: false
    hide_totals: false
    show_totals: true
    enable_conditional_formatting: false
    listen:
      Date Range: fct_cbp_assignment.allocated_date
    show_view_names: false
    transpose: false
    truncate_text: true
    hide_row_totals: true
    size_to_fit: true
    series_labels:
      fct_cbp_assignment.ministry: Ministry
      fct_cbp_assignment.allocations: Allocations
      fct_cbp_assignment.completions: Completions
    table_theme: white
    limit_displayed_rows: false
    series_text_format:
      fct_cbp_assignment.allocations:
        align: center
      fct_cbp_assignment.completions:
        align: center
    header_text_alignment: center
    header_font_size: '16'
    rows_font_size: '15'
    header_font_color: '#0B3A75'
    header_background_color: '#E3F2FD'
    show_row_totals: false
    title_hidden: true
    row: 10
    col: 12
    width: 12
    height: 6
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
    row: 16
    col: 0
    width: 24
    height: 1
