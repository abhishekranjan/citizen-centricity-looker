---
- dashboard: cc_data_gaps
  title: Citizen Centricity – Data Gaps
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: false
  description: Citizen Centricity KRA Dashboard – Domain
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
  - name: data_gaps
    title: Data Gaps
    model: citizen_centricity
    explore: seed_data_gaps
    type: looker_grid
    fields:
    - seed_data_gaps.status
    - seed_data_gaps.indicator
    - seed_data_gaps.description
    - seed_data_gaps.data_source
    - seed_data_gaps.next_step
    - seed_data_gaps.sort_order
    sorts:
    - seed_data_gaps.status
    - seed_data_gaps.sort_order
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
    row: 3
    col: 0
    width: 24
    height: 16
    hidden_fields:
    - seed_data_gaps.sort_order
