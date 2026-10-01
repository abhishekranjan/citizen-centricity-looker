#!/usr/bin/env python3
"""Create or update the 'cc_plain_white' Looker theme.

The theme gives the Citizen Centricity dashboards a plain white page: white
canvas behind the tiles, white tiles, and no tile shadows. In dashboards-next
this cannot be set from LookML; it has to be a Looker Theme.

Requirements:
    pip install looker_sdk

Credentials (API3 key of a user with the Admin role) are read from env vars:
    LOOKERSDK_BASE_URL       e.g. https://yourinstance.looker.com
    LOOKERSDK_CLIENT_ID
    LOOKERSDK_CLIENT_SECRET

Usage:
    python scripts/create_theme.py                # create / update the theme
    python scripts/create_theme.py --set-default  # ...and make it the default
"""
import argparse
import sys

import looker_sdk
from looker_sdk import error
from looker_sdk.sdk.api40 import models

# Must match the cc_theme constant in manifest.lkml.
THEME_NAME = "cc_plain_white"

SETTINGS = models.ThemeSettings(
    background_color="#FFFFFF",
    tile_background_color="#FFFFFF",
    tile_shadow=False,
    show_title=False,       # dashboards draw their own header tile
    show_filters_bar=True,  # several dashboards have filters
)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument(
        "--set-default",
        action="store_true",
        help="also make this the instance's default theme",
    )
    args = parser.parse_args()

    sdk = looker_sdk.init40()
    body = models.WriteTheme(name=THEME_NAME, settings=SETTINGS)

    try:
        existing = sdk.search_themes(name=THEME_NAME)
        if existing:
            theme = sdk.update_theme(existing[0].id, body)
            print(f"Updated theme '{theme.name}' (id {theme.id}).")
        else:
            theme = sdk.create_theme(body)
            print(f"Created theme '{theme.name}' (id {theme.id}).")

        if args.set_default:
            sdk.set_default_theme(THEME_NAME)
            print(f"'{THEME_NAME}' is now the default theme.")
    except error.SDKError as exc:
        print(f"Looker API error: {exc}", file=sys.stderr)
        print(
            "If the error mentions themes not being available, the Themes "
            "feature is not enabled on this instance (see README).",
            file=sys.stderr,
        )
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
