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

#Variable to use from command line to choose album
variable "album_id" {
  type = string
  description = "Spotify Album ID to create playlist from"
}

variable "silence" {
  type = list
  description = "Spotify Track ID of silent track to add in playlist"
  default = ["5XSKC4d0y0DfcGbvDOiL93"]
}

#Create the playlist from tracks on an album
resource "spotify_playlist" "minidisc" {
  name        = "MiniDisc Synchro Rec Playlist"
  description = "MiniDisc Synchro Rec Playlist created with Terraform - https://github.com/ecliptik/minidisc-playlist"
  public      = false

  #Append the silience track after every track in an album
  tracks = flatten([for t in data.spotify_album.minidisc.tracks[*] : concat([t],[var.silence]) ])
}

data "spotify_album" "minidisc" {
  spotify_id = var.album_id
}

data "spotify_artist" "minidisc" {
  spotify_id = data.spotify_album.minidisc.artists[0]
}

output "tracks" {
  value = data.spotify_album.minidisc.track_names[*]
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
