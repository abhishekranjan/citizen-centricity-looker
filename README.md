# Citizen Centricity – Looker project

## White background theme

### Why this can't be done in LookML alone
In the current dashboard viewer (`preferred_viewer: dashboards-next`), the
grey canvas that shows between tiles, and the tile shadows, are controlled by
a **Looker Theme**, not by any dashboard LookML parameter. `embed_style` only
works on legacy dashboards, so it is deliberately not used here.

The repo side is already done:
- `manifest.lkml` defines the constant `cc_theme` (value `cc_plain_white`).
- Every link between dashboards (header tabs, Go Back, "Get more details",
  score-calculation and sub-theme links, MDO/State toggles) appends
  `theme=@{cc_theme}`, so the theme is kept as users navigate.

The theme itself has to be created once on the Looker instance.

### Create the theme
**With the script** (needs an API key for a user with the Admin role):

```bash
pip install looker_sdk
export LOOKERSDK_BASE_URL=https://yourinstance.looker.com
export LOOKERSDK_CLIENT_ID=...
export LOOKERSDK_CLIENT_SECRET=...
python scripts/create_theme.py                # create or update
python scripts/create_theme.py --set-default  # optional: make it the default
```

Running it again updates the existing theme rather than creating a duplicate.

**Or manually:** Admin → Platform → Themes → New Theme, name it
`cc_plain_white`, and set:

| Setting | Value |
|---|---|
| Background color | `#FFFFFF` |
| Tile background color | `#FFFFFF` |
| Tile shadow | Off |
| Show title | Off (the dashboards draw their own header) |
| Show filters bar | On |

### Apply the theme
- **As the default theme** (Admin → Themes, or `--set-default`): every
  dashboard on the instance uses it. This affects other teams' dashboards too.
- **Per URL**: open the entry dashboard with the theme parameter, e.g.
  `/dashboards/citizen_centricity::cc_executive_summary?theme=cc_plain_white`.
  Links inside the dashboards carry it from there. Bookmarks and shared links
  should include `?theme=cc_plain_white`.

### If the Themes page isn't available
Themes must be enabled on the instance; this is typically tied to embedding or
the Enterprise / Embed editions of Looker (Google Cloud core). If Admin →
Themes is missing or the script returns an error about themes, ask your Looker
admin or Google account rep to enable the feature. Until then the dashboards
work exactly as before; Looker ignores the `theme` parameter in the links.

If you rename the theme, change both `THEME_NAME` in
`scripts/create_theme.py` and the `cc_theme` constant in `manifest.lkml`.
