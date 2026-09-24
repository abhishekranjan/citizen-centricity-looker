---
- dashboard: cc_coverage
  title: Citizen Centricity – Coverage
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
    - cc_ui.header_coverage
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
  - name: q_coverage
    title: q_coverage
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_coverage
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
  - name: strip_difficulty
    title: strip_difficulty
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_course_difficulty
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
    width: 8
    height: 1
  - name: difficulty_pie
    title: Course Difficulty Levels
    model: citizen_centricity
    explore: fct_course
    type: looker_pie
    fields:
    - fct_course.difficulty_level
    - fct_course.course_count
    filters:
      fct_course.difficulty_level: -Not Tagged
    sorts:
    - fct_course.difficulty_level
    limit: 10
    value_labels: labels
    label_type: key_val
    inner_radius: 0
    start_angle: 0
    end_angle: 360
    label_density: 25
    font_size: '13'
    series_colors:
      Beginner: '#2196F3'
      Intermediate: '#4CAF50'
      Advanced: '#B388FF'
    title_hidden: true
    row: 4
    col: 0
    width: 8
    height: 6
  - name: strip_maturity
    title: strip_maturity
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_assessment_maturity
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 3
    col: 8
    width: 8
    height: 1
  - name: assess_maturity
    title: Maturity of Assessment Framework (Courses with Assessments)
    model: citizen_centricity
    explore: assessment_maturity
    type: looker_bar
    fields:
    - assessment_maturity.stage
    - assessment_maturity.pct
    sorts:
    - assessment_maturity.stage
    limit: 500
    show_legend: false
    series_colors:
      assessment_maturity.pct: '#2196F3'
    y_axes:
    - label: ''
      orientation: bottom
      showLabels: false
      showValues: false
      minValue: 0
      maxValue: 1
      tickDensity: default
      type: linear
      series:
      - axisId: assessment_maturity.pct
        id: assessment_maturity.pct
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
    title_hidden: true
    row: 4
    col: 8
    width: 8
    height: 4
  - name: strip_data_gaps
    title: strip_data_gaps
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_data_gaps
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 3
    col: 16
    width: 8
    height: 1
  - name: data_gaps_bar
    title: Data Gaps in the System
    model: citizen_centricity
    explore: seed_data_gaps
    type: looker_bar
    fields:
    - seed_data_gaps.status_axis
    - seed_data_gaps.status
    - seed_data_gaps.indicator_count
    pivots:
    - seed_data_gaps.status
    sorts:
    - seed_data_gaps.status_axis desc
    - seed_data_gaps.status
    limit: 500
    show_legend: false
    series_colors:
      Available - seed_data_gaps.indicator_count: '#4285F4'
      Aspirational - seed_data_gaps.indicator_count: '#F4A259'
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
    stacking: normal
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
    row: 4
    col: 16
    width: 8
    height: 4
  - name: strip_providers
    title: strip_providers
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_provider_contribution
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 8
    col: 8
    width: 16
    height: 1
  - name: provider_table
    title: Contribution of Course Providers
    model: citizen_centricity
    explore: fct_course
    type: looker_grid
    fields:
    - fct_course.content_provider_name
    - fct_course.course_count
    - brg_course_subtheme.sub_theme_count
    - fct_course.avg_content_rating
    - fct_course.completion_rate
    - fct_course.enrolments_exact
    - fct_course.completions_exact
    sorts:
    - fct_course.course_count desc
    limit: 500
    total: true
    show_row_numbers: true
    hide_totals: false
    show_totals: true
    series_labels:
      fct_course.content_provider_name: Course Provider
      fct_course.course_count: Number of Courses
      brg_course_subtheme.sub_theme_count: Sub-Themes
      fct_course.avg_content_rating: Average Content Rating
      fct_course.completion_rate: Completion Rate
      fct_course.enrolments_exact: Enrolments
      fct_course.completions_exact: Completions
    enable_conditional_formatting: true
    conditional_formatting:
    - type: along a scale...
      value: null
      background_color: null
      font_color: null
      color_application:
        collection_id: custom
        custom:
          id: cc-green
          label: Custom
          type: continuous
          stops:
          - color: '#C8E6C9'
            offset: 0
          - color: '#1B5E20'
            offset: 100
        options:
          steps: 5
      bold: false
      italic: false
      strikethrough: false
      fields:
      - fct_course.course_count
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    title_hidden: true
    row: 9
    col: 8
    width: 16
    height: 8
  - name: strip_subtheme_cov
    title: strip_subtheme_cov
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.strip_subtheme_coverage
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 10
    col: 0
    width: 8
    height: 1
  - name: subtheme_cov
    title: Sub-Theme Coverage | By Pillars
    model: citizen_centricity
    explore: rpt_pillar_subtheme
    type: looker_grid
    fields:
    - rpt_pillar_subtheme.pillar
    - rpt_pillar_subtheme.covered_subtheme_list
    - rpt_pillar_subtheme.subthemes_covered
    - rpt_pillar_subtheme.subthemes_total
    - rpt_pillar_subtheme.subtheme_coverage_pct
    sorts:
    - rpt_pillar_subtheme.pillar
    limit: 500
    show_row_numbers: false
    hide_totals: true
    show_totals: false
    enable_conditional_formatting: false
    series_labels:
      rpt_pillar_subtheme.covered_subtheme_list: Sub-theme list
      rpt_pillar_subtheme.subthemes_covered: Sub-themes
      rpt_pillar_subtheme.subthemes_total: Total Sub-themes
      rpt_pillar_subtheme.subtheme_coverage_pct: Sub-themes Covered
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
    title_hidden: true
    row: 11
    col: 0
    width: 8
    height: 6
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
    row: 17
    col: 0
    width: 24
    height: 1
