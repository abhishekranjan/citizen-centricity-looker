---
- dashboard: cc_executive_summary
  title: Citizen Centricity KRA Dashboard – Executive Summary
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
    - cc_ui.header_executive_summary
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
  - name: headline
    title: headline
    model: citizen_centricity
    explore: rpt_pillar_score
    fields:
    - rpt_pillar_score.headline_card
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
    height: 4
  - name: pillar_service_knowledge
    title: pillar_service_knowledge
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.pillar_block_card
    - rpt_pillar_score.composite_score
    - rpt_pillar_score.completion_rate
    - rpt_pillar_score.enrolments
    - rpt_pillar_score.completions
    - rpt_pillar_score.courses
    - rpt_pillar_score.assessment_pass_rate
    filters:
      rpt_pillar_score.pillar: Service Knowledge
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 0
    width: 6
    height: 6
  - name: pillar_responsiveness
    title: pillar_responsiveness
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.pillar_block_card
    - rpt_pillar_score.composite_score
    - rpt_pillar_score.completion_rate
    - rpt_pillar_score.enrolments
    - rpt_pillar_score.completions
    - rpt_pillar_score.courses
    - rpt_pillar_score.assessment_pass_rate
    filters:
      rpt_pillar_score.pillar: Responsiveness
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 6
    width: 6
    height: 6
  - name: pillar_transparency
    title: pillar_transparency
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.pillar_block_card
    - rpt_pillar_score.composite_score
    - rpt_pillar_score.completion_rate
    - rpt_pillar_score.enrolments
    - rpt_pillar_score.completions
    - rpt_pillar_score.courses
    - rpt_pillar_score.assessment_pass_rate
    filters:
      rpt_pillar_score.pillar: Transparency
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 12
    width: 6
    height: 6
  - name: pillar_participation
    title: pillar_participation
    model: citizen_centricity
    explore: rpt_pillar_score
    type: single_value
    fields:
    - rpt_pillar_score.pillar_block_card
    - rpt_pillar_score.composite_score
    - rpt_pillar_score.completion_rate
    - rpt_pillar_score.enrolments
    - rpt_pillar_score.completions
    - rpt_pillar_score.courses
    - rpt_pillar_score.assessment_pass_rate
    filters:
      rpt_pillar_score.pillar: Participation
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 6
    col: 18
    width: 6
    height: 6
  - name: q_reach
    title: q_reach
    model: citizen_centricity
    explore: cc_ui
    fields:
    - cc_ui.q_reach
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
  - name: reach_enrolment
    title: reach_enrolment
    model: citizen_centricity
    explore: fct_course
    fields:
    - fct_course.reach_enrolment_card
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
    width: 5
    height: 2
  - name: reach_completions
    title: reach_completions
    model: citizen_centricity
    explore: fct_course
    fields:
    - fct_course.reach_completions_card
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 13
    col: 5
    width: 5
    height: 2
  - name: reach_courses
    title: reach_courses
    model: citizen_centricity
    explore: fct_course
    fields:
    - fct_course.reach_courses_card
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 13
    col: 10
    width: 4
    height: 2
  - name: reach_themes
    title: reach_themes
    model: citizen_centricity
    explore: rpt_taxonomy_coverage
    fields:
    - rpt_taxonomy_coverage.themes_card
    - rpt_taxonomy_coverage.themes_domain_label
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 13
    col: 14
    width: 5
    height: 2
  - name: reach_subthemes
    title: reach_subthemes
    model: citizen_centricity
    explore: rpt_taxonomy_coverage
    fields:
    - rpt_taxonomy_coverage.subthemes_card
    - rpt_taxonomy_coverage.subthemes_all_label
    type: single_value
    title_hidden: true
    show_single_value_title: false
    show_comparison: false
    custom_color_enabled: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 13
    col: 19
    width: 5
    height: 2
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
    row: 15
    col: 0
    width: 24
    height: 1
