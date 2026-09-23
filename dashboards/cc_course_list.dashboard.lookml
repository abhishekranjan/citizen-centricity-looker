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
  - name: nav
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Key Result Area: Citizen-Centricity

      [Executive Summary](/dashboards/citizen_centricity::cc_executive_summary)  |  [Coverage](/dashboards/citizen_centricity::cc_coverage)  |  [Adoption](/dashboards/citizen_centricity::cc_adoption)  |  [Learning](/dashboards/citizen_centricity::cc_learning)  |  [Performance](/dashboards/citizen_centricity::cc_performance)


      [← Go Back](/dashboards/citizen_centricity::cc_executive_summary)'
    row: 0
    col: 0
    width: 24
    height: 3
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
    listen:
      Pillar: brg_course_pillar.pillar
      Course Provider: fct_course.content_provider_name
    row: 3
    col: 0
    width: 24
    height: 18
