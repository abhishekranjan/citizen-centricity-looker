---
- dashboard: cc_adoption
  title: Citizen Centricity – Adoption
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
    - cc_ui.header_adoption
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
  - name: q_adoption_mdos
    title: q_adoption_mdos
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_adoption_mdos
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
  - name: adoption_kpis
    title: adoption_kpis
    model: citizen_centricity
    explore: fct_cbp_assignment
    fields:
    - fct_cbp_assignment.adoption_kpis
    - fct_cbp_assignment.completion_rate
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
    width: 7
    height: 5
  - name: pill_ministry
    title: pill_ministry
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.pill_ministry
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 3
    col: 7
    width: 17
    height: 1
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
    show_legend: true
    series_colors:
      rpt_pillar_score.union_ministries: '#4285F4'
      rpt_pillar_score.state_ministries: '#B5C763'
    series_labels:
      rpt_pillar_score.union_ministries: Union CBPs
      rpt_pillar_score.state_ministries: State CBPs
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
    row: 4
    col: 7
    width: 17
    height: 4
  - name: q_adoption_pillars
    title: q_adoption_pillars
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_adoption_pillars
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 8
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
    show_row_numbers: true
    hide_totals: true
    show_totals: false
    enable_conditional_formatting: false
    series_cell_visualizations:
      rpt_pillar_subtheme.state_completion_pct:
        is_active: true
        palette:
          palette_id: cc-orange
          collection_id: custom
          custom_colors:
          - '#F4A259'
          - '#F4A259'
      rpt_pillar_subtheme.union_completion_pct:
        is_active: true
        palette:
          palette_id: cc-lime
          collection_id: custom
          custom_colors:
          - '#B5C763'
          - '#B5C763'
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
    row: 9
    col: 0
    width: 17
    height: 7
  - name: demand_signal
    title: demand_signal
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.asp_demand_signal
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 9
    col: 17
    width: 7
    height: 7
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
