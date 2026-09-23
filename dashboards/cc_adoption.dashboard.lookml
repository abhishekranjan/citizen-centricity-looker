---
- dashboard: cc_adoption
  title: Citizen Centricity – Adoption
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

      [Executive Summary](/dashboards/citizen_centricity::cc_executive_summary)  |  [Coverage](/dashboards/citizen_centricity::cc_coverage)  |  **Adoption**  |  [Learning](/dashboards/citizen_centricity::cc_learning)  |  [Performance](/dashboards/citizen_centricity::cc_performance)'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: hdr_adopt
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### Are MDOs formally taking up citizen-centric learning?'
    row: 2
    col: 0
    width: 24
    height: 1
  - name: assigned_officials
    title: Total No. of Assigned Officials
    model: citizen_centricity
    explore: fct_cbp_assignment
    type: single_value
    fields:
    - fct_cbp_assignment.allocations_short
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total No. of Assigned Officials
    show_comparison: false
    enable_conditional_formatting: false
    row: 3
    col: 0
    width: 6
    height: 4
  - name: assigned_cr
    title: Assigned Completion Rate
    model: citizen_centricity
    explore: fct_cbp_assignment
    type: single_value
    fields:
    - fct_cbp_assignment.completion_rate
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Assigned Completion Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 7
    col: 0
    width: 6
    height: 4
  - name: cbp_coverage
    title: CBP Coverage
    model: citizen_centricity
    explore: rpt_pillar_score
    type: looker_bar
    fields:
    - rpt_pillar_score.pillar
    - rpt_pillar_score.union_ministries
    - rpt_pillar_score.state_ministries
    sorts:
    - rpt_pillar_score.pillar
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
    show_legend: true
    stacking: ''
    ordering: none
    show_null_labels: false
    limit_displayed_rows: false
    plot_size_by_field: false
    point_style: none
    series_colors:
      rpt_pillar_score.union_ministries: '#4285F4'
      rpt_pillar_score.state_ministries: '#B5C763'
    series_labels:
      rpt_pillar_score.union_ministries: Union CBPs
      rpt_pillar_score.state_ministries: State CBPs
    row: 3
    col: 6
    width: 15
    height: 8
  - name: link_ministry
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[Get more details](/dashboards/citizen_centricity::cc_adoption_ministry)'
    row: 3
    col: 21
    width: 3
    height: 2
  - name: hdr_pillar_act
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### Which pillars are seeing the most activity?'
    row: 11
    col: 0
    width: 24
    height: 1
  - name: assigned_by_subtheme
    title: Assigned Completion | By Pillar, Theme, Sub-Theme
    model: citizen_centricity
    explore: rpt_pillar_subtheme
    type: looker_grid
    fields:
    - rpt_pillar_subtheme.pillar
    - rpt_pillar_subtheme.theme
    - rpt_pillar_subtheme.sub_theme
    - rpt_pillar_subtheme.state_cbps
    - rpt_pillar_subtheme.state_completion_pct
    - rpt_pillar_subtheme.union_cbps
    - rpt_pillar_subtheme.union_completion_pct
    filters:
      rpt_pillar_subtheme.courses_dim: '>0'
    sorts:
    - rpt_pillar_subtheme.union_completion_pct desc
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
    series_cell_visualizations:
      rpt_pillar_subtheme.state_completion_pct:
        is_active: true
      rpt_pillar_subtheme.union_completion_pct:
        is_active: true
    row: 12
    col: 0
    width: 18
    height: 9
  - name: demand_signal
    type: text
    title_text: Demand Signal
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      **iGOT AI CBP Tool** – recommends sub-themes to officials building their capacity plan.


      **Flag Supply Gaps** – sub-themes with high demand but fewer than 5 courses flagged for action.


      *Available once iGOT AI CBP tool data is piped in.*'
    row: 12
    col: 18
    width: 6
    height: 9
