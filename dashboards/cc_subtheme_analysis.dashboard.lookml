---
- dashboard: cc_subtheme_analysis
  title: Citizen Centricity – Pillar / Theme / Sub-Theme Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: false
  description: Citizen Centricity KRA Dashboard – Domain
  filters:
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
    explore: rpt_pillar_subtheme
    listens_to_filters: []
    field: rpt_pillar_subtheme.pillar
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
    - cc_ui.go_back_executive_summary
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
  - name: subtheme_table
    title: Pillar / Theme / Sub-Theme
    model: citizen_centricity
    explore: rpt_pillar_subtheme
    type: looker_grid
    fields:
    - rpt_pillar_subtheme.pillar
    - rpt_pillar_subtheme.theme
    - rpt_pillar_subtheme.sub_theme
    - rpt_pillar_subtheme.completions
    - rpt_pillar_subtheme.enrolments
    - rpt_pillar_subtheme.total_courses
    - rpt_pillar_subtheme.completion_rate
    - rpt_pillar_subtheme.assessment_passed_pct
    filters:
      rpt_pillar_subtheme.courses_dim: '>0'
    sorts:
    - rpt_pillar_subtheme.pillar
    - rpt_pillar_subtheme.theme
    - rpt_pillar_subtheme.sub_theme
    limit: 500
    show_row_numbers: false
    hide_totals: true
    show_totals: false
    enable_conditional_formatting: false
    series_labels:
      rpt_pillar_subtheme.sub_theme: Sub_Theme
      rpt_pillar_subtheme.total_courses: Courses
      rpt_pillar_subtheme.completion_rate: Completion Rate (%)
      rpt_pillar_subtheme.assessment_passed_pct: Assessment Passed (%)
    series_cell_visualizations:
      rpt_pillar_subtheme.assessment_passed_pct:
        is_active: true
        palette:
          palette_id: cc-lime
          collection_id: custom
          custom_colors:
          - '#B5C763'
          - '#B5C763'
    listen:
      Pillar: rpt_pillar_subtheme.pillar
    show_view_names: false
    transpose: false
    truncate_text: true
    hide_row_totals: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '14'
    header_font_color: '#0B3A75'
    header_background_color: '#E3F2FD'
    show_row_totals: false
    title_hidden: true
    row: 3
    col: 0
    width: 24
    height: 12
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
    row: 15
    col: 0
    width: 24
    height: 1
