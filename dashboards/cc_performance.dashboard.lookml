---
- dashboard: cc_performance
  title: Citizen Centricity – Performance
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
    - cc_ui.header_performance
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
  - name: q_perf_assessment
    title: q_perf_assessment
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_perf_assessment
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
  - name: perf_kpi_row
    title: perf_kpi_row
    model: citizen_centricity
    explore: fct_course
    fields:
    - fct_course.perf_kpi_row
    - fct_course.eoc_coverage
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
    width: 24
    height: 2
  - name: q_perf_demonstrating
    title: q_perf_demonstrating
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_perf_demonstrating
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 5
    col: 0
    width: 24
    height: 1
  - name: strip_pass_rate
    title: strip_pass_rate
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_pass_rate
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 0
    width: 15
    height: 1
  - name: pass_by_pillar
    title: End-of-Course Assessment Pass Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: looker_bar
    fields:
    - rpt_pillar_score.pillar
    - rpt_pillar_score.assessment_pass_rate
    sorts:
    - rpt_pillar_score.pillar
    limit: 500
    show_legend: false
    series_colors:
      rpt_pillar_score.assessment_pass_rate: '#4285F4'
    y_axes:
    - label: ''
      orientation: bottom
      showLabels: true
      showValues: true
      minValue: 0
      maxValue: 1
      tickDensity: custom
      tickDensityCustom: 10
      type: linear
      series:
      - axisId: rpt_pillar_score.assessment_pass_rate
        id: rpt_pillar_score.assessment_pass_rate
    x_axis_gridlines: true
    y_axis_gridlines: false
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
    row: 7
    col: 0
    width: 15
    height: 5
  - name: strip_quality
    title: strip_quality
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_asp_content_quality_signals
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 15
    width: 9
    height: 1
  - name: content_quality_signals
    title: content_quality_signals
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.asp_content_quality_signals
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 7
    col: 15
    width: 9
    height: 5
  - name: q_perf_competency
    title: q_perf_competency
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_perf_competency
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 12
    col: 0
    width: 24
    height: 1
  - name: progression_row
    title: progression_row
    model: citizen_centricity
    explore: fct_course
    fields:
    - fct_course.progression_row
    - fct_course.completions
    - fct_course.completion_rate
    - fct_course.eoc_coverage
    - fct_course.pass_rate
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 13
    col: 0
    width: 24
    height: 3
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
