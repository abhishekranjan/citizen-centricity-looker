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
  - name: nav
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Key Result Area: Citizen-Centricity

      [Executive Summary](/dashboards/citizen_centricity::cc_executive_summary)  |  [Coverage](/dashboards/citizen_centricity::cc_coverage)  |  [Adoption](/dashboards/citizen_centricity::cc_adoption)  |  [Learning](/dashboards/citizen_centricity::cc_learning)  |  [Performance](/dashboards/citizen_centricity::cc_performance)


      [← Go Back](/dashboards/citizen_centricity::cc_coverage)'
    row: 0
    col: 0
    width: 24
    height: 3
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
    show_view_names: false
    show_row_numbers: true
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
      Pillar: rpt_pillar_subtheme.pillar
    row: 3
    col: 0
    width: 24
    height: 16
