---
- dashboard: cc_data_gaps
  title: Citizen Centricity – Data Gaps
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: false
  description: Citizen Centricity KRA Dashboard – Domain
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
    show_row_numbers: false
    hide_totals: true
    show_totals: false
    enable_conditional_formatting: false
    hidden_fields:
    - seed_data_gaps.sort_order
    show_view_names: false
    transpose: false
    truncate_text: false
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
