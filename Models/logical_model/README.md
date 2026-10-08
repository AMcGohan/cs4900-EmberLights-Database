# Group Logical Model
![Group Logical Model](GroupLogicalModel.png)


## Tables
*Note: only PK and FK attributes are included for brevity*
- Album
    - albumID, PK
- Songs
    - songID, PK
    - genreID, FK
    - albumID, FK
- PlaylistSongs
    - songID, PK, FK
    - playlistID, PK, FK
- Playlists
    - playlistID, PK
    - genreID, FK
- Genre (lookup-table)
    - genreID, PK


*decision to keep genre attached to song rather than on album was based on the primary purpose of this app being to bring lesser known artists to light. Niche albums can often be made with the intention of having many different genres in a single album* 