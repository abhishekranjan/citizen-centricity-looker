---
- dashboard: cc_executive_summary
  title: Citizen Centricity KRA Dashboard – Executive Summary
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

      **Executive Summary**  |  [Coverage](/dashboards/citizen_centricity::cc_coverage)  |  [Adoption](/dashboards/citizen_centricity::cc_adoption)  |  [Learning](/dashboards/citizen_centricity::cc_learning)  |  [Performance](/dashboards/citizen_centricity::cc_performance)'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: intro
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: 'The Citizen Centricity KRA tracks how well government training programs prepare civil servants to deliver citizen-focused services. This dashboard covers the citizen-centric courses across **6 Behavioural and Functional** and **10 Domain competency themes** mapped to 4 governance pillars: ***Responsiveness, Transparency, Participation,*** and ***Service Knowledge***.'
    row: 2
    col: 0
    width: 18
    height: 2
  - name: link_calc
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[Click here to see Calculation for the Composite Score](/dashboards/citizen_centricity::cc_score_calculation)'
    row: 2
    col: 18
    width: 6
    height: 2
  - name: composite_headline
    title: Composite Citizen Centricity Score for Capacity Building and Performance
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.composite_score_out_of_100
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Composite Citizen Centricity Score for Capacity Building and Performance
    show_comparison: false
    enable_conditional_formatting: false
    row: 4
    col: 0
    width: 16
    height: 3
  - name: link_subtheme
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[Go to Detailed Sub-Theme Analysis ➜](/dashboards/citizen_centricity::cc_subtheme_analysis)'
    row: 4
    col: 16
    width: 8
    height: 3
  - name: hdr_service_knowledge
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Service Knowledge'
    row: 7
    col: 0
    width: 6
    height: 1
  - name: service_knowledge_score
    title: Composite Score
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.composite_score
    filters: &id001
      rpt_pillar_score.pillar: Service Knowledge
    custom_color_enabled: true
    custom_color: '#5B6B00'
    show_single_value_title: true
    single_value_title: Composite Score
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 0
    width: 3
    height: 3
  - name: service_knowledge_cr
    title: Completion Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completion_rate
    filters: *id001
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Completion Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 3
    width: 3
    height: 3
  - name: service_knowledge_enr
    title: Total Enrollment
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.enrolments
    filters: *id001
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Enrollment
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 0
    width: 3
    height: 3
  - name: service_knowledge_comp
    title: Total Completions
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completions
    filters: *id001
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Completions
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 3
    width: 3
    height: 3
  - name: service_knowledge_courses
    title: Courses
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.courses
    filters: *id001
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Courses
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 0
    width: 3
    height: 3
  - name: service_knowledge_pass
    title: Assessment Pass Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.assessment_pass_rate
    filters: *id001
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Assessment Pass Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 3
    width: 3
    height: 3
  - name: hdr_responsiveness
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Responsiveness'
    row: 7
    col: 6
    width: 6
    height: 1
  - name: responsiveness_score
    title: Composite Score
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.composite_score
    filters: &id002
      rpt_pillar_score.pillar: Responsiveness
    custom_color_enabled: true
    custom_color: '#5B6B00'
    show_single_value_title: true
    single_value_title: Composite Score
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 6
    width: 3
    height: 3
  - name: responsiveness_cr
    title: Completion Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completion_rate
    filters: *id002
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Completion Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 9
    width: 3
    height: 3
  - name: responsiveness_enr
    title: Total Enrollment
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.enrolments
    filters: *id002
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Enrollment
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 6
    width: 3
    height: 3
  - name: responsiveness_comp
    title: Total Completions
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completions
    filters: *id002
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Completions
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 9
    width: 3
    height: 3
  - name: responsiveness_courses
    title: Courses
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.courses
    filters: *id002
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Courses
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 6
    width: 3
    height: 3
  - name: responsiveness_pass
    title: Assessment Pass Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.assessment_pass_rate
    filters: *id002
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Assessment Pass Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 9
    width: 3
    height: 3
  - name: hdr_transparency
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Transparency'
    row: 7
    col: 12
    width: 6
    height: 1
  - name: transparency_score
    title: Composite Score
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.composite_score
    filters: &id003
      rpt_pillar_score.pillar: Transparency
    custom_color_enabled: true
    custom_color: '#5B6B00'
    show_single_value_title: true
    single_value_title: Composite Score
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 12
    width: 3
    height: 3
  - name: transparency_cr
    title: Completion Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completion_rate
    filters: *id003
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Completion Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 15
    width: 3
    height: 3
  - name: transparency_enr
    title: Total Enrollment
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.enrolments
    filters: *id003
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Enrollment
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 12
    width: 3
    height: 3
  - name: transparency_comp
    title: Total Completions
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completions
    filters: *id003
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Completions
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 15
    width: 3
    height: 3
  - name: transparency_courses
    title: Courses
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.courses
    filters: *id003
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Courses
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 12
    width: 3
    height: 3
  - name: transparency_pass
    title: Assessment Pass Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.assessment_pass_rate
    filters: *id003
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Assessment Pass Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 15
    width: 3
    height: 3
  - name: hdr_participation
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '## Participation'
    row: 7
    col: 18
    width: 6
    height: 1
  - name: participation_score
    title: Composite Score
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.composite_score
    filters: &id004
      rpt_pillar_score.pillar: Participation
    custom_color_enabled: true
    custom_color: '#5B6B00'
    show_single_value_title: true
    single_value_title: Composite Score
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 18
    width: 3
    height: 3
  - name: participation_cr
    title: Completion Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completion_rate
    filters: *id004
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Completion Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 8
    col: 21
    width: 3
    height: 3
  - name: participation_enr
    title: Total Enrollment
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.enrolments
    filters: *id004
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Enrollment
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 18
    width: 3
    height: 3
  - name: participation_comp
    title: Total Completions
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.completions
    filters: *id004
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Completions
    show_comparison: false
    enable_conditional_formatting: false
    row: 11
    col: 21
    width: 3
    height: 3
  - name: participation_courses
    title: Courses
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.courses
    filters: *id004
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Courses
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 18
    width: 3
    height: 3
  - name: participation_pass
    title: Assessment Pass Rate
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.assessment_pass_rate
    filters: *id004
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Assessment Pass Rate
    show_comparison: false
    enable_conditional_formatting: false
    row: 14
    col: 21
    width: 3
    height: 3
  - name: hdr_reach
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '### What is the overall reach of citizen-centric capacity building?  [Get more details](/dashboards/citizen_centricity::cc_course_list)'
    row: 17
    col: 0
    width: 24
    height: 1
  - name: reach_enr
    title: Total Enrollment
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.enrolments
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Enrollment
    show_comparison: false
    enable_conditional_formatting: false
    row: 18
    col: 0
    width: 4
    height: 3
  - name: reach_comp
    title: Total Completions
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.completions
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Total Completions
    show_comparison: false
    enable_conditional_formatting: false
    row: 18
    col: 4
    width: 4
    height: 3
  - name: reach_courses
    title: No. of Courses
    model: citizen_centricity
    explore: fct_course
    type: single_value
    fields:
    - fct_course.course_count
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: No. of Courses
    show_comparison: false
    enable_conditional_formatting: false
    row: 18
    col: 8
    width: 4
    height: 3
  - name: themes_bf
    title: Themes Covered – B&F
    model: citizen_centricity
    explore: rpt_taxonomy_coverage
    type: single_value
    fields:
    - rpt_taxonomy_coverage.themes_bf_label
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Themes Covered – B&F
    show_comparison: false
    enable_conditional_formatting: false
    row: 18
    col: 12
    width: 3
    height: 3
  - name: themes_dom
    title: Themes Covered – Domain
    model: citizen_centricity
    explore: rpt_taxonomy_coverage
    type: single_value
    fields:
    - rpt_taxonomy_coverage.themes_domain_label
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Themes Covered – Domain
    show_comparison: false
    enable_conditional_formatting: false
    row: 18
    col: 15
    width: 3
    height: 3
  - name: sub_bf
    title: Sub-Themes Covered – B&F
    model: citizen_centricity
    explore: rpt_taxonomy_coverage
    type: single_value
    fields:
    - rpt_taxonomy_coverage.subthemes_bf_label
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Sub-Themes Covered – B&F
    show_comparison: false
    enable_conditional_formatting: false
    row: 18
    col: 18
    width: 3
    height: 3
  - name: sub_dom
    title: Sub-Themes Covered – All
    model: citizen_centricity
    explore: rpt_taxonomy_coverage
    type: single_value
    fields:
    - rpt_taxonomy_coverage.subthemes_all_label
    custom_color_enabled: true
    custom_color: '#0B3A75'
    show_single_value_title: true
    single_value_title: Sub-Themes Covered – All
    show_comparison: false
    enable_conditional_formatting: false
    row: 18
    col: 21
    width: 3
    height: 3
