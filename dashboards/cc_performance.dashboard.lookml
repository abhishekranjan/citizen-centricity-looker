---
- dashboard: cc_performance
  title: Citizen Centricity – Performance
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

      [Executive Summary](/dashboards/citizen_centricity::cc_executive_summary)  |  [Coverage](/dashboards/citizen_centricity::cc_coverage)  |  [Adoption](/dashboards/citizen_centricity::cc_adoption)  |  [Learning](/dashboards/citizen_centricity::cc_learning)  |  **Performance**'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: hdr_perf1
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### Do assessment processes ensure meaningful evaluation and are the learners engaging?'
    row: 2
    col: 0
    width: 24
    height: 1
  - name: overall_pass
    title: Overall Pass Rate
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.pass_rate
    custom_color_enabled: true
    custom_color: '#1B5E20'
    show_single_value_title: true
    single_value_title: Overall Pass Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 3
    col: 0
    width: 5
    height: 3
  - name: eoc_cov
    title: Courses with End-of-Course Assessments
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.eoc_coverage
    custom_color_enabled: true
    custom_color: '#1B5E20'
    show_single_value_title: true
    single_value_title: Courses with End-of-Course Assessments
    show_comparison: false
    enable_conditional_formatting: false
    row: 3
    col: 5
    width: 5
    height: 3
  - name: asp_comp
    type: text
    title_text: Competency Assessments
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      '
    row: 3
    col: 10
    width: 5
    height: 3
  - name: asp_flag
    type: text
    title_text: Flagged Courses
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      *Pass rate below 50%*'
    row: 3
    col: 15
    width: 4
    height: 3
  - name: asp_health
    type: text
    title_text: Content Health Quality
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      '
    row: 3
    col: 19
    width: 5
    height: 3
  - name: hdr_perf2
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### How well are civil servants demonstrating of citizen centric learning?'
    row: 6
    col: 0
    width: 24
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
    - rpt_pillar_score.assessment_pass_rate desc
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
      rpt_pillar_score.assessment_pass_rate: '#4285F4'
    row: 7
    col: 0
    width: 15
    height: 7
  - name: asp_signals
    type: text
    title_text: Content Quality Signals
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      Course · Pillar · Provider · Pass Rate · Health Score


      *Health Score = Pass rate · Has assessment · Completion rate · Flagged (<50%)*'
    row: 7
    col: 15
    width: 9
    height: 7
  - name: hdr_perf3
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### How far has the system progressed toward measuring actual competency?'
    row: 14
    col: 0
    width: 24
    height: 1
  - name: prog_supply
    title: Course Supply – Courses
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.course_count
    custom_color_enabled: true
    custom_color: '#1B5E20'
    show_single_value_title: true
    single_value_title: Course Supply – Courses
    show_comparison: false
    enable_conditional_formatting: false
    row: 15
    col: 0
    width: 4
    height: 3
  - name: prog_comp
    title: Course Completion – Completions
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.completions
    custom_color_enabled: true
    custom_color: '#1B5E20'
    show_single_value_title: true
    single_value_title: Course Completion – Completions
    show_comparison: false
    enable_conditional_formatting: false
    row: 15
    col: 4
    width: 2
    height: 3
  - name: prog_rate
    title: Rate
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.completion_rate
    custom_color_enabled: true
    custom_color: '#1B5E20'
    show_single_value_title: true
    single_value_title: Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 15
    col: 6
    width: 2
    height: 3
  - name: prog_eoc
    title: End-of-Course Assessment – Coverage
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.eoc_coverage
    custom_color_enabled: true
    custom_color: '#1B5E20'
    show_single_value_title: true
    single_value_title: End-of-Course Assessment – Coverage
    show_comparison: false
    enable_conditional_formatting: false
    row: 15
    col: 8
    width: 2
    height: 3
  - name: prog_pass
    title: Pass Rate
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.pass_rate
    custom_color_enabled: true
    custom_color: '#1B5E20'
    show_single_value_title: true
    single_value_title: Pass Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 15
    col: 10
    width: 2
    height: 3
  - name: prog_ca
    type: text
    title_text: Competency Assessment
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      Under development'
    row: 15
    col: 12
    width: 4
    height: 3
  - name: prog_wv
    type: text
    title_text: Workplace Validation
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      360-degree Feedback System to be developed'
    row: 15
    col: 16
    width: 4
    height: 3
  - name: prog_cf
    type: text
    title_text: Citizen Feedback / Workflow Application Systems
    subtitle_text: ''
    body_text: '**⚠ ASPIRATIONAL**


      Beyond CBC mandate'
    row: 15
    col: 20
    width: 4
    height: 3
