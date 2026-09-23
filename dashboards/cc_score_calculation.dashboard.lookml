---
- dashboard: cc_score_calculation
  title: Citizen Centricity – Composite Score Calculation
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


      [← Go Back](/dashboards/citizen_centricity::cc_executive_summary)'
    row: 0
    col: 0
    width: 24
    height: 3
  - name: calc_intro
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: 'The composite score measures citizen-centricity learning across four pillars: Service Knowledge, Responsiveness, Transparency, and Participation. Each pillar is scored on three components – course supply, assigned completion, and assessment pass rate – and combined using the weights below.'
    row: 3
    col: 0
    width: 24
    height: 2
  - name: calc_defs
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '**• Proficiency-Level Coverage:**

      *Is citizen-centric learning available at the right depth?*


      This measures whether iGOT has courses mapped to each pillar across all three proficiency levels: Beginner, Intermediate, and Advanced. A pillar with content only at beginner level scores lower than one with full coverage across all levels. The score is calculated as the percentage of sub-theme × proficiency level combinations that have at least one course available.


      **• Assigned Completion Rate**

      *Are civil servants engaging with the learning assigned to them?*


      This is the most direct signal of behavioural engagement. An MDO may have courses available and assigned, but if completion is low, capacity building is not happening in practice. This measures the percentage of assigned learning that officials actually complete.


      **• Assessment Pass Rate**

      *Are civil servants demonstrating they have understood what they learned?*


      Completion alone does not confirm learning. The pass rate adds a quality filter, indicating whether engagement translated into measurable competency acquisition. This measures the percentage of assessment attempts that result in a pass.'
    row: 5
    col: 0
    width: 13
    height: 16
  - name: calc_weights
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '| Item | Weight |

      |---|---|

      | Assessment Pass Rate Weight | 30% |

      | Proficiency-Level Coverage | 30% |

      | Assigned Completion Weight | 40% |

      | **Weights Total (must = 100%)** | **100%** |'
    row: 5
    col: 13
    width: 11
    height: 5
  - name: calc_why
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '**Why the weights are set at 30 / 40 / 30**


      • ***Assigned Completion*** carries the highest weight (40%) because it is the variable most within the control of the capacity building system. It reflects whether the ecosystem – MDOs, training institutions, and iGOT together – is successfully driving civil servants to actually learn.


      • ***Proficiency-Level Coverage*** and ***Pass Rate*** are weighted equally (30% each) because both are necessary conditions. Content without completion is underutilised supply; completion without demonstrated learning is shallow engagement. One without the other is incomplete.'
    row: 10
    col: 13
    width: 11
    height: 7
  - name: calc_components
    title: Live components by pillar
    model: citizen_centricity
    explore: rpt_pillar_score
    type: looker_grid
    fields:
    - rpt_pillar_score.pillar
    - rpt_pillar_score.proficiency_level_coverage
    - rpt_pillar_score.assigned_completion_rate
    - rpt_pillar_score.assessment_pass_rate
    - rpt_pillar_score.composite_score
    sorts:
    - rpt_pillar_score.pillar
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: false
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
    row: 17
    col: 13
    width: 11
    height: 4
