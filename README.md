# Spotify MiniDisc 💽 Playlist

Creates a Spotify playlist with [Terraform](https://www.terraform.io) using the [Spotify Provider](https://registry.terraform.io/providers/conradludgate/spotify/latest/docs) that inserts a track between all tracks in a playlist.

This is useful for when recording music to a [MiniDisc](https://www.minidisc.wiki) 💽 using [Synchro Rec](https://www.minidisc.wiki/guides/dubbing#synchro_rec) with a digital optical signal to automatically create track markers.

Can output artist, album, and track names for use in automatic TOC with something like [md-rec](https://github.com/fijam/md-rec).

## Requirements

This Terraform requires a modified version of `terraform-provider-spotify`, which you can build from https://github.com/ecliptik/terraform-provider-spotify in the `spotify_album_tracks` branch.

Follow [Create a Spotify Playlist with Terraform](https://learn.hashicorp.com/tutorials/terraform/spotify-playlist) for initial setup and configuration.

## Use

Get the Spotify Album ID by going to an llbum in Spotify, then `Share -> Copy Album Link` and extract the Album ID from the URL after `/album/`.

For example, the Album ID for Gunship - Dark All Day is `0rXLjiZSS0B7yYqCvz2akm`

Full Album URL
```
https://open.spotify.com/album/0rXLjiZSS0B7yYqCvz2akm
```

Pass this to `terrafrom` as the `album_id` variable,

```
terraform apply -var="album_id=0rXLjiZSS0B7yYqCvz2akm"
```

Example Output

```
💽➜ terraform apply -var="album_id=0rXLjiZSS0B7yYqCvz2akm"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # spotify_playlist.minidisc will be created
  + resource "spotify_playlist" "minidisc" {
      + description = "MiniDisc Playlist created from Terraform"
      + id          = (known after apply)
      + name        = "MiniDisc Playlist"
      + public      = false
      + snapshot_id = (known after apply)
      + tracks      = [
          + "1gGNnSJrFVe4LCnP0nCbDJ",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "4GBJomKlZNRnODfpL299pw",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "0d3O2HCMzSblmSsWd9Lgh2",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "3TjBuYxZqsO5jirM0rujRO",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "7x54Ia2d2ZkQ58zqw8MESv",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "7hsRTk36qhFTSzmBoAZHdI",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "3L5OGCMGh4Vhql02c2zHcW",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "5598GfKJx4yhkbGNsBVWAM",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "4j1ICBkRoVnQ7CAaGbyiFo",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "3UwWu3k4ppm1vQxLuSIr0H",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "6vOfbjqR7q9jO41zhxqAw4",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "3WoZLDtOvUnzMIDEhKr4hM",
          + "5XSKC4d0y0DfcGbvDOiL93",
          + "6zgxiWMDeja1zNp7ulI9uf",
          + "5XSKC4d0y0DfcGbvDOiL93",
        ]
    }
Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + album        = "Dark All Day"
  + artist       = "Gunship"
  + playlist_url = (known after apply)
  + tracks       = [
      + "Woken Furies",
      + "Dark All Day",
      + "When You Grow Up, Your Heart Dies",
      + "The Drone Racing League",
      + "Rise the Midnight Girl",
      + "Thrasher",
      + "Black Blood Red Kiss",
      + "Time After Time",
      + "Honour Among Thieves",
      + "Art3mis & Parzival",
      + "Symmetrical",
      + "Cyber City",
      + "The Gates of Disorder",
    ]
```
