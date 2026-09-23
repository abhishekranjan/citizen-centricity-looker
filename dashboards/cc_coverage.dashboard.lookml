---
- dashboard: cc_coverage
  title: Citizen Centricity – Coverage
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

      [Executive Summary](/dashboards/citizen_centricity::cc_executive_summary)  |  **Coverage**  |  [Adoption](/dashboards/citizen_centricity::cc_adoption)  |  [Learning](/dashboards/citizen_centricity::cc_learning)  |  [Performance](/dashboards/citizen_centricity::cc_performance)'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: hdr_cov
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### What does the learning infrastructure look like?'
    row: 2
    col: 0
    width: 24
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
    label_type: val
    series_colors:
      Beginner: '#2196F3'
      Intermediate: '#4CAF50'
      Advanced: '#B388FF'
    row: 3
    col: 0
    width: 8
    height: 8
  - name: link_diff
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[Get more details](/dashboards/citizen_centricity::cc_difficulty_by_subtheme)'
    row: 11
    col: 0
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
    show_legend: false
    stacking: ''
    ordering: none
    show_null_labels: false
    limit_displayed_rows: false
    plot_size_by_field: false
    point_style: none
    series_colors:
      assessment_maturity.pct: '#2196F3'
    row: 3
    col: 8
    width: 8
    height: 5
  - name: data_gaps_bar
    title: Data Gaps in the System
    model: citizen_centricity
    explore: seed_data_gaps
    type: looker_bar
    fields:
    - seed_data_gaps.status
    - seed_data_gaps.indicator_count
    sorts:
    - seed_data_gaps.status
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
    show_legend: false
    stacking: ''
    ordering: none
    show_null_labels: false
    limit_displayed_rows: false
    plot_size_by_field: false
    point_style: none
    series_colors:
      seed_data_gaps.indicator_count: '#2F80ED'
    row: 3
    col: 16
    width: 8
    height: 4
  - name: link_gaps
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[Get more details](/dashboards/citizen_centricity::cc_data_gaps)'
    row: 7
    col: 16
    width: 8
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
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_totals: true
    show_row_totals: false
    series_labels:
      fct_course.course_count: Number of Courses
      brg_course_subtheme.sub_theme_count: Sub-Themes
      fct_course.enrolments_exact: Enrolments
      fct_course.completions_exact: Completions
    series_cell_visualizations:
      fct_course.course_count:
        is_active: true
    row: 12
    col: 8
    width: 16
    height: 9
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
    row: 12
    col: 0
    width: 8
    height: 6
