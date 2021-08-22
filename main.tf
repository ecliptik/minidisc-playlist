#Use local module from https://github.com/ecliptik/terraform-provider-spotify
terraform {
  required_providers {
    spotify = {
      source  = "ecliptik/spotify"
      version = "0.1.0"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

variable "silence" {
  type = list
  description = "Spotify Track ID of silent track to add in playlist"
  default = ["5XSKC4d0y0DfcGbvDOiL93"]
}

resource "spotify_playlist" "minidisc" {
  name        = "MiniDisc Playlist"
  description = "MiniDisc Playlist created from Terraform"
  public      = false

  tracks = flatten([for t in data.spotify_album.minidisc.tracks[*] : concat([t],[var.silence]) ])
  #tracks = flatten([
  #  data.spotify_album.minidisc.tracks[*],
  #])
}

data "spotify_album" "minidisc" {
  url = "https://open.spotify.com/album/0rXLjiZSS0B7yYqCvz2akm"
}

data "spotify_artist" "minidisc" {
  spotify_id = data.spotify_album.minidisc.artists[0]
}

output "tracks" {
  value = data.spotify_album.minidisc.tracks
}
output "artist" {
  value = data.spotify_artist.minidisc.name
}

output "album" {
  value = data.spotify_album.minidisc.name

}

output "playlist_url" {
  value       = "https://open.spotify.com/playlist/${spotify_playlist.minidisc.id}"
  description = "Visit this URL in your browser to listen to the playlist"
}
