//
//  Track.swift
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation





struct Track:Codable {
    
    let id:Int
    var kind:String?
    let title:String
    let duration:Int
    var genre:String?
    var artworkURL:String?
    var streamURL:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case duration
        case artworkURL = "artwork_url"
        case streamURL = "stream_url"
    }

}


//"id":324206087,
//"kind":"track",
//"created_at":"2017/05/24 02:22:09 +0000",
//"last_modified":"2019/03/08 08:00:39 +0000",
//"permalink":"met-gala-feat-offset",
//"permalink_url":"https://soundcloud.com/flameemojimusic/met-gala-feat-offset",
//"title":"Met Gala (feat. Offset)",
//"duration":209233,
//"sharing":"public",
//"waveform_url":"https://w1.sndcdn.com/f3XyC4DbK3Ol_m.png",
//"stream_url":"https://api.soundcloud.com/tracks/324206087/stream",
//"uri":"https://api.soundcloud.com/tracks/324206087",
//"user_id":2982659,
//"artwork_url":"https://i1.sndcdn.com/artworks-WWQ1phnWdKtk-0-large.jpg",
//"comment_count":386,
//"commentable":true,
//"description":null,
//"download_count":0,
//"downloadable":false,
//"embeddable_by":"all",
//"favoritings_count":0,
//"genre":"Rap/Hip Hop",
//"isrc":null,
//"label_id":null,
//"label_name":"Guwop Enterprises/Atlantic",
//"license":"all-rights-reserved",
//"original_content_size":8368586,
//"original_format":"mp3",
//"playback_count":0,
//"purchase_title":null,
//"purchase_url":null,
//"release":"",
//"release_day":26,
//"release_month":5,
//"release_year":2017,
//"reposts_count":16484,
//"state":"finished",
//"streamable":true,
//"tag_list":"",
//"track_type":null,
//"user":{
//    "avatar_url":"https://i1.sndcdn.com/avatars-000504076122-8rzxp8-large.jpg",
//    "id":2982659,
//    "kind":"user",
//    "permalink_url":"http://soundcloud.com/flameemojimusic",
//    "uri":"https://api.soundcloud.com/users/2982659",
//    "username":"Gucci Mane",
//    "permalink":"flameemojimusic",
//    "last_modified":"2018/12/07 05:27:45 +0000"
//},
//"likes_count":265558,
//"attachments_uri":"https://api.soundcloud.com/tracks/324206087/attachments",
//"bpm":null,
//"key_signature":"",
//"user_favorite":false,
//"user_playback_count":null,
//"video_url":null,
//"download_url":null
