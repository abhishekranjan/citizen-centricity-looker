---
- dashboard: cc_difficulty_by_subtheme
  title: Citizen Centricity – Course Difficulty by Sub-Theme
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
    - cc_ui.go_back_coverage
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
  - name: difficulty_subtheme
    title: Course Difficulty by Sub-Theme
    model: citizen_centricity
    explore: rpt_pillar_subtheme
    type: looker_grid
    fields:
    - rpt_pillar_subtheme.pillar
    - rpt_pillar_subtheme.theme
    - rpt_pillar_subtheme.sub_theme
    - rpt_pillar_subtheme.total_courses
    - rpt_pillar_subtheme.beginner_courses
    - rpt_pillar_subtheme.intermediate_courses
    - rpt_pillar_subtheme.advanced_courses
    filters:
      rpt_pillar_subtheme.courses_dim: '>0'
    sorts:
    - rpt_pillar_subtheme.total_courses desc
    limit: 500
    show_row_numbers: true
    hide_totals: true
    show_totals: false
    enable_conditional_formatting: false
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
    header_font_size: '13'
    rows_font_size: '13'
    header_font_color: '#0B3A75'
    header_background_color: '#E3F2FD'
    show_row_totals: false
    row: 3
    col: 0
    width: 24
    height: 16
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
    row: 19
    col: 0
    width: 24
    height: 1
