---
- dashboard: cc_course_list
  title: Citizen Centricity – Course List
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
    explore: fct_course
    listens_to_filters: []
    field: brg_course_pillar.pillar
  - name: Course Provider
    title: Course Provider
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: citizen_centricity
    explore: fct_course
    listens_to_filters: []
    field: fct_course.content_provider_name
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
  - name: course_list
    title: Course List
    model: citizen_centricity
    explore: fct_course
    type: looker_grid
    fields:
    - fct_course.course_name
    - fct_course.course_id
    - fct_course.content_provider_name
    - fct_course.pillar_list
    - fct_course.theme_list
    - fct_course.sub_theme_list
    - fct_course.eoc_yn
    - fct_course.content_rating
    sorts:
    - fct_course.course_name
    limit: 1000
    show_row_numbers: false
    hide_totals: true
    show_totals: false
    enable_conditional_formatting: false
    listen:
      Pillar: brg_course_pillar.pillar
      Course Provider: fct_course.content_provider_name
    show_view_names: false
    transpose: false
    truncate_text: false
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
